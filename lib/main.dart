import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:couplit/pages/auth/login_page.dart';
import 'package:couplit/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:couplit/firebase_options.dart'; // 이 import 추가

void main() async {
  // Flutter 엔진과 위젯 바인딩 초기화를 보장
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase 초기화 - 옵션 추가
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      home:
          const LoginScreen(), // Firebase 초기화를 main에서 처리했으므로, 바로 LoginScreen으로 이동
    );
  }
}
