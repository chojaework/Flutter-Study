import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  //Bitcoin의 색상을 반전시키기 위한 boolean
  final _blackColor = const Color(0xff1f2123);
  //앞에 _ 을 붙인다는 것은 private한 변수라는 뜻
  final double offset;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, offset),
      child: Container(
        clipBehavior: Clip.hardEdge,
        //넘치는 부분을 자르기 위해 사용
        decoration: BoxDecoration(
          color: isInverted ? Colors.white : _blackColor,
          //isInverted가 true이면 박스 색상이 흰색, false이이면 위에서 정의한 색상
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
                  Text(name,
                      style: TextStyle(
                        color: isInverted ? _blackColor : Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInverted ? _blackColor : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: isInverted
                              ? _blackColor
                              : Colors.white.withOpacity(0.8),
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
                  offset: const Offset(-5, 12), //x축으로 -5만큼, y축으로 12만큼 이동
                  child: Icon(
                    icon,
                    color: isInverted ? _blackColor : Colors.white,
                    size: 88, //size값을 변경하면 카드 자체가 커진다
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
