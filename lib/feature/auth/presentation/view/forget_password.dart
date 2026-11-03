import 'package:flutter/material.dart';
import 'package:wa7ed/core/logic/helper_methods.dart';
import 'package:wa7ed/feature/auth/presentation/view/login_view.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 44,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        goTo(page: LoginView());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.zero,
                        side: const BorderSide(color: Color(0xffEAEAEA)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99),
                        ),
                        elevation: 0,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      "نسيت كلمة المرور",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 44),
                ],
              ),
              SizedBox(height: 37),
              Text(
                "خطوة 1/ 3",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff314158),
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                width: 115,
                child: Divider(
                  height: 6,
                  color: Color(0xffE5E7EB),
                  thickness: 7,
                  radius: BorderRadius.circular(99),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
