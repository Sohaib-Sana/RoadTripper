import 'package:flutter/material.dart';
import 'package:tour_guide/core/app_pallet.dart';

class CustomAuthField extends StatefulWidget {
  CustomAuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.isObsecure = false,
    required this.validatorii,
    this.isPasswordField = false,
  });
  final String hintText;
  final TextEditingController controller;
  bool isObsecure;
  final TextInputType? keyboardType;
  final String? Function(String?) validatorii;
  final bool isPasswordField;

  @override
  State<CustomAuthField> createState() => _CustomAuthFieldState();
}

class _CustomAuthFieldState extends State<CustomAuthField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      color: AppPallet.textFieldPrimaryColor,
      surfaceTintColor: AppPallet.textFieldPrimaryColor,
      borderRadius: BorderRadius.circular(30),
      child: TextFormField(
        validator: widget.validatorii,
        decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.all(20),
            suffixIcon: widget.isPasswordField
                ? IconButton(
                    icon: widget.isObsecure
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        widget.isObsecure = !widget.isObsecure;
                      });
                    },
                  )
                : null),
        controller: widget.controller,
        obscureText: widget.isObsecure,
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
