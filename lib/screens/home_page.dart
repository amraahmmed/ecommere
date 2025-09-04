import 'package:ecommere/screens/all_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> deals = [
      {
        'image': 'assets/images/image 15.png',
        'title': 'Smart Watch',
        'price': '\$150.00',
        'oldPrice': '\$200.00',
      },
      {
        'image': 'assets/images/image 16.png',
        'title': 'Wireless Headphones',
        'price': '\$80.00',
        'oldPrice': '\$120.00',
      },
      {
        'image': 'assets/images/off1.png',
        'title': 'Digital Camera',
        'price': '\$300.00',
        'oldPrice': '\$400.00',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: SvgPicture.asset('assets/svg/appbarlogo.svg', height: 32.h),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/appbaraction1.png',
              width: 24.w,
              height: 24.h,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 12.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search any Product",
                  prefixIcon: const Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  'All Featured',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.sort, size: 24.sp, color: Colors.black54),
                  onPressed: () {},
                ),
                SizedBox(width: 4.w),
                IconButton(
                  icon: Icon(Icons.filter_list_sharp, size: 24.sp, color: Colors.black54),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 100.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _CategoryItem(image: 'assets/images/beauty.png', title: 'Beauty'),
                  _CategoryItem(image: 'assets/images/fasgion.png', title: 'Fashion'),
                  _CategoryItem(image: 'assets/images/kids.png', title: 'Kids'),
                  _CategoryItem(image: 'assets/images/mens.png', title: 'Mens'),
                  _CategoryItem(image: 'assets/images/womnes.png', title: 'Womens'),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    'assets/images/off1.png',
                    height: 160.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 16.w,
                  top: 20.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "30% OFF",
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        "On all beauty products",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 14.h),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          "Shop Now",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: const Color(0xFF4392f9),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deal of the Day',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '22h 55m 20s remaining ',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    child: const Text(
                      'View all',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 220.h,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 4),
                scrollDirection: Axis.horizontal,
                itemCount: deals.length,
                itemBuilder: (context, index) {
                  final deal = deals[index];
                  return Container(
                    width: 160.w,
                    margin: EdgeInsets.only(right: 16.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                          child: Image.asset(
                            deal['image']!,
                            height: 120.h,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                deal['title']!,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                children: [
                                  Text(
                                    deal['price']!,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    deal['oldPrice']!,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.sp,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.asset('assets/images/Rectangle 56.png'),
              title: Text(
                'Special Offers',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                'We make sure you get the offer you need at best prices',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String image;
  final String title;

  const _CategoryItem({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.w),
      width: 80.w,
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              image,
              width: 60.w,
              height: 60.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}