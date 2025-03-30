import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:couplit/pages/auth/login_page.dart';
import 'package:couplit/utils/app_theme.dart';

void main() {
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
      home: const LoginScreen(),
    );
  }
}
