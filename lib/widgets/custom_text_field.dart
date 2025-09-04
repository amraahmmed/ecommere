import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData prefixIcon;
  final bool obscure;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.obscure = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h,),
        filled: true,
        fillColor: const Color.fromARGB(255, 238, 238, 238),
        labelText: label,
        prefixIcon: Icon(
          prefixIcon,
          color: const Color.fromARGB(255, 97, 97, 97),
        ),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        labelStyle: TextStyle(
          color: Colors.black87,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}

