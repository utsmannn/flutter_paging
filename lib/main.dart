import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:multipleviewlist/data/constant.dart';
import 'package:multipleviewlist/data/repositories.dart';
import 'package:multipleviewlist/model/item.dart';
import 'package:multipleviewlist/widget/widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final RepositoryImages repositoryImages = RepositoryImages();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainContainer(repositoryImages),
    );
  }
}

class MainContainer extends StatefulWidget {
  final RepositoryImages repositoryImages;

  MainContainer(this.repositoryImages);

  @override
  _MainContainerState createState() => _MainContainerState(repositoryImages);
}

class _MainContainerState extends State<MainContainer> {
  final RepositoryImages _repositoryImages;
  PrimaryScreen _primaryScreen;
  SecondaryScreen _secondaryScreen;
  List<Widget> _screen = [];
  int _index = 0;

  _MainContainerState(this._repositoryImages);

  @override
  void initState() {
    super.initState();
    _primaryScreen = PrimaryScreen(_repositoryImages);
    _secondaryScreen = SecondaryScreen(_repositoryImages);
    _screen = [_primaryScreen, _secondaryScreen];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anjay"),
      ),
      body: IndexedStack(
        index: _index,
        children: _screen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: [
          navItem(Icons.list_alt, "List 1"),
          navItem(Icons.list_alt_outlined, "List 2")
        ],
      ),
    );
  }
}

BottomNavigationBarItem navItem(IconData iconData, String title) {
  return BottomNavigationBarItem(icon: Icon(iconData), label: title);
}

class PrimaryScreen extends StatefulWidget {
  final RepositoryImages _repositoryImages;

  PrimaryScreen(this._repositoryImages);

  @override
  _PrimaryScreenState createState() => _PrimaryScreenState(_repositoryImages);
}

class _PrimaryScreenState extends State<PrimaryScreen> {
  final RepositoryImages _repositoryImages;
  _PrimaryScreenState(this._repositoryImages);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: _repositoryImages.getPrimaryItems(),
        builder: (context, data) {
          if (data.hasData) {
            List<BaseModelView> items = data.data;
            return Container(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    BaseModelView item = items[index];
                    if (item is ItemView) {
                      return ItemWidget(item);
                    } else if (item is BannerView) {
                      return BannerWidget(item);
                    } else if (item is CarouselView) {
                      return GridItemWidget(item);
                    } else {
                      return Center(
                        child: Text("other"),
                      );
                    }
                  }),
            );
          } else {
            return Center(
              child: Text("empty"),
            );
          }
        },
      ),
    );
  }
}

class SecondaryScreen extends StatefulWidget {
  final RepositoryImages _repositoryImages;

  SecondaryScreen(this._repositoryImages);

  @override
  _SecondaryScreenState createState() =>
      _SecondaryScreenState(_repositoryImages);
}

class _SecondaryScreenState extends State<SecondaryScreen> {
  RepositoryImages _repositoryImages;

  _SecondaryScreenState(this._repositoryImages);

  final PagingController<int, BaseModelView> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      delay(3, () {
        print("list is end...");
        _pagingController.appendPage(_repositoryImages.getSecondaryPagingItem(), 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PagedListView<int, BaseModelView>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<BaseModelView>(
            itemBuilder: (context, item, index) {
          if (item is ItemView) {
            return ItemWidget(item);
          } else if (item is BannerView) {
            return BannerWidget(item);
          } else if (item is CarouselView) {
            return GridItemWidget(item);
          } else {
            return Center(
              child: Text("other"),
            );
          }
        }),
      ),
    );
  }
}
