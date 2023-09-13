class BookData {
  String id;
  String name;
  int num;
  String service;
  bool hasRead;
  bool favorite;
  String tag;
  String memo;
  String urlSearch;
  String urlImage;

  BookData({
    // uuidをデフォルトで作成できないので空文字列で仮で置く
    this.id = "",
    required this.name,
    required this.num,
    required this.service,
    required this.hasRead,
    required this.favorite,
    required this.tag,
    required this.memo,
    required this.urlSearch,
    this.urlImage = "",
  });
}
