import 'package:ecommere/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommere/cubit/post_cubit.dart';
import 'package:ecommere/cubit/cart_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => PostCubit()),
            BlocProvider(create: (context) => CartCubit()),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: OnboardingScreen(),
          ),
        );
      },
    );
  }
}