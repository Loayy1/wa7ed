import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wa7ed/core/custom_widget/bg_view.dart';
import 'package:wa7ed/feature/auth/presentation/cubit/signin_cubit.dart';
import 'package:wa7ed/feature/auth/presentation/states/signin_states.dart';
import 'package:wa7ed/feature/auth/presentation/view/login_view.dart';
import 'package:wa7ed/feature/auth/presentation/view/verify_view.dart';

import '../../../../core/custom_widget/custom_password_field.dart';
import '../../../../core/custom_widget/custom_text_field.dart';
import '../../../../core/logic/helper_methods.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: Builder(
        builder: (context) {
          final cubit = BlocProvider.of<SignInCubit>(context);
          return Scaffold(
            body: const BgView(),
            bottomSheet: BottomSheet(
              backgroundColor: const Color(0xffFFFFFF),
              onClosing: () {},
              builder: (context) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: BlocBuilder<SignInCubit, SignInStates>(
                  builder: (context, state) {
                    return Form(
                      onChanged: () {
                        setState(() {});
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "إنشاء حساب",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "لديك حساب بالفعل؟ ",
                                  style: TextStyle(
                                    fontFamily: "IBMPlexSansArabic",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    goTo(page: const LoginView());
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: const Text(
                                    " تسجيل الدخول",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff314158),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 13),
                            CustomTextFormField(
                              hintText: "اكتب اسمك الكامل",
                              controller: cubit.nameController,
                              label: "الاسم بالكامل",
                              icon: "assets/icons/profile.svg",
                            ),
                            const SizedBox(height: 7),
                            const Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "رقم الهاتف",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: cubit.phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 12,
                                ),
                                prefixIcon: SvgPicture.asset(
                                  "assets/icons/call.svg",
                                  fit: BoxFit.scaleDown,
                                ),
                                hintText: "أدخل رقم الهاتف",
                                hintStyle: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff939393),
                                ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(width: 8),
                                    Container(
                                      height: 20,
                                      width: 1,
                                      color: const Color(0xffEAEAEA),
                                    ),
                                    const SizedBox(width: 8),
                                    DropdownButton<String>(
                                      value: cubit.selectedCountryCode,
                                      underline: const SizedBox(),
                                      icon: const SizedBox.shrink(),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                      dropdownColor: Colors.white,
                                      items: const [
                                        DropdownMenuItem(
                                          value: "+20",
                                          child: Text(
                                            "+20",
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Color(0xff939393),
                                            ),
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: "+966",
                                          child: Text(
                                            "+966",
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Color(0xff939393),
                                            ),
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: "+971",
                                          child: Text(
                                            "+971",
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Color(0xff939393),
                                            ),
                                          ),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        if (value != null) {
                                          setState(() {
                                            cubit.selectedCountryCode = value;
                                          });
                                        }
                                      },
                                    ),
                                    const SizedBox(width: 8),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: cubit.emailController,
                              hintText: "Name@example.com",
                              label: "البريد الإلكتروني",
                              icon: "assets/icons/email.svg",
                            ),
                            const SizedBox(height: 8),
                            CustomPasswordFieldView(
                              passwordController: cubit.passwordController,
                              isOccurred: cubit.isOccurred,
                              onToggle: cubit.togglePassword,
                              label: "كلمة المرور",
                              hintText: "كلمة المرور",
                            ),
                            const SizedBox(height: 8),
                            CustomPasswordFieldView(
                              passwordController:
                                  cubit.confirmPasswordController,
                              isOccurred: cubit.confirmIsOccurred,
                              onToggle: cubit.confirmTogglePassword,
                              label: "تأكيد كلمة المرور",
                              hintText: "تأكيد كلمة المرور",
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              height: 48,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed:
                                    cubit.nameController.text.trim().isEmpty ||
                                            cubit.phoneController.text
                                                .trim()
                                                .isEmpty ||
                                            cubit.emailController.text
                                                .trim()
                                                .isEmpty ||
                                            cubit.passwordController.text
                                                .trim()
                                                .isEmpty ||
                                            cubit.confirmPasswordController.text
                                                .trim()
                                                .isEmpty
                                        ? null
                                        : () {
                                            goTo(page: const VerifyView());
                                          },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  disabledBackgroundColor: const Color(
                                    0xffEAEAEA,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  "إنشاء حساب",
                                  style: TextStyle(
                                    fontFamily: "IBMPlexSansArabic",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Color(0xffEAEAEA),
                                    height: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    "أو تـــــــابــع بواسطة",
                                    style: TextStyle(
                                      color: Color(0xff939393),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Color(0xffEAEAEA),
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    side: const BorderSide(
                                      color: Color(0xffEAEAEA),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 36,
                                      vertical: 10,
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset("assets/icons/apple.svg"),
                                      const SizedBox(width: 4),
                                      const Text("Apple"),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    side: const BorderSide(
                                      color: Color(0xffEAEAEA),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 36,
                                      vertical: 10,
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset("assets/icons/google.svg"),
                                      const SizedBox(width: 4),
                                      const Text("Google"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
