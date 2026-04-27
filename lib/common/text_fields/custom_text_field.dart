import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter_kit/utils/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final bool hideText;
  final TextInputType? inputType;
  final IconData? suffixIcon;
  final bool showPasswordHideButton;
  final bool forceLowerCase;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.validator,
    this.prefix,
    this.hideText = false,
    this.inputType = TextInputType.text,
    this.showPasswordHideButton = false,
    this.suffixIcon,
    this.forceLowerCase = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText ?? '', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          //styling that you type in text field
          style: GoogleFonts.plusJakartaSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: TColors.black,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.prefix,
            prefixStyle: GoogleFonts.plusJakartaSans(),

            labelStyle: GoogleFonts.plusJakartaSans(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Color(0xff5F5E5E),
            ),

            hintStyle: GoogleFonts.plusJakartaSans(
              color: Color(0xff5F5E5E66).withOpacity(0.4),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffD0D0D0)),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: const Color(0xffD0D0D0)),
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: TColors.errorRed),
              borderRadius: BorderRadius.circular(20),
            ),

            suffixIcon: widget.showPasswordHideButton
                ? IconButton(
                    constraints: const BoxConstraints(
                      maxHeight: 15,
                      maxWidth: 30,
                    ),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                      tapTargetSize: MaterialTapTargetSize.padded,
                    ),
                    icon: Icon(
                      !isPasswordHidden
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 25,
                      color: TColors.black,
                      // opticalSize: 1,
                    ),
                    onPressed: () {
                      isPasswordHidden = !isPasswordHidden;
                      print('HIDDEN: $isPasswordHidden');
                      setState(() {});
                    },
                  )
                : const SizedBox.shrink(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
          obscureText: isPasswordHidden && widget.showPasswordHideButton,
          keyboardType: widget.inputType,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')),
            // TextInputFormatter.withFunction((oldValue, newValue) {
            //   return newValue.copyWith(text: newValue.text.toUpperCase());
            // }),
          ],
        ),
      ],
    );
  }
}