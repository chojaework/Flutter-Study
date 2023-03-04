import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;
  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Tap 했을 때 수행할 함수를 정의하는 것
        // print('take me home');
        Navigator.push(
          //Navigator로 새 route를 push 하고 있다
          //route는 MaterialPageRoute이고 그 route는 StatelessWidget인 DetailScreen을 렌더할 것이다
          //화면이 새 페이지로 넘어가는 애니메이션 효과를 주기 때문에 유저가 다른 페이지로 왔다고 느끼게 해줄 수 있다
          //사실은 또 다른 statelesswidget을 렌더했을 뿐
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(
                    title: title,
                    thumb: thumb,
                    id: id,
                  ),
              fullscreenDialog: true),
          //fullscreenDialog 설정하면 화면이 아래에서부터 올라온다
        );
        //push하려면 context랑 route가 필요한데, route는 DetailScreen 같은 위젯과 다르다
        //route는 DetailScreen 같은 StatelessWidget을 애니메이션 효과로 감싸서 스크린처럼 보이도록 하겠다는 것
      },
      child: Column(
        children: [
          Container(
            width: 250,
            clipBehavior: Clip.hardEdge,
            //clipBehavior는 자식의 부모 영역 침범을 제어하는 방법
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              //그냥 이렇게만 설정하면 clipBehavior 때문에 적용이 안되므로 위에 clipBehavior 설정해줘야 한다
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  //번지는 그라데이션 설정
                  offset: const Offset(10, 10),
                  //그림자 방향 설정
                  color: Colors.black.withOpacity(0.5),
                  //불투명함 설정
                )
              ],
            ),
            child: Image.network(thumb),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
