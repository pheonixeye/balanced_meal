import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    //TODO: match design

    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
