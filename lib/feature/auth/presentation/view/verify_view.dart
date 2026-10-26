import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wa7ed/core/logic/helper_methods.dart';
import 'package:wa7ed/feature/auth/presentation/view/signin_view.dart';

import '../../../../core/custom_widget/custom_verify_container.dart';
import '../cubit/verify_cubit.dart';
import '../states/verify_states.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyCubit()..startTimer(),
      child: Builder(
        builder: (context) {
          final cubit = BlocProvider.of<VerifyCubit>(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 44,
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () {
                            goTo(page: SignInView());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: EdgeInsets.zero,
                            side: const BorderSide(color: Color(0xffEAEAEA)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(99),
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "تأكيد البريد الإلكتروني",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "ادخل رمز التحقق المرسل إلي ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "ahmed@gmail.com",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff939393),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          6,
                          (index) => const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: VerifyContainer(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "لم تستلم الرمز ؟",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    BlocBuilder<VerifyCubit, VerifyStates>(
                      builder: (context, state) {
                        final String formattedSeconds =
                            cubit.seconds.toString().padLeft(2, '0');

                        if (cubit.canResend) {
                          return TextButton.icon(
                            onPressed: () {
                              cubit.startTimer();
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            icon: SvgPicture.asset("assets/icons/resend.svg",fit: BoxFit.scaleDown,),
                            label: const Text(
                              "إعادة إرسال الرمز",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          );
                        }

                        return Text(
                          "إعادة الإرسال خلال 00:$formattedSeconds",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff939393),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: cubit.otpCode.length < 6 ? null:() {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: const Color(0xffEAEAEA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "تحقق",
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
        },
      ),
    );
  }
}
