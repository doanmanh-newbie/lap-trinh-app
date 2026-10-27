import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A62E5),
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen()),
          );
        },
        child: Container(
          width: double.infinity,
          color: Colors.transparent,
          child: Column(
            children: [
              const Spacer(flex: 3),

              // LOGO TỰ VẼ BẰNG CODE
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Icon(
                    Icons.check_circle_outline,
                    size: 60,
                    color: const Color(0xFF2A62E5),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'UTH Todo',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              const Text(
                'Việc học, việc nhà - gọn gàng mỗi ngày',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              const Spacer(flex: 4),

              // Thanh kéo & Version
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Phiên bản 2.1.0',
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}