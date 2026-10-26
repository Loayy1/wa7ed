import 'package:flutter/material.dart';

class VerifyContainer extends StatelessWidget {
  const VerifyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 48,
        width: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0x66314158),
              blurRadius: 0,
              spreadRadius: 2,
              offset: Offset.zero,
            ),
          ],
        ),
        child: TextFormField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: const InputDecoration(
            counterText: "",
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
