import 'package:chatter/app/routing/routes.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccWidget extends StatelessWidget {
  const AlreadyHaveAccWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Container(height: 1, color: Colors.grey[300])),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'OR',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(child: Container(height: 1, color: Colors.grey[300])),
          ],
        ),

        const SizedBox(height: 40), // Space after OR divider
        // Sign up text
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto', // Default Flutter font
            ),
            children: [
              TextSpan(
                text: "Already have an account? ",
                style: TextStyle(color: Colors.grey[600]),
              ),
              WidgetSpan(
                child: GestureDetector(
                  onTap: () {
                    // Handle sign up action
                    Navigator.pushNamed(context, RoutesNames.login);
                  },
                  child: const Text(
                    'Login ',
                    style: TextStyle(
                      color: Color(0xFF1877F2), // Facebook blue
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
