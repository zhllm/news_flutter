import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/api/apis.dart';
import 'package:newsflutter/common/entity/entity.dart';
import 'package:newsflutter/common/utils/screen.dart';
import 'package:newsflutter/page/main/categories_widget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  NewsPageListResponseEntity _newsPageList;
  NewsRecommendResponseEntity _newsRecommend;
  List<CategoryResponseEntity> _categories;
  List<ChannelResponseEntity> _channels;

  String _selectedCode;

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  _loadAllData() async {
    _categories = await NewsAPI.getCategories(context: context);
    print(_categories);
    _channels = await NewsAPI.getChannel(context: context);
    _newsRecommend = await NewsAPI.newsRecommend(context: context);
    _newsPageList = await NewsAPI.newsPageList(context: context);
    setState(() {});
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
    return Container(
      height: setHeight(490),
      color: Colors.amber,
    );
  }

  Widget _buildChannels() {
    return Container(
      height: setHeight(137),
      color: Colors.teal,
    );
  }

  Widget _buildNewsList() {
    return Container(
      height: setHeight(161 * 5 + 100.0),
      color: Colors.yellowAccent,
    );
  }

  Widget _buildEmailSubscribe() {
    return Container(
      height: setHeight(259),
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCategories(),
          _buildRecommend(),
          _buildChannels(),
          _buildNewsList(),
          _buildEmailSubscribe(),
        ],
      ),
    );
  }
}
