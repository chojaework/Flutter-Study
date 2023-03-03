import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        //FutureBuilder는 future 값을 기다리고, 데이터가 존재하는지 알려준다
        builder: (context, snapshot) {
          //builder는 UI를 그려주는 함수
          //snapshot은 Future의 상태 -> 로딩중인지, 데이터가 있는지, 에러가 났는지 알 수 있다
          if (snapshot.hasData) {
            return const Text("There is data!");
          }
          return const Text('Loading....');
        },
        future: webtoons,
        //future에는 기다려야하는 값인 webtoons를 할당
        //FutureBuilder가 자동으로 await를 적용시켜준다
      ),
    );
  }
}
