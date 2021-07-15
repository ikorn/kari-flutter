import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karikore/styles/colors.dart';
import 'package:karikore/styles/text_styles.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                CupertinoSliverNavigationBar(
                  largeTitle: Text('Home'),
                  trailing: GestureDetector(
                    child: Icon(
                      CupertinoIcons.bell,
                      size: 24,
                    ),
                    onTap: () {},
                  ),
                  backgroundColor: CupertinoColors.white,
                )
              ];
            },
            body: Container(
                child: ListView(shrinkWrap: true, children: <Widget>[
              Container(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: Iterable.generate(10)
                        .map((e) => _HomeCarouselItem())
                        .toList(),
                  )),
              _HomeSectionTitle(title: '新着'),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _HomeSectionItem(
                      url:
                          'https://laxus.co/app/img/product/1002046/1002046a.jpg'),
                  _HomeSectionItem(
                      url: 'https://laxus.co/app/img/product/14503/14503a.jpg'),
                  _HomeSectionItem(
                      url:
                          'https://laxus.co/app/img/product/90001586/90001586a.jpg'),
                  _HomeSectionItem(
                      url: 'https://laxus.co/app/img/product/2177/2177a.jpg'),
                ],
              ),
              _HomeSectionTitle(title: 'お気に入り'),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _HomeSectionItem(
                      url:
                          'https://laxus.co/app/img/product/1002046/1002046a.jpg'),
                  _HomeSectionItem(
                      url: 'https://laxus.co/app/img/product/14503/14503a.jpg'),
                  _HomeSectionItem(
                      url:
                          'https://laxus.co/app/img/product/90001586/90001586a.jpg'),
                  _HomeSectionItem(
                      url: 'https://laxus.co/app/img/product/2177/2177a.jpg'),
                ],
              ),
            ]))));
  }
}

class _HomeCarouselItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: CupertinoColors.activeGreen,
      child: Container(
        width: (MediaQuery.of(context).size.width / 2) - 32,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        padding: EdgeInsets.all(16),
        child: Text('test'),
      ),
    );
  }
}

class _HomeSectionTitle extends StatelessWidget {
  final String title;

  _HomeSectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        color: KColors.mintLight,
        child: Text(title, style: TextStyles.title));
  }
}

class _HomeSectionItem extends StatelessWidget {
  final String url;

  _HomeSectionItem({required this.url});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(8),
      elevation: 0.5,
      child: Stack(
        children: [
          Image.network(this.url, fit: BoxFit.fill),
          Positioned(
              child: Container(
                  color: KColors.mint.withAlpha(50),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text('test product title', style: TextStyles.caption)),
              bottom: 0),
        ],
      ),
    ));
  }
}
