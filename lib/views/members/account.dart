import 'package:flutter/cupertino.dart';
import 'package:karikore/components/user_stat.dart';

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          trailing:
              GestureDetector(onTap: () {}, child: Icon(CupertinoIcons.person, size: 24)),
        ),
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 240,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            'https://scontent-nrt1-1.xx.fbcdn.net/v/t1.6435-9/104207106_10158266230192302_3335353088369068333_n.jpg?_nc_cat=110&ccb=1-3&_nc_sid=e3f864&_nc_ohc=hO7rrxhyFvQAX9hFOPo&_nc_oc=AQnLFOwnHNzhEXZfZwv7LHRjS1VvRsmpYPYKKBn2RpqWB8T_DsHR0dFByqyAvS_7EBY&_nc_ht=scontent-nrt1-1.xx&oh=9b3897559c4db10b2ec3d9bba1658b8f&oe=60F61BB2',
                          ))),
                )
              ],
            ),
            UserStat(),
          ],
        ));
  }
}
