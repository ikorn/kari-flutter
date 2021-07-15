import 'package:flutter/cupertino.dart';
import 'package:karikore/views/members/home.dart';
import 'package:karikore/views/members/search.dart';

class MembersView extends StatefulWidget {
  MembersView({Key? key}) : super(key: key);

  @override
  _MembersViewState createState() => _MembersViewState();
}

class _MembersViewState extends State<MembersView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Color(0x00000000),
        iconSize: 24,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: '検索'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'アカウント'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), label: '設定'),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch(index) {
          case 0: return HomeView();
          case 1: return SearchView();
          default: return Text('');
        }
      },
    );
  }
}
