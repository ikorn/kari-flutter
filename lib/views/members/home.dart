import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  backgroundColor: CupertinoColors.white,
                )
              ];
            },
            body: Center(
                child: ListView(children: [
              CarouselSlider(
                  items: Iterable.generate(10)
                      .map((e) => Card(
                            color: CupertinoColors.activeGreen,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              padding: EdgeInsets.all(16),
                              child: Text('test $e'),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                      autoPlay: false,
                      height: 120,
                      viewportFraction: 0.5,
                      enableInfiniteScroll: false)),
              Text('新着'),
              Card(
                color: CupertinoColors.destructiveRed,
                elevation: 0,
                child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(CupertinoIcons.info, color: CupertinoColors.white),
                        Text('test___test'),
                      ],
                    )),
              ),
              Card(
                color: CupertinoColors.destructiveRed,
                elevation: 0,
                child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(CupertinoIcons.info, color: CupertinoColors.white),
                        Text('test___test'),
                      ],
                    )),
              ),
            ]))));
  }
}
