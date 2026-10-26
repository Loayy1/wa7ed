import 'package:flutter/material.dart';
import 'package:wa7ed/core/custom_widget/bg_view.dart';
import 'package:wa7ed/core/logic/helper_methods.dart';
import 'package:wa7ed/feature/auth/presentation/view/login_view.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgView(),
      bottomSheet: BottomSheet(
        backgroundColor: Color(0xffFFFFFF),
        onClosing: () {
          goTo(page: LoginView());
        },
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "إطلالة تليق بك",
                style: TextStyle(
                  fontFamily: "IBMPlexSansArabic",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "تسوّق أو استأجر بدلتك المفضلة بخطوات بسيطة وتجربة فاخرة.",
                style: TextStyle(
                  fontFamily: "IBMPlexSansArabic",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff314158),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    goTo(page: LoginView());
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    "البدء الآن",
                    style: TextStyle(
                      fontFamily: "IBMPlexSansArabic",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
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
