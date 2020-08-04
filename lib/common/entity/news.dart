import 'dart:convert';

class NewsPageListRequestEntity {
  String categoryCode;
  String channelCode;
  String tag;
  String keyword;

  NewsPageListRequestEntity({
    this.categoryCode,
    this.tag,
    this.channelCode,
    this.keyword,
  });
}

NewsPageListResponseEntity newsPageListResponseEntityFromJson(String str) =>
    NewsPageListResponseEntity.fromJson(json.decode(str));

String newsPageListResponseEntityToJson(NewsPageListResponseEntity data) =>
    json.encode(data.toJson());

class NewsPageListResponseEntity {
  NewsPageListResponseEntity({
    this.counts,
    this.pagesize,
    this.pages,
    this.page,
    this.items,
  });

  int counts;
  int pagesize;
  int pages;
  int page;
  List<Item> items;

  factory NewsPageListResponseEntity.fromJson(Map<String, dynamic> json) =>
      NewsPageListResponseEntity(
        counts: json["counts"],
        pagesize: json["pagesize"],
        pages: json["pages"],
        page: json["page"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "counts": counts,
        "pagesize": pagesize,
        "pages": pages,
        "page": page,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.category,
    this.thumbnail,
    this.addtime,
    this.title,
    this.author,
    this.url,
  });

  String id;
  String category;
  String thumbnail;
  DateTime addtime;
  String title;
  String author;
  String url;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        addtime: DateTime.parse(json["addtime"]),
        title: json["title"],
        author: json["author"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "thumbnail": thumbnail,
        "addtime": addtime.toIso8601String(),
        "title": title,
        "author": author,
        "url": url,
      };
}

class NewsRecommendRequestEntity {
  String categoryCode;
  String channelCode;
  String tag;
  String keyword;

  NewsRecommendRequestEntity({
    this.categoryCode,
    this.channelCode,
    this.tag,
    this.keyword,
  });

  Map<String, dynamic> toJson() => {
    "categoryCode": categoryCode,
    "channelCode": channelCode,
    "tag": tag,
    "keyword": keyword,
  };
}

/// 新闻推荐 response
class NewsRecommendResponseEntity {
  String thumbnail;
  String title;
  String category;
  DateTime addtime;
  String author;
  String url;
  String id;

  NewsRecommendResponseEntity({
    this.thumbnail,
    this.title,
    this.category,
    this.addtime,
    this.author,
    this.url,
    this.id,
  });

  factory NewsRecommendResponseEntity.fromJson(Map<String, dynamic> json) =>
      NewsRecommendResponseEntity(
        thumbnail: json["thumbnail"],
        title: json["title"],
        category: json["category"],
        addtime: DateTime.parse(json["addtime"]),
        author: json["author"],
        url: json["url"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
    "thumbnail": thumbnail,
    "title": title,
    "category": category,
    "addtime": addtime.toIso8601String(),
    "author": author,
    "url": url,
    "id": id,
  };
}

