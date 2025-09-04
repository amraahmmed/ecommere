import 'package:ecommere/screens/forgot_password_view.dart';
import 'package:ecommere/screens/get_started.dart';
import 'package:ecommere/screens/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/social_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Text(
                "Welcome\nBack!",
                style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                label: "Username or Email",
                prefixIcon: Icons.person,
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                label: "Password",
                prefixIcon: Icons.lock,
                obscure: true,
                suffixIcon: const Icon(Icons.visibility),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordView(),
                    ),
                  ),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color.fromRGBO(248, 55, 88, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              PrimaryButton(
                text: "Login",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GetStartedPage()),
                  );
                },
              ),
              SizedBox(height: 40.h),
              Center(
                child: Text(
                  "- OR Continue with -",
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    asset: "assets/images/google.png",
                    onTap: () {},
                    isSvg: false,
                  ),
                  SizedBox(width: 20.w),
                  SocialButton(
                    asset: "assets/svg/apple 1.svg",
                    onTap: () {},
                    isSvg: true,
                  ),
                  SizedBox(width: 20.w),
                  SocialButton(
                    asset: "assets/svg/facebook.svg",
                    onTap: () {},
                    isSvg: true,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpView()),
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: "Don’t have an Account? ",
                      style: TextStyle(fontSize: 14.sp),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color.fromRGBO(248, 55, 88, 1),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: const Color.fromRGBO(
                              248,
                              55,
                              88,
                              1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
