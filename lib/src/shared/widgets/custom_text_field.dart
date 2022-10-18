import 'package:flutter/material.dart';

class CustomTextField extends TextField {
  const CustomTextField(
      {super.key,
      super.onChanged,
      super.decoration = const InputDecoration(),
      super.controller});
}
