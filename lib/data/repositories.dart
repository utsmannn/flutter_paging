import 'dart:async';

import 'package:multipleviewlist/data/constant.dart';
import 'package:multipleviewlist/model/item.dart';

class RepositoryImages {
  Stream<List<BaseModelView>> getPrimaryItems() async* {
    yield Constant().primaryItems;
  }

  List<BaseModelView> getSecondaryPagingItem() {
    return Constant().generatePaging();
  }
}
