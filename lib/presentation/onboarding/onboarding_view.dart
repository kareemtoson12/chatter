import 'package:flutter/material.dart';
import 'package:social/app/routing/routes.dart';
import 'package:social/app/styles/colros_manager.dart';
import 'package:social/app/styles/fonts.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  void _onNextPressed(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(screenHeight * 0.01),
          decoration: BoxDecoration(gradient: ColorManager.blueWhiteGradient),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/kk.jpg',
                  fit: BoxFit.contain,
                  height: screenHeight * 0.4,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading image: $error');
                    return Container(
                      height: screenHeight * 0.4,
                      color: Colors.grey[300],
                      child: Center(child: Text('Image not found')),
                    );
                  },
                ),
              ),
              const SizedBox(height: 34),
              Text(
                "Connect, Share, and Explore the world around you\nwith our Social Media App!",
                textAlign: TextAlign.center,
                style: AppTextStyles.splashTitleStyle().copyWith(fontSize: 24),
              ),
              const SizedBox(height: 144),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _onNextPressed(context),
                    borderRadius: BorderRadius.circular(8),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: ColorManager.buttonColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        height: 48,
                        alignment: Alignment.center,
                        child: const Text(
                          "Let's go",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
