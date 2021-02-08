import 'dart:async';
import 'dart:math';

import 'package:multipleviewlist/model/item.dart';
import 'package:uuid/uuid_util.dart';

const String _image1 =
    "https://images.unsplash.com/photo-1612308416288-04e8d3530dda?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MXwxfDB8MXxyYW5kb218fHx8fHx8fA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800";
const String _image2 =
    "https://images.unsplash.com/photo-1612384854203-a3205cfc18b0?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MXwxfDB8MXxyYW5kb218fHx8fHx8fA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800";
const String _image3 =
    "https://images.unsplash.com/photo-1612373596388-337f7194e59a?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MXwxfDB8MXxyYW5kb218fHx8fHx8fA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800";
const String _image4 =
    "https://images.unsplash.com/photo-1612347827292-fb8d711eb6b9?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MXwxfDB8MXxyYW5kb218fHx8fHx8fA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800";
const String _image5 =
    "https://images.unsplash.com/photo-1612396078010-143dc24e1751?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MXwxfDB8MXxyYW5kb218fHx8fHx8fA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800";
const String _image6 =
    "https://images.unsplash.com/photo-1612373596521-bc71226df96a?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MXwxfDB8MXxyYW5kb218fHx8fHx8fA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800";
const String _image7 =
    "https://images.unsplash.com/photo-1612369218304-cf5ee316c473?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MXwxfDB8MXxyYW5kb218fHx8fHx8fA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800";
const String _image8 =
    "https://images.unsplash.com/photo-1612443506103-031b8fa2f034?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MXwxfDB8MXxyYW5kb218fHx8fHx8fA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800";
const String _image9 =
    "https://images.unsplash.com/photo-1612419353295-6d52d33fedf8?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MXwxfDB8MXxyYW5kb218fHx8fHx8fA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800";
const String _image10 =
    "https://images.unsplash.com/photo-1612443404260-900ac5f52194?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MXwxfDB8MXxyYW5kb218fHx8fHx8fA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=800";

List<String> _images = [
  _image1,
  _image2,
  _image3,
  _image4,
  _image5,
  _image6,
  _image7,
  _image8,
  _image9,
  _image10
];

String _getRandomId() {
  return UuidUtil().toString();
}

final _random = Random();

String _getRandomImage() {
  return _images[_random.nextInt(_images.length)];
}

String _getName(String imageUrl) {
  return "Item for ${_images.indexOf(imageUrl)}";
}

BannerView _getRandomBanner() {
  String id = _getRandomId();
  String imageUrl = _getRandomImage();
  return BannerView(id, imageUrl);
}

ItemView _getRandomItem() {
  String id = _getRandomId();
  String imageUrl = _getRandomImage();
  String name = _getName(imageUrl);
  return ItemView(id, imageUrl, name);
}

CarouselBannerView _getRandomCarouselBanner() {
  int length = 6;
  String id = _getRandomId();
  List<BannerView> banners =
      List.generate(length, (index) => _getRandomBanner());
  String name = _getName(banners[_random.nextInt(5)].id);
  return CarouselBannerView(id, banners, name);
}

CarouselView _getRandomCarouselView() {
  int length = 6;
  String id = _getRandomId();
  List<ItemView> items = List.generate(length, (index) => _getRandomItem());
  String name = _getName(items[_random.nextInt(6)].id);
  return CarouselView(id, items, name);
}

class Constant {
  List<BaseModelView> primaryItems = [
    _getRandomItem(),
    _getRandomItem(),
    _getRandomCarouselView(),
    _getRandomItem(),
    _getRandomBanner()
  ];

  List<BaseModelView> secondaryItems = [
    _getRandomCarouselView(),
    _getRandomItem(),
    _getRandomBanner(),
    _getRandomBanner(),
    _getRandomItem(),
    _getRandomItem(),
  ];

  List<BaseModelView> generatePaging() {
    return [
      _getRandomCarouselView(),
      _getRandomItem(),
      _getRandomBanner(),
      _getRandomBanner(),
      _getRandomItem(),
      _getRandomItem()
    ];
  }
}

void delay(int second, void function()) {
  Future.delayed(Duration(seconds: second), () {
    function();
  });
}
