import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/logic/helper_methods.dart';
import 'feature/auth/presentation/view/signin_view.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Wa7ed",
      navigatorKey: navKey,
      debugShowCheckedModeBanner: false,
      home: SignInView(),
      theme: ThemeData(
        fontFamily: "IBMPlexSansArabic",
        scaffoldBackgroundColor: Color(0xffFFFFFF),
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xffEAEAEA)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xffEAEAEA)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffEAEAEA)),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xffEAEAEA)),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xff000000),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xff000000),
          selectionColor: Color(0xff000000),
          selectionHandleColor: Color(0xff000000),
        )
      ),
      locale: Locale('ar'),
      supportedLocales: [Locale('ar'), Locale('en')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    ),
  );
}
