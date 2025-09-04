import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final String asset;
  final VoidCallback onTap;
  final bool isSvg;

  const SocialButton({
    super.key,
    required this.asset,
    required this.onTap,
    this.isSvg = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(252, 243, 246, 1),
          border: Border.all(
            color: const Color.fromRGBO(248, 55, 88, 1),
            width: 1.w,
          ),
          shape: BoxShape.circle,
        ),
        child: isSvg
            ? SvgPicture.asset(
                asset,
                width: 24.w,
                height: 24.w,
              )
            : Image.asset(
                asset,
                width: 24.w,
                height: 24.w,
              ),
      ),
    );
  }
}