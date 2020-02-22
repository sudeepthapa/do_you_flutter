import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iremember/core/models/image.dart';

class ImageDetail extends StatelessWidget {
  final ImageItem image;
  ImageDetail({this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 400,
            alignment: Alignment.bottomCenter,
            decoration: image.url != ''
                ? BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(image.url),
                        fit: BoxFit.cover))
                : BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            "https://via.placeholder.com/1500X1500.png?text=Image+Not+Found"),
                        fit: BoxFit.fitHeight),
                  ),
            child: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 60,
              color: Colors.black54,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  image.title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Description",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              image.description,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
