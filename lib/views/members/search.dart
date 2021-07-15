import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final items = [
    'カテゴリー',
    'ブランド',
    '色',
    'お気に入り',
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: CupertinoSearchTextField(),
      ),
      child: SafeArea(
          child: ListView(
        children: [
          _SearchByItem(title: 'カテゴリー'),
          Divider(),
          _SearchByItem(title: 'ブランド'),
          Divider(),
          _SearchByItem(title: '色'),
          Divider(),
          _SearchByItem(title: 'お気に入り'),
          Divider(),
        ],
      )),
    );
  }
}

class _SearchByItem extends StatelessWidget {
  final String title;

  _SearchByItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title),
                Spacer(),
                Icon(
                  CupertinoIcons.chevron_right,
                  color: CupertinoColors.systemGrey,
                ),
              ],
            )),
        onTap: () {});
  }
}
