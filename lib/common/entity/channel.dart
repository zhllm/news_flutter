import 'dart:convert';

List<ChannelResponseEntity> channelResponseEntityFromJson(String str) => List<ChannelResponseEntity>.from(json.decode(str).map((x) => ChannelResponseEntity.fromJson(x)));

String channelResponseEntityToJson(List<ChannelResponseEntity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChannelResponseEntity {
  ChannelResponseEntity({
    this.code,
    this.title,
  });

  String code;
  String title;

  factory ChannelResponseEntity.fromJson(Map<String, dynamic> json) => ChannelResponseEntity(
    code: json["code"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "title": title,
  };
}
