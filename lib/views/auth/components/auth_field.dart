import 'package:blog_snake/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthField extends StatefulWidget {
  const AuthField(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.autoFocus,
      required this.obscureText,
      required this.validatorFunction,
      this.labelStyle,
      this.iconAndTextColor,
      this.colorEnabledBorder, this.maxLength, this.keyboardType, this.maxLines})
      : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool autoFocus;
  final bool obscureText;
  final String? Function(String?) validatorFunction;
  final TextStyle? labelStyle;
  final Color? iconAndTextColor;
  final Color? colorEnabledBorder;
  final int? maxLength;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  late bool isObscureText;

  @override
  void initState() {
    isObscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding/0.9),
      child: TextFormField(
        maxLines: widget.maxLines ?? 1,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        maxLength: widget.maxLength,
        controller: widget.controller,
        autofocus: widget.autoFocus,
        obscureText: isObscureText,
        validator: widget.validatorFunction,
        style: TextStyle(color: widget.iconAndTextColor ?? Colors.white),
        decoration: InputDecoration(
          suffixIcon: widget.obscureText
              ? IconButton(
                  padding: const EdgeInsets.only(right: kDefaultPadding),
                  onPressed: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  icon: FaIcon(
                    isObscureText
                        ? FontAwesomeIcons.eyeSlash
                        : FontAwesomeIcons.solidEye,
                    color: widget.iconAndTextColor ?? Colors.white,
                    size: 20,
                  ),
                )
              : null,
          label: Text(widget.labelText),
          labelStyle: widget.labelStyle ??
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: widget.colorEnabledBorder ?? Colors.white)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
