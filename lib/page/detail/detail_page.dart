import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/values/colors.dart';
import 'package:newsflutter/common/widgets/tranparent_appbar.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final String url;

  DetailPage({Key key, this.title, this.url}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(
        title: Text(
          "detail page",
          style: TextStyle(
            color: KColor.primaryText,
          ),
        ),
      ),
      body: Container(
        child: Text("${widget.title}--${widget.url}"),
      ),
    );
  }
}
