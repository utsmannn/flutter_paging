import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multipleviewlist/model/item.dart';

class BaseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget buildCard(String imageUrl, double shadow) {
  return Center(
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.all(10),
      child: Container(
        height: 300,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageUrl,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: shadow,
    ),
  );
}

class BannerWidget extends StatelessWidget {
  final BannerView _banner;

  BannerWidget(this._banner);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildCard(_banner.imageUrl, 3),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final ItemView _item;

  ItemWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          buildCard(_item.imageUrl, 3),
          Positioned(
            child: Center(
              child: Stack(
                children: [
                  Text(_item.name,
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GridItemWidget extends StatelessWidget {
  final CarouselView _items;

  GridItemWidget(this._items);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        primary: false,
        children: List.generate(_items.items.length, (index) {
          String imageUrl = _items.items[index].imageUrl;
          return Container(
              child: buildCard(imageUrl, 2));
        }),
      ),
    );
  }
}
