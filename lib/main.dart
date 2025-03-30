import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:couplit/pages/auth/login_page.dart';
import 'package:couplit/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Flutter 엔진과 위젯 바인딩 초기화를 보장
  WidgetsFlutterBinding.ensureInitialized();

  // 상태바 색상 설정
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '둘이 정산',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(),
      home: const FirebaseInitializer(),
    );
  }
}

// Firebase 초기화를 처리하는 위젯
class FirebaseInitializer extends StatelessWidget {
  const FirebaseInitializer({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // 초기화 중 에러가 발생한 경우
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(
                '앱 초기화 중 오류가 발생했습니다: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        // 초기화가 완료된 경우
        if (snapshot.connectionState == ConnectionState.done) {
          return const LoginScreen();
        }

        // 초기화 중인 경우 로딩 화면 표시
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 앱 로고 (원형 아이콘)
                Container(
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
                const SizedBox(height: 24),
                const Text(
                  '둘이 정산',
                  style: AppTheme.headingStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                const CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
