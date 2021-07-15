import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karikore/styles/text_styles.dart';

class UserStat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _UserStatItem(
                  title: "出品数",
                  value: "5",
                  icon: CupertinoIcons.arrow_up_circle),
              _UserStatItem(
                  title: "口コミ数", value: "5", icon: CupertinoIcons.chat_bubble),
              _UserStatItem(
                  title: "総合評価", value: "4.5", icon: CupertinoIcons.star),
            ],
          ),
          Divider(),
        ]));
  }
}

class _UserStatItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  _UserStatItem({required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(this.icon, size: 16),
        SizedBox(height: 4),
        Row(children: [
          Text(title, style: TextStyles.caption),
          SizedBox(width: 8),
          Text(value, style: TextStyles.caption),
        ]),
      ],
    );
  }
}
