import 'package:flutter/material.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    this.buttonColor,
  }) : super(key: key);

  final String buttonName;
  final VoidCallback? onPressed;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor ?? const Color(0xFF7BB3E8),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              buttonName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
