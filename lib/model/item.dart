abstract class BaseModelView {}

class LoadingView extends BaseModelView {}

class BannerView extends BaseModelView {
  String id;
  String imageUrl;

  BannerView(this.id, this.imageUrl);
}

class ItemView extends BaseModelView {
  String id;
  String imageUrl;
  String name;

  ItemView(this.id, this.imageUrl, this.name);
}

class CarouselBannerView extends BaseModelView {
  String id;
  List<BannerView> items;
  String name;

  CarouselBannerView(this.id, this.items, this.name);
}

class CarouselView extends BaseModelView {
  String id;
  List<ItemView> items;
  String name;

  CarouselView(this.id, this.items, this.name);
}
