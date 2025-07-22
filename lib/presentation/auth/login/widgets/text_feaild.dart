import 'package:flutter/material.dart';
import 'package:social/app/styles/fonts.dart';

class TextFeaildWidget extends StatelessWidget {
  const TextFeaildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFAFAFA),
            hintText: 'Email..',
            hintStyle: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(width: 1, color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 1,
                color: Colors.grey,
              ), // Change to your color
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16),
        TextField(
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFAFAFA),
            hintText: 'Password',
            hintStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(width: 1, color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 1,
                color: Colors.grey,
              ), // Change to your color
            ),
          ),
          obscureText: true,
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Forget Password?', style: AppTextStyles.titleText18()),
          ],
        ),
      ],
    );
  }
}
