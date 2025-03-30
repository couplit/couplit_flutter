import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SocialLoginButton extends StatelessWidget {
  final String provider;
  final String text;
  final String icon;
  final Color backgroundColor;
  final Color textColor;

  const SocialLoginButton({
    super.key,
    required this.provider,
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        HapticFeedback.lightImpact();
        print('$provider 로그인 시도');
        // 실제 소셜 로그인 로직
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        shadowColor: backgroundColor.withOpacity(0.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 아이콘 (이미지 또는 아이콘)
          icon == 'apple'
              ? const Icon(Icons.apple, size: 22)
              : Image.asset(
                  icon,
                  width: 22,
                  height: 22,
                ),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
