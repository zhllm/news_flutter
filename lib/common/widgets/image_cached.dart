import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/utils/screen.dart';
import 'package:newsflutter/common/values/values.dart';

Widget imageCached(
  String url, {
  double width = 48,
  double height = 48,
  EdgeInsetsGeometry margin,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: Radii.k6pxRdius,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),
    placeholder: (context, url) {
      return Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    },
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
