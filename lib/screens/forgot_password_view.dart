import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

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
              SizedBox(height: 50.h),
              Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                label: "Enter your email address",
                prefixIcon: Icons.email,
              ),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "*",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color.fromRGBO(248, 55, 88, 1),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Text(
                      "We will send you a message to set or reset your new password",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              PrimaryButton(
                text: "Submit",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}