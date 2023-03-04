import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
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
            //makeList를 메소드로 바꿨다
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot))
                //LisView의 크기를 지정해주기 위한 것
              ],
            );
            //Text 대신에 ListView 사용
            //많은 양의 데이터를 연속적으로 보여주고 싶을 때 사용
          }
          return const Center(
            child: CircularProgressIndicator(),
            //이전에는 Loading...을 print 했다면 이제는 로딩 아이콘이 돌아간다
          );
        },
        future: webtoons,
        //future에는 기다려야하는 값인 webtoons를 할당
        //FutureBuilder가 자동으로 await를 적용시켜준다
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      //그냥 ListView를 사용하는 것보다 좀 더 최적화되었다
      scrollDirection: Axis.horizontal,
      //스크롤 방향: 수평
      itemCount: snapshot.data!.length,
      //총 웹툰의 개수
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      //사진 간 좌우 간격 설정해 주기 위해서
      itemBuilder: (context, index) {
        // print(index);
        //사용자가 보고 있는 아이템만 build가능
        //사용자가 보고 있지 않으면 ListView.builder는 해당 아이템을 삭제
        //itemBuilder는 인덱스가 0, 1, 2...인 아이템이 build 됐다고 알려준다
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
      //ListView.separated는 separatorBuilder 위젯을 필수로 한다
      //이 위젯은 리스트 아이템 사이에 렌더된다(?)
      //실행하면 width를 20으로 갖고 텍스트가 배치된다
    );
  }
}
