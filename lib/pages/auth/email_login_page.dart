import 'package:flutter/material.dart';
import 'package:couplit/utils/app_theme.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({super.key});

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppTheme.textColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          '이메일로 로그인',
          style: TextStyle(
            color: AppTheme.textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              // 이메일 입력 필드
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 16),
                decoration: AppTheme.textFieldDecoration.copyWith(
                  hintText: '이메일 주소',
                  prefixIcon: const Icon(Icons.email_outlined,
                      color: AppTheme.subTextColor),
                ),
              ),
              const SizedBox(height: 16),

              // 비밀번호 입력 필드
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                style: const TextStyle(fontSize: 16),
                decoration: AppTheme.textFieldDecoration.copyWith(
                  hintText: '비밀번호',
                  prefixIcon: const Icon(Icons.lock_outline,
                      color: AppTheme.subTextColor),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppTheme.subTextColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),

              // 비밀번호 찾기 링크
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // 비밀번호 찾기 화면으로 이동
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    foregroundColor: AppTheme.subTextColor,
                  ),
                  child: const Text('비밀번호를 잊으셨나요?'),
                ),
              ),

              const SizedBox(height: 32),

              // 로그인 버튼
              ElevatedButton(
                onPressed: () {
                  // 로그인 처리 로직
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  print('이메일 로그인 시도: $email, $password');
                },
                child: const Text('로그인'),
              ),

              const Spacer(),

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
            ],
          ),
        ),
      ),
    );
  }
}
