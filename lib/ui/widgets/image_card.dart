import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iremember/core/models/image.dart';
import 'package:iremember/ui/pages/image_detail.dart';

class ImageCard extends StatelessWidget {
  final ImageItem image;
  const ImageCard({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ImageDetail(
                      image: image,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            child: Container(
          height: 120,
          child: Row(
            children: <Widget>[
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: (image.url == '')
                          ? CachedNetworkImageProvider(
                              "https://via.placeholder.com/150X150.png?text=No+Image")
                          : CachedNetworkImageProvider(image.url)),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        image.title,
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        image.description.split(" ").length > 10
                            ? image.description
                                    .split(" ")
                                    .sublist(0, 10)
                                    .join(' ') +
                                " ..."
                            : image.description,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
