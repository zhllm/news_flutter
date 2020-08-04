import 'package:flutter/cupertino.dart';
import 'package:newsflutter/common/entity/entity.dart';
import 'package:newsflutter/common/utils/utils.dart';

class NewsAPI {
  /// 新闻列表
  static Future<NewsPageListResponseEntity> newsPageList({
    NewsPageListRequestEntity params,
    BuildContext context,
  }) async {
    var response =
        await HttpUtil().get('/list', context: context, params: params);
    return NewsPageListResponseEntity.fromJson(response);
  }

  /// 推荐
  static Future<NewsRecommendResponseEntity> newsRecommend({
    NewsRecommendRequestEntity params,
    BuildContext context,
  }) async {
    var response =
        await HttpUtil().get("/recommend", context: context, params: params);
    return NewsRecommendResponseEntity.fromJson(response);
  }

  /// 分类
  static Future<List<CategoryResponseEntity>> getCategories({
    BuildContext context,
  }) async {
    var response = await HttpUtil().get('/categories', context: context);
    return response
        .map<CategoryResponseEntity>(
            (item) => CategoryResponseEntity.fromJson(item))
        .toList();
  }

  /// 频道
  static Future<List<ChannelResponseEntity>> getChannel({
    BuildContext context,
  }) async {
    var response = await HttpUtil().get('/channels', context: context);
    return response
        .map<ChannelResponseEntity>(
            (item) => ChannelResponseEntity.fromJson(item))
        .toList();
  }

  /// 标签
  static Future<List<TagsResponseEntity>> getTags(
      {BuildContext context, TagRequestEntity params}) async {
    var response =
        await HttpUtil().get('/tags', context: context, params: params);
    var data = response
        .map<TagsResponseEntity>((item) => TagsResponseEntity.fromJson(item))
        .toList();
    print(data);
    return data;
  }
}
