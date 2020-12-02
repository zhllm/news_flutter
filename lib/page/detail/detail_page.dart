import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:newsflutter/common/entity/news.dart';
import 'package:newsflutter/common/utils/screen.dart';
import 'package:newsflutter/common/utils/utils.dart';
import 'package:newsflutter/common/values/values.dart';
import 'package:newsflutter/common/widgets/tranparent_appbar.dart';
import 'package:newsflutter/common/widgets/widgets.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  final NewsRecommendResponseEntity item;

  DetailPage({Key key, this.item}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double height = 200;
  bool _pageIsFinished = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  JavascriptChannel _invokeJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Invoke',
        onMessageReceived: (JavascriptMessage message) {
          print(message.message);
          var webHeight = double.parse(message.message);
          if (webHeight != null) {
            setState(() {
              height = webHeight;
            });
          }
        });
  }

  _getWebViewHeight() async {
    await (await _controller.future)?.evaluateJavascript('''
      try {
        let scrollHeight = document.documentElement.scrollHeight;
        if (scrollHeight) {
          Invoke.postMessage(scrollHeight);
        }
      } catch (error) {
         
      }
    ''');
  }

  Widget _buildAppBAr() {
    return transparentAppBar(
        context: context,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: KColor.primaryText,
          ),
          onPressed: () {
            //
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.bookmark_border,
              color: KColor.primaryText,
            ),
            onPressed: () {
              //
            },
          ),
          IconButton(
            icon: Icon(
              Icons.share,
              color: KColor.primaryText,
            ),
            onPressed: () {
              Share.share("${widget.item.title} ${widget.item.url}");
            },
          ),
        ]);
  }

  Widget _buildPageTitle() {
    return Container(
      margin: EdgeInsets.all(setWidth(10)),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                widget.item.category,
                style: TextStyle(
                  fontFamily: CustomFont.Montserrat,
                  fontWeight: FontWeight.normal,
                  fontSize: setFont(30),
                  color: KColor.thirdElementText,
                ),
              ),
              Text(
                widget.item.author,
                style: TextStyle(
                  fontFamily: CustomFont.Avenir,
                  fontWeight: FontWeight.normal,
                  fontSize: setFont(14),
                  color: KColor.thirdElementText,
                ),
              )
            ],
          ),
          Spacer(),
          CircleAvatar(
            radius: setWidth(22),
            backgroundImage: AssetImage("assets/images/channel-fox.png"),
          )
        ],
      ),
    );
  }

  Widget _buildPageHeader() {
    return Container(
      margin: EdgeInsets.all(setWidth(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          imageCached(
            widget.item.thumbnail,
            width: setWidth(335),
            height: setHeight(290),
          ),
          Container(
            margin: EdgeInsets.only(top: setHeight(10)),
            child: Text(
              widget.item.title,
              style: TextStyle(
                fontFamily: CustomFont.Montserrat,
                fontWeight: FontWeight.w600,
                fontSize: setFont(24),
                color: KColor.primaryText,
                height: 1,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 120),
                  child: Text(
                    widget.item.category,
                    style: TextStyle(
                      fontFamily: CustomFont.Avenir,
                      fontWeight: FontWeight.normal,
                      fontSize: setFont(14),
                      color: KColor.secondaryElementText,
                      height: 1,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                ),
                Container(
                  width: setWidth(15),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 120),
                  child: Text(
                    "· ${dateFormat(widget.item.addtime)}",
                    style: TextStyle(
                      fontFamily: CustomFont.Avenir,
                      fontWeight: FontWeight.normal,
                      fontSize: setFont(14),
                      color: KColor.thirdElementText,
                      height: 1,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWebView() {
    return Container(
      height: height,
      child: WebView(
        initialUrl: "$SERVER_API_URL/content/${widget.item.id}",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) async {
          _controller.complete(webViewController);
        },
        javascriptChannels: <JavascriptChannel>[
          _invokeJavascriptChannel(context),
        ].toSet(),
        navigationDelegate: (NavigationRequest request) {
          if (request.url != "$SERVER_API_URL/content/${widget.item.id}") {
            toastInfo(msg: request.url);
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {
          _getWebViewHeight();
          setState(() {
            _pageIsFinished = true;
          });
        },
        gestureNavigationEnabled: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBAr(),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildPageTitle(),
                  Divider(height: 1),
                  _buildPageHeader(),
                  _buildWebView(),
                ],
              ),
            ),
            _pageIsFinished == true
                ? Container()
                : Align(
                    alignment: Alignment.center,
                    child: LoadingBouncingGrid.square(),
                  ),
          ],
        ));
  }
}
