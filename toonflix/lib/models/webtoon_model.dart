class WebtoonModel {
  final String title, thumb, id;

  //named constructor를 사용할 것
  //fromJson이라는 name이 있고
  //title, thumb, id를 초기화하는 구문

  //title: 대학원 탈출일지,
  //thumb: https://shared-comic.pstatic.net/thumb/webtoon/790713/thumbnail/thumbnail_IMAG21_3919364435331003700.jpg,
  // id: 790713}
  WebtoonModel.fromJson(Map<String, dynamic> json)
      //Map은 key와 value가 대응하는 자료형
      //fromJson이 이름에 해당
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
