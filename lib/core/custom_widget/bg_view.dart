import 'package:flutter/material.dart';

class BgView extends StatelessWidget {
  const BgView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/onboarding.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xB2000000)),
          ),
        ],
      ),
    );
  }
}