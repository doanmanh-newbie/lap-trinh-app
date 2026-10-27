import 'package:flutter/material.dart';
import '../models/auth_data.dart';
import 'reset_password_screen.dart';

class VerifyCodeScreen extends StatefulWidget {
  final AuthData authData;
  const VerifyCodeScreen({super.key, required this.authData});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController _otpController = TextEditingController();

  void _handleNext() {
    // Gán OTP (gõ gì cũng được) vào data
    widget.authData.otp = _otpController.text;

    // Truyền tiếp sang Màn 3
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResetPasswordScreen(authData: widget.authData)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Text('UTH SmartTasks', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue)),
              const SizedBox(height: 40),
              const Text('Verify Code', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Enter the code we just sent you on your registered Email', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 24),

              TextField(
                controller: _otpController,
                decoration: const InputDecoration(hintText: 'OTP Code (gõ gì cũng được)', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _handleNext,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('Next', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}