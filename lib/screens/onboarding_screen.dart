import 'package:ecommere/screens/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _controller;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final pages = const [
    OnboardPage(
      svgPath: 'assets/svg/fashion shop-rafiki 1.svg',
      title: 'Choose Products',
      body:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
    ),
    OnboardPage(
      svgPath: 'assets/svg/Sales consulting-pana 1.svg',
      title: 'Make Payment',
      body:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
    ),
    OnboardPage(
      svgPath: 'assets/svg/Shopping bag-rafiki 1.svg',
      title: 'Get Your Order',
      body:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
    ),
  ];

  void _next() {
    if (_index < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      _finish();
    }
  }

  void _prev() {
    if (_index > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _finish() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 15.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${_index + 1}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: "/${pages.length}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _finish,
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (i) => setState(() => _index = i),
                children: pages,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 30.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_index > 0)
                    TextButton(
                      onPressed: _prev,
                      child: Text(
                        "Prev",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black26,
                        ),
                      ),
                    )
                  else
                    SizedBox(width: 60.w),
                  DotsIndicator(
                    dotsCount: pages.length,
                    position: _index.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: Colors.black87,
                      color: Colors.black26,
                      size: Size.square(8.w),
                      activeSize: Size(18.w, 8.h),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _next,
                    child: Text(
                      _index < pages.length - 1 ? "Next" : "Get Started",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color.fromRGBO(248, 55, 88, 1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardPage extends StatelessWidget {
  const OnboardPage({
    super.key,
    required this.svgPath,
    required this.title,
    required this.body,
  });

  final String svgPath;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(svgPath, height: 250.h),
          SizedBox(height: 40.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          Text(
            body,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.black54,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}