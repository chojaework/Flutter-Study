import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Hey, Selena',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Text(
                'Total Balance',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                '\$5 194 482',
                style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Button(
                      text: 'Transfer',
                      bgColor: Color(0xfff1b33b),
                      textColor: Colors.black),
                  Button(
                      text: 'Request',
                      bgColor: Color(0xff1f2123),
                      textColor: Colors.white),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                //바닥에 붙도록 만들기 위해서
                crossAxisAlignment: CrossAxisAlignment.end,
                //둘을 양옆으로 떨어뜨리기 위해서
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //원래 children: const [ 였는데 Opacity는 정확한 값을 알기 어렵기 때문에 오류를 발생시킨다.
                //이를 해결하기 위해 const를 지워줘야 한다.
                children: [
                  const Text(
                    'Wallets',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                //넘치는 부분을 자르기 위해 사용
                decoration: BoxDecoration(
                  color: const Color(0xff1f2123),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Euro',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                '6 428',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'EUR',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Transform.scale(
                        // 로고가 넘치게끔 만들기 위해 scale 위젯으로 Wrap 한다
                        scale: 2.2, //배 넘친다
                        child: Transform.translate(
                          //로고를 아래로 내리기 위해 translate 위젯으로 Wrap 한다
                          offset:
                              const Offset(-5, 12), //x축으로 -5만큼, y축으로 12만큼 이동
                          child: const Icon(
                            Icons.euro_rounded,
                            color: Colors.white,
                            size: 88, //size값을 변경하면 카드 자체가 커진다
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
