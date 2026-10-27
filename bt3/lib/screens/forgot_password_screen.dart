import 'package:flutter/material.dart';
import '../models/auth_data.dart';
import 'verify_code_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  AuthData? _returnedData;

  void _handleNext() async {
    // Không cần check rỗng, cứ lấy text (kể cả rỗng) truyền đi
    AuthData data = AuthData(email: _emailController.text);

    // Truyền sang Màn 2 và ĐỢI kết quả trả về từ Màn 4
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VerifyCodeScreen(authData: data)),
    );

    // Nếu có kết quả trả về, cập nhật khung xanh
    if (result != null && result is AuthData) {
      setState(() {
        _returnedData = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text('UTH SmartTasks', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue)),
              const SizedBox(height: 40),
              const Text('Forget Password?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Enter your Email, we will send you a verification code.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 24),

              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'Your Email (gõ gì cũng được)',
                  border: OutlineInputBorder(),
                ),
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
              const Spacer(),

              // Khung xanh hiển thị kết quả cuối cùng (Mũi tên đỏ trong ảnh)
              if (_returnedData != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Text('email: ${_returnedData!.email}', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16)),
                      Text('otp: ${_returnedData!.otp}', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16)),
                      Text('pass: ${_returnedData!.password}', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}