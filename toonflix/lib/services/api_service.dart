import 'package:http/http.dart' as http;
//패키지에 namespace를 지정해주고 아래 get함수 쓸 때 http.get(url)로 적는다

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  //api의 baseUrl
  final String today = "today";
  //baseUrl 접속해보면 오늘의 웹툰을 만들기 위해서 /today 눌러야 하므로
  //baseUrl에 today를 추가한 URL에서 데이터를 가져온다
  //그리고 JSON 데이터로 그 리스트를 받는다

  //URL에 요청을 보내기 위해서는 http라는 패키지를 먼저 설치해야 한다
  //pub.dev로 접속해서 http라고 검색하고 설치
  //https://pub.dev/packages/http/install 접속해도 된다
  //설치 방법은 동영상 3:13 참고

  void getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    //get함수가
    //Future<Response> get(Uri url, {Map<String, String>? headers})
    //형태여야 하기 때문에 url을 Uri 이용해서 만든다

    //get 함수의 return 타입은 Future이고 Future안에는 Response라는 타입 사용
    //get 함수는 Future 타입이기 때문에 미래에 완료될 것
    //하지만 완료가 되었을 때 Response라는 타입을 반환할 것
    //Response에는 서버의 응답에 대한 정보가 담겨 있을 것이라는 뜻
    //Future는 미래에 받을 값이 타입을 알려준다
    final response = await http.get(url);
    //get 함수는 http로부터 불러올 수 있는 함수
    //get 함수 이름이 구체적이지 않아서 2줄 작성
    //await: 우리는 이 함수가 결과를 낼 때까지 다음 줄을 수행하는걸 미루고 싶은 것이다
    //await를 사용하려면 async 함수 내에서 써야 한다

    //final response = 이라고 적어주면 await한 후 Future이 없어지고 Response타입이 남는 것
    if (response.statusCode == 200) {
      // print('hi');
      print(response.body);
      //response.body에는 데이터 저장되어 있을 것이다
      return;
    }
    throw Error();
  }
}
