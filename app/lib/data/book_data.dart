class BookData {
  int id = 0;
  String name = "";
  int num = 0;
  String service = "";
  bool hasRead = false;
  bool favorite = false;
  String tag = "";
  String memo = "";
  DateTime created = DateTime.now();
  DateTime updated = DateTime.now();
  String urlSearch = "";
  String urlImage = "";

  BookData(
      this.id,
      this.name,
      this.num,
      this.service,
      this.hasRead,
      this.favorite,
      this.tag,
      this.memo,
      this.created,
      this.updated,
      this.urlSearch,
      this.urlImage);
}
