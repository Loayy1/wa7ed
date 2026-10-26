import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wa7ed/core/custom_widget/bg_view.dart';
import 'package:wa7ed/feature/auth/presentation/cubit/login_cubit.dart';
import 'package:wa7ed/feature/auth/presentation/states/login_states.dart';
import 'package:wa7ed/feature/auth/presentation/view/signin_view.dart';
import 'package:wa7ed/feature/home/presention/view.dart';

import '../../../../../core/logic/helper_methods.dart';

class const LoginView({super.key}) extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(
        builder: (context) {
          final cubit =BlocProvider.of<LoginCubit>(context);
          return Scaffold(
            body: BgView(),
            bottomSheet: BottomSheet(
              backgroundColor: Color(0xffFFFFFF),
              onClosing: () {},
              builder: (context) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: BlocBuilder<LoginCubit,LoginStates>(
                  builder: (context, state) {
                    return Form(
                      onChanged: cubit.updateForm,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "ليس لديك حساب ؟ ",
                                  style: TextStyle(
                                    fontFamily: "IBMPlexSansArabic",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    goTo(page: SignInView());
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                  ),
                                  child: Text(
                                    "إنشاء حساب جديد",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff314158),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text("البريد الإلكتروني"),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller:cubit.emailController ,
                              decoration: InputDecoration(
                                prefixIcon: SvgPicture.asset(
                                  "assets/icons/email.svg",
                                  fit: BoxFit.scaleDown,
                                ),
                                hintText: "Name@example.com",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff939393),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text("كلمة المرور"),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: cubit.passwordController,
                              obscureText: cubit.isOccurred,
                              decoration: InputDecoration(
                                hintText: "كلمة المرور",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff939393),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: cubit.togglePassword,
                                  icon: SvgPicture.asset(
                                    "assets/icons/visibility_${cubit.isOccurred ? "off" : "on"}.svg",
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  minimumSize: Size.zero,
                                ),
                                child: Text(
                                  "هل نسيت كلمة المرور ؟",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 24),
                            SizedBox(
                              height: 56,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed:
                                cubit.emailController.text.isEmpty ||
                                    cubit.passwordController.text.isEmpty
                                    ? null
                                    : () {
                                  goTo(page: HomeView());
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  disabledBackgroundColor: Color(0xffEAEAEA),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  "تسجيل الدخول",
                                  style: TextStyle(
                                    fontFamily: "IBMPlexSansArabic",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Color(0xffEAEAEA),
                                    height: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    "أو تـــــــابــع بواسطة",
                                    style: TextStyle(color: Color(0xff939393)),
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
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    side: BorderSide(color: Color(0xffEAEAEA)),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 45,
                                      vertical: 14,
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset("assets/icons/apple.svg"),
                                      SizedBox(width: 4),
                                      Text("Apple"),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 12),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    side: BorderSide(color: Color(0xffEAEAEA)),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 45,
                                      vertical: 14,
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset("assets/icons/google.svg"),
                                      SizedBox(width: 4),
                                      Text("Google"),
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
        }
      ),
    );
  }
}
