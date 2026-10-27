import 'package:flutter/material.dart';
import '../models/auth_data.dart';
import 'confirm_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  final AuthData authData;
  const ResetPasswordScreen({super.key, required this.authData});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  void _handleNext() {
    // Bỏ qua kiểm tra mật khẩu khớp hay không, gõ gì lấy nấy
    widget.authData.password = _passController.text;

    // Truyền tiếp sang Màn 4
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ConfirmScreen(authData: widget.authData)),
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
              const Text('Create new password', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),

              TextField(
                controller: _passController,
                decoration: const InputDecoration(prefixIcon: Icon(Icons.lock_outline), hintText: 'Password (gõ gì cũng được)', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _confirmPassController,
                decoration: const InputDecoration(prefixIcon: Icon(Icons.lock_outline), hintText: 'Confirm Password (gõ gì cũng được)', border: OutlineInputBorder()),
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