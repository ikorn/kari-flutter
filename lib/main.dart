import 'package:flutter/cupertino.dart';
import 'package:karikore/styles/colors.dart';
import 'package:karikore/views/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor: KColors.earth,
      ),
      home: LoginView(title: 'Karikore'),
    );
  }
}