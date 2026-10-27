import 'package:flutter/material.dart';
import '../models/auth_data.dart';

class ConfirmScreen extends StatelessWidget {
  final AuthData authData;
  const ConfirmScreen({super.key, required this.authData});

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
              const Text('Confirm', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),

              // Hiển thị lại dữ liệu đã gõ (dùng readOnly để không cho sửa)
              TextField(
                controller: TextEditingController(text: authData.email),
                readOnly: true,
                decoration: const InputDecoration(prefixIcon: Icon(Icons.person_outline), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: TextEditingController(text: authData.otp),
                readOnly: true,
                decoration: const InputDecoration(prefixIcon: Icon(Icons.email_outlined), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: TextEditingController(text: authData.password),
                readOnly: true,
                obscureText: true,
                decoration: const InputDecoration(prefixIcon: Icon(Icons.lock_outline), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // 1. Xóa các màn hình trung gian (Màn 2, Màn 3, Màn 4)
                    // và đưa Màn 1 (ForgotPasswordScreen) lên đầu, kèm dữ liệu trả về
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('Summit', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}