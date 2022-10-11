import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serener/widgets/myColor.dart';

class KTextFormField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isPasswordType;
  final Widget? passwordIcon;
  final validator;
  final double width;

  const KTextFormField(
      {super.key,
      this.passwordIcon,
      required this.hint,
      required this.textEditingController,
      required this.keyboardType,
      required this.obscureText,
      required this.validator,
      required this.width,
      required this.isPasswordType});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: TextFormField(
        validator: validator,
        keyboardType: keyboardType,
        controller: textEditingController,
        obscureText: obscureText,
        enableSuggestions: !isPasswordType,
        autocorrect: !isPasswordType,
        decoration: InputDecoration(
          suffixIcon: isPasswordType ? passwordIcon : null,
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          fillColor: Palette.kFilledColor,
          filled: true,
          hintStyle: GoogleFonts.outfit(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
