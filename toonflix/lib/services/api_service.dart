import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  //api의 baseUrl
  final String today = "today";
  //baseUrl 접속해보면 오늘의 웹툰을 만들기 위해서 /today 눌러야 하므로
  //baseUrl에 today를 추가한 URL에서 데이터를 가져온다
  //그리고 JSON 데이터로 그 리스트를 받는다

  //URL에 요청을 보내기 위해서는 http라는 패키지를 먼저 설치해야 한다
  //pub.dev로 접속해서 http라고 검색하고 설치
  //https://pub.dev/packages/http/install 접속해도된다
  //설치 방법은 동영상 3:13 참고

  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      //response.body를 json으로 변환하는 것
      //dynamic은 타입이 없는 변수
      for (var webtoon in webtoons) {
        // print(webtoon);
        // final toon = WebtoonModel.fromJson(webtoon);
        // print(toon.title);
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
