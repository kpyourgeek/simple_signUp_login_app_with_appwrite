// very good way to use common textfield if needed take a deep look please

import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final TextEditingController myController;
  final String hintText;

  const AuthField(
      {super.key, required this.myController, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
