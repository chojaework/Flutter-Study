import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
import 'package:toonflix/services/api_service.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  //위젯은 ID같은 식별자 역할을 하는 key가 있다
  //flutter가 위젯을 빠르게 찾을 수 있게 하기 위한 것이다

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
