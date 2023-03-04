import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;
  //이용자가 어떤 화면을 클릭했는지 알기 위해 가져와야 한다

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          title, //오늘의 웹툰이 아니라 title을 작성
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //사진을 가운데로 가져온다
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
            ],
          ),
        ],
      ),
    );
  }
}
