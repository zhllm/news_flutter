import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:newsflutter/common/api/apis.dart';
import 'package:newsflutter/common/entity/entity.dart';
import 'package:newsflutter/common/utils/screen.dart';
import 'package:newsflutter/common/utils/utils.dart';
import 'package:newsflutter/common/values/values.dart';
import 'package:newsflutter/common/widgets/channel_widget.dart';
import 'package:newsflutter/common/widgets/widgets.dart';
import 'package:newsflutter/page/main/ad_widget.dart';
import 'package:newsflutter/page/main/categories_widget.dart';
import 'package:newsflutter/page/main/news_item.dart';
import 'package:newsflutter/page/main/recomment_widget.dart';

import 'letter_subscribe.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  EasyRefreshController _controller;

  NewsPageListResponseEntity _newsPageList;
  NewsRecommendResponseEntity _newsRecommend;
  List<CategoryResponseEntity> _categories;
  List<ChannelResponseEntity> _channels;

  String _selectedCode;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _loadAllData();
    // _loadLatestWithDiskCache();
  }

  _loadLatestWithDiskCache() {
    if (CACHE_ENABLE == true) {
      var cacheData = StorageUtil().getJSON(STORAGE_INDEX_NEWS_CACHE_KEY);
      if (cacheData != null) {
        Timer(Duration(seconds: 3), () {
          _controller.callRefresh();
        });
      }
    }
  }

  _loadAllData() async {
    _categories = await NewsAPI.getCategories(
      context: context,
      cachedDisk: false,
    );
    print(_categories);
    _channels = await NewsAPI.getChannel(
      context: context,
      cachedDisk: false,
    );
    _newsRecommend = await NewsAPI.newsRecommend(
      context: context,
      cachedDisk: false,
    );
    _newsPageList = await NewsAPI.newsPageList(
      context: context,
      cachedDisk: false,
    );
    _selectedCode = _categories.first.code;
    print(_categories);
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildCategories() {
    return categoriesWidget(
      categories: _categories,
      selectedCode: _selectedCode,
      onTap: (e) {
        setState(() {
          _selectedCode = e.code;
        });
      },
    );
  }

  Widget _buildRecommend() {
    return _newsRecommend == null
        ? Container()
        : recommendWidget(
            responseEntity: _newsRecommend,
          );
  }

  Widget _buildChannels() {
    return _channels == null
        ? Container()
        : newsChannelWidget(lists: _channels, onTap: (e) {});
  }

  Widget _buildNewsList() {
    return _newsPageList == null
        ? Container()
        : Column(
            children: _newsPageList.items.map<Widget>((e) {
              List<Widget> widgets = <Widget>[
                newsItem(item: e),
                Divider(
                  height: 1,
                ),
              ];
              int index = _newsPageList.items.indexOf(e);
              if (((index + 1) % 5) == 0) {
                widgets.addAll([
                  adWidget(),
                  Divider(
                    height: 1,
                  ),
                ]);
              }
              return Column(
                children: widgets,
              );
              // return widgets;
            }).toList(),
          );
  }

  Widget _buildEmailSubscribe() {
    return letterSubscribe();
  }

  @override
  Widget build(BuildContext context) {
    return _newsPageList == null
        ? cardListSkeleton()
        : EasyRefresh(
            enableControlFinishRefresh: true,
            controller: _controller,
            onRefresh: () async {
              await _loadAllData();
              _controller.finishRefresh();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildCategories(),
                  _buildRecommend(),
                  _buildChannels(),
                  _buildNewsList(),
                  _buildEmailSubscribe(),
                ],
              ),
            ),
          );
  }
}
