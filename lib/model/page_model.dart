class PageModel<T> {
  String? nextPageUrl;
  List<T>? itemList;

  PageModel({this.nextPageUrl, this.itemList});
}