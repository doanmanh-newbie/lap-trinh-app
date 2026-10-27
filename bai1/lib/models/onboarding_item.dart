import 'package:flutter/material.dart';

class OnboardingItem {
  final String title;
  final String description;
  final Widget illustration; // Đã đổi thành Widget

  const OnboardingItem({
    required this.title,
    required this.description,
    required this.illustration, // Đã đổi thành illustration
  });
}