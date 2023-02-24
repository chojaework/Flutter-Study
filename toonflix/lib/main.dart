import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

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
        body: SingleChildScrollView(
          //원래는 3개의 카드를 생성하면 칸이 부족해서 overflow가 발생하는데 이 위젯으로 wrap 해주면 사라진다
          //스크롤 가능해짐
          child: Padding(
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
                  height: 70,
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
                const CurrencyCard(
                  name: 'Euro',
                  code: "EUR",
                  amount: '6 428',
                  icon: Icons.euro_rounded,
                  isInverted: false,
                  offset: 0,
                ),
                const CurrencyCard(
                  name: 'Bitcoin',
                  code: "BTC",
                  amount: '9 785',
                  icon: Icons.currency_bitcoin,
                  isInverted: true,
                  offset: -20,
                ),
                const CurrencyCard(
                  name: 'Dollar',
                  code: "USD",
                  amount: '428',
                  icon: Icons.attach_money_outlined,
                  isInverted: false,
                  offset: -40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
