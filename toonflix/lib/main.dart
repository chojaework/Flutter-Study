import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  //이전에 사용한 StatelessWidget은 build 메서드를 통해 단지 UI만 출력
  //App이 StatefulWidget을 상속
  //다시 말해서 App class는 StatefulWidget이 가지고 있는 걸 전부 포함
  const App({super.key});

  @override
  State<App> createState() => _AppState();
  //StatefulWidget에 있는 createState() State에 추가하기 위한 함수
}
//Stateful Widget의 첫 번째 부분: state가 없는 위젯

class _AppState extends State<App> {
  //StatefulWidget의 두 번째 부분: state가 있는 위젯
  //state가 바뀌면 ui 새로고침되면서 업데이트
  //State<App>는 data(ex. counter)와 ui를(ex. Text) 갖는다
  int counter = 0;

  void onClicked() {
    counter = counter + 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xfff4eddb),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                '$counter',
                style: const TextStyle(fontSize: 30),
              ),
              IconButton(
                  iconSize: 40,
                  onPressed: onClicked,
                  icon: const Icon(
                    Icons.add_box_rounded,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
//State가 바뀔 때마다 UI가 새로고침되면서 최신 데이터를 보여준다