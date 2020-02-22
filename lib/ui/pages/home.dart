import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iremember/core/models/image.dart';
import 'package:iremember/ui/widgets/image_card.dart';
import 'package:provider/provider.dart';
import 'package:iremember/core/notifiers/image_notifiers.dart';

import 'add.dart';

//TODO List out items from Firestore with image using the state management solution you have integrated
class HomePage extends StatelessWidget {
  List<ImageItem> images;
  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageNotifiers>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.deepOrangeAccent,
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddPage())),
        ),
        appBar: AppBar(
          title: Text("Home"),
          leading: Icon(Icons.home),
        ),
        body: Container(
          child: StreamBuilder(
            stream: imageProvider.fetchImagesAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                images = snapshot.data.documents
                    .map((doc) => ImageItem.fromJson(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: images.length,
                  itemBuilder: (context, int index) {
                    ImageItem image = images[index];
                    return ImageCard(
                      image: image,
                    );
                  },
                );
                // return CustomScrollView(
                //   slivers: <Widget>[
                //     SliverStaggeredGrid.countBuilder(
                //       crossAxisCount: 4,
                //       itemCount: 11,
                //       itemBuilder: (BuildContext context, int index) =>
                //           new Container(
                //               child: Image.network(
                //                   "https://dummyimage.com/${800}x${200 * index}.png/09f/fff")),
                //       staggeredTileBuilder: (int index) =>
                //           new StaggeredTile.fit(4),
                //       mainAxisSpacing: 4.0,
                //       crossAxisSpacing: 4.0,
                //     )
                //   ],
                // );
              } else {
                return Text("Fetching");
              }
            },
          ),
        ));
  }
}
