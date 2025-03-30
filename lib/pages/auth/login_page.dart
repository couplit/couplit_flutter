import 'package:couplit/pages/auth/email_login_page.dart';
import 'package:flutter/material.dart';
import 'package:couplit/widgets/auth/social_login_button.dart';
import 'package:couplit/utils/app_theme.dart';
import 'package:flutter/services.dart';
import 'package:couplit/pages/auth/signup_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: size.height * 0.08),

                // 앱 로고 (원형 아이콘)
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppTheme.primaryColor, Color(0xFF9E85FF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryColor.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // 앱 제목과 부제목
                const Text(
                  '둘이 정산',
                  style: AppTheme.headingStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  '커플 생활비 정산, 더 쉽게',
                  style: AppTheme.subHeadingStyle,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: size.height * 0.08),

                // 소셜 로그인 버튼들

                const SizedBox(height: 24),

                GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    print("Kakao 로그인 시도");
                  },
                  child: Image.asset(
                    'assets/images/kakao_login_button.png',
                    width: double.infinity,
                    height: 50,
                  ),
                ),

                const SizedBox(height: 16),

                const SocialLoginButton(
                  provider: 'apple',
                  text: 'Apple로 로그인',
                  icon: 'apple',
                  backgroundColor: AppTheme.appleColor,
                  textColor: Colors.white,
                ),

                const SizedBox(height: 16),

                // 이메일 로그인 버튼
                OutlinedButton(
                  onPressed: () {
                    // 이메일 로그인 화면으로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EmailLoginScreen()),
                    );
                  },
                  child: const Text('이메일로 로그인'),
                ),

                const SizedBox(height: 24),

                // 회원가입 링크
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '아직 회원이 아니신가요?',
                      style: TextStyle(
                        color: AppTheme.subTextColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // 회원가입 페이지로 이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        '회원가입',
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
