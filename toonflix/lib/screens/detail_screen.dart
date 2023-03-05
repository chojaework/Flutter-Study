import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;
  //이용자가 어떤 화면을 클릭했는지 알기 위해 가져와야 한다

  // Future<WebtoonDetailModel> webtoon = ApiService.getToonById(id);
  // 이렇게 작성하면 다른 property에 접근이 불가능하다 => statefulwidget으로 바꿔서 작성해야 한다

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  //webtoon은 initState에서 정의할 것이다
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    //initState는 build보다 항상 먼저(한번만) 호출되기 때문에 가능한 것
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    //아래랑 마찬가지로 widget.id로 작성해야 한다
    //id가 있는 위의 클래스와 다른 클래스에 있기 때문이다
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          widget.title, //오늘의 웹툰이 아니라 title을 작성
          //statelesswidget에서는 그냥 title이었는데 statefulwidget으로 바꾸면서 widget.title로 작성해야 한다
          //지금 얘네는 state 클래스 안에 속해 있기 때문이다
          //statefulwidget으로부터 title데이터를 받아오지 못하고 있는 것
          //widget.title로 쓰는 것이 state가 속한 statefulwidget의 data를 받아오는 방법
          //widget은 detail_screen을 가리키는 것
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        //scroll 가능한 창을 만들기 위해 사용
        child: Padding(
          padding: const EdgeInsets.all(50),
          //포스터 위와 맨 아래 버튼 밑 간격을 50으로 설정
          //아래의 모든 child한테 같은 간격을 적용하고 싶으므로 Column을 Wrap with Padding 한다
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //사진을 가운데로 가져온다
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
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
                      child: Image.network(widget.thumb),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                    //"어린 시절 비행기 추락 사고의 유일한 생존자 유이진. 살아남기 위해 용병으로 살아가던 유이진은 10년 후, 가족이 있는 고향으로 돌아왔다." 같이 웹툰 episode 글이 출력된다
                  }
                  return const Text("...");
                  //로딩될 때는 ...이 보인다
                },
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 10,
                              //버튼 사이의 간격
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green.shade400,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    episode.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.chevron_right_rounded,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    );
                    //만약 보여줘야 할 에피소드의 개수를 모른다면 ListView를 사용해도 좋다
                    //하지만 에피소드의 개수가 10개로 정해져 있으므로 여기서는 Column 사용한다
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
