import 'package:flutter/material.dart';
import '../models/onboarding_item.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/primary_button.dart';
import '../widgets/illustrations.dart';
import 'start_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Dữ liệu OOP sử dụng các Widget minh họa vừa tạo
  // Dữ liệu OOP sử dụng các Widget minh họa vừa tạo
  final List<OnboardingItem> _items = [
    OnboardingItem(
      title: 'Mọi việc, gọn trong một chỗ',
      description: 'Ghi lại bài tập, việc nhà, lịch hẹn. Không còn quên việc nào.',
      illustration: TodoListIllustration(),
    ),
    OnboardingItem(
      title: 'Chia theo Học tập và Cuộc sống',
      description: 'Mỗi việc có nhóm riêng, nhìn là biết hôm nay cần làm gì.',
      illustration: TagsIllustration(),
    ),
    OnboardingItem(
      title: 'Nhắc đúng lúc',
      description: 'Bật thông báo để UTH Todo nhắc bạn trước hạn chót.',
      illustration: NotificationIllustration(),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 1. HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A62E5),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(Icons.check, color: Colors.white, size: 14),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'UTH Todo',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Bỏ qua', style: TextStyle(color: Colors.grey, fontSize: 13)),
                  ),
                ],
              ),
            ),

            // 2. PAGEVIEW
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(item: _items[index]);
                },
              ),
            ),

            // 3. FOOTER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                children: [
                  // Dấu chấm tròn
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(_items.length, (index) => buildDot(index)),
                  ),
                  const SizedBox(height: 24),

                  // Nút bấm
                  PrimaryButton(
                    text: _currentPage == _items.length - 1 ? 'Bắt đầu ngay' : 'Tiếp tục',
                    onPressed: () {
                      if (_currentPage == _items.length - 1) {
                        // Chuyển sang Home (chưa code)
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StartScreen(),
                          ),
                        );

                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 6),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? const Color(0xFF2A62E5) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}