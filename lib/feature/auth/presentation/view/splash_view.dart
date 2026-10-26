import 'package:flutter/material.dart';
import 'package:wa7ed/core/logic/helper_methods.dart';
import 'package:wa7ed/feature/auth/presentation/view/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  
  
  @override
  void initState() {
    super.initState();
    goTo(page: OnBoardingView(),second: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}