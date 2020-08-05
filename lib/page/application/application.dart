import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/utils/utils.dart';
import 'package:newsflutter/common/values/values.dart';
import 'package:newsflutter/common/widgets/widgets.dart';
import 'package:newsflutter/page/account/account_page.dart';
import 'package:newsflutter/page/bookmarks/book_marks.dart';
import 'package:newsflutter/page/category/category_page.dart';
import 'package:newsflutter/page/main/main.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application>
    with SingleTickerProviderStateMixin {
  int _page = 0;
  final List<String> _tabTitles = [
    'Welcome',
    'Category',
    'Bookmarks',
    'Account',
  ];

  PageController _pageController;

  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(
        IconFont.home,
        color: AppColors.thirdElement,
      ),
      activeIcon: Icon(
        IconFont.home,
        color: AppColors.secondaryElementText,
      ),
      title: Text('Main'),
      backgroundColor: AppColors.primaryBackgroud,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconFont.grid,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        IconFont.grid,
        color: AppColors.secondaryElementText,
      ),
      title: Text('Category'),
      backgroundColor: AppColors.primaryBackgroud,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconFont.tag,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        IconFont.tag,
        color: AppColors.secondaryElementText,
      ),
      title: Text('tags'),
      backgroundColor: AppColors.primaryBackgroud,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconFont.me,
        color: AppColors.thirdElement,
      ),
      activeIcon: Icon(
        IconFont.me,
        color: AppColors.secondaryElementText,
      ),
      title: Text('my'),
      backgroundColor: AppColors.primaryBackgroud,
    ),
  ];

  void _handleNavBarTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  void _handlePageChanged(int page) {
    print(page);
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: this._page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildAppBar() {
    return transparentAppBar(
        context: context,
        title: Text(
          _tabTitles[_page],
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: CustomFont.Montserrat,
            fontSize: setFont(18.0),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.primaryText,
            ),
            onPressed: () {},
          ),
        ]);
  }

  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        MainPage(),
        CategoryPage(),
        BookMarksPage(),
        AccountPage(),
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
