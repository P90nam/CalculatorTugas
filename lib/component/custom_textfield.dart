import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyTextfield extends StatelessWidget {
  final String myHint;
  final TextEditingController txtController;
  final double radius;
  final IconData? icon;
  final bool isPassword;

  const MyTextfield({
    super.key,
    required this.myHint,
    required this.txtController,
    required this.radius,
    this.icon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*\.?[0-9]*$'))],
      controller: txtController,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: myHint,
        prefixIcon: icon == null ? null : Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
