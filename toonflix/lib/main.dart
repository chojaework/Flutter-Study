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
  @override
  Widget build(BuildContext context) {
    //context는 위젯 트리에서 모든 부모요소들에 대한 정보이다
    //BuildContext 위젯을 통해 누가 부모요소인지 알 수 있고 맨 위 부모 요소에도 접근할 수 있다
    //A handle to the location of a widget in the widget tree.
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
            //Theme만 작성해서는 화면에 변화가 없다
            //따라서 build context 사용해야 한다
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xfff4eddb),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              MyLargeTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //context는 My Large Title Text의 부모 요소들의 모든 정보를 포함
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
        //현재 context의 Theme을 찾아서 책을 가져오는 것
        //titleLarge!라고 쓰는 이유는 color가 null이 아님을 알려주기 위한 것
        //titleLarge?라고 써도 된다
        //! : I'M SURRRRE, ? : maybe?
      ),
    );
  }
}
//_AppState widget과 분리된 MyLargeTitle widget을 생성한 것