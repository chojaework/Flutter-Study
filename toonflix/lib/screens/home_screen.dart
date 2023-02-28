import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 1500;
  bool isRunning = false;
  late Timer timer;
  //late는 나중에 초기화할 거라는 의미
  void onTick(Timer timer) {
    setState(() {
      totalSeconds = totalSeconds - 1;
    });
  }

  void onStartPressed() {
    //재생 버튼이 눌리면 실행하는 함수
    timer = Timer.periodic(
      //기본형: Timer.periodic(duration, (timer) { })
      //periodic은 duration(주기)마다 (timer) {} 이 함수를 실행
      const Duration(seconds: 1), //1초마다 아래의 함수를 실행하겠다는 뜻
      onTick,
    );
    //onTick()는 함수를 실행하는 걸 의미하기 때문에 ()넣지 않아야 한다
    //실행하면서 flutter에서 자동으로 넣어서 실행시켜준다
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    //정지버튼을 누르면
    timer.cancel();
    //timer를 멈추는 기능
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            //Flexible의 역할은 하드 코딩이 아닌값을 만들게 해준다
            //예를 들어, 직접 몇 픽셀 이렇게 사이즈를 지정해주는 게 아니라 1:2:1로 화면을 채워라 처럼 비율로 지정 가능
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              //25:00이라는 숫자가 베젤에 가려져서 안보이는 문제를 해결하기 위한 것
              child: Text(
                '$totalSeconds',
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: isRunning ? onPausePressed : onStartPressed,
                //isRunning 중이라면 정지 버튼을 누른것이고, 아니라면 재생 버튼을 누른것이다
                icon: Icon(isRunning
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outline),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  //Expanded를 안 쓰면 아래 자식들이 왼쪽 하단에만 표시된다
                  //Expanded를 써야지 전체 하단에 표시 가능
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
