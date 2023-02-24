import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  //Constructor을 직접 코딩해서 만들어줘도 되지만, 노란색 전구에서 Constructor 생성하기 기능을 이용해도 된다.
  const Button(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(45),
      ),
      //원래 child: const Padding 형태였는데 에러가 발생하기 때문에 const를 지워줘야 한다.
      //이전에 const 였던 이유는 text나 textColor가 정해졌었기 때문이다.
      //이제는 아니기 때문에 Padding 옆의 const는 지워주고,
      //대신 자동적으로 바뀌지 않는 부분에 const를 넣어줘야 한다.
      child: Padding(
        //여기에 const를 넣는 것이다.
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
