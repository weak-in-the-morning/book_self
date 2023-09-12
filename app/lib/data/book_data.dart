class BookData {
  String id;
  String name;
  int num;
  String service;
  bool hasRead;
  bool favorite;
  String? tag;
  String? memo;
  String urlSearch;
  String? urlImage;

  BookData({
    // 0で仮で置く
    this.id = "",
    required this.name,
    required this.num,
    required this.service,
    required this.hasRead,
    required this.favorite,
    this.tag,
    this.memo,
    required this.urlSearch,
    this.urlImage,
  });

  @override
  String toString() {
    return 'BookData{id: $id, name: $name, num: $num, service: $service, hasRead: $hasRead, favorite: $favorite, tag: $tag, memo: $memo, urlSearch: $urlSearch, urlImage: $urlImage}';
  }
}
