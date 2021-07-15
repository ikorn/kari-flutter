import 'package:flutter/cupertino.dart';

class UserStat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _UserStatItem(title: "出品数", value: "5", icon: Icon(CupertinoIcons.arrow_up_circle)),
        _UserStatItem(title: "口コミ数", value: "5", icon: Icon(CupertinoIcons.chat_bubble)),
        _UserStatItem(title: "総合評価", value: "4.5", icon: Icon(CupertinoIcons.star)),
      ],
    );
  }
}

class _UserStatItem extends StatelessWidget {

  final String title;
  final String value;
  final Icon icon;

  _UserStatItem({required this.title, required this.value, required this.icon})

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        this.icon,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(title),
        ),
        Text(value),
      ],
    );
  }
}