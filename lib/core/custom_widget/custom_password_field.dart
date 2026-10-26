import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomPasswordFieldView extends StatefulWidget {
  final TextEditingController passwordController;
  final bool isOccurred;
  final VoidCallback? onToggle;
  final dynamic cubit;
  final String label;
  final String hintText;

  const CustomPasswordFieldView({
    super.key,
    required this.passwordController,
    this.isOccurred = true,
    this.onToggle,
    this.cubit,
    this.label = "كلمة المرور",
    this.hintText = "كلمة المرور",
  });

  @override
  State<CustomPasswordFieldView> createState() => _CustomPasswordFieldViewState();
}

class _CustomPasswordFieldViewState extends State<CustomPasswordFieldView> {
  late bool _localIsOccurred;

  @override
  void initState() {
    super.initState();
    _localIsOccurred = widget.isOccurred;
  }

  @override
  Widget build(BuildContext context) {
    final bool effectiveObscure = widget.onToggle != null
        ? widget.isOccurred
        : (widget.cubit != null
            ? (widget.cubit.isOccurred as bool)
            : _localIsOccurred);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            widget.label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: widget.passwordController,
          obscureText: effectiveObscure,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xff939393),
            ),
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
              onPressed: () {
                if (widget.onToggle != null) {
                  widget.onToggle!();
                } else if (widget.cubit != null) {
                  try {
                    widget.cubit.togglePassword();
                  } catch (_) {}
                } else {
                  setState(() {
                    _localIsOccurred = !_localIsOccurred;
                  });
                }
              },
              icon: SvgPicture.asset(
                "assets/icons/visibility_${effectiveObscure ? "off" : "on"}.svg",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
