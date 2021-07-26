import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:karikore/model/repository/api.dart';
import 'package:karikore/model/app_state.dart';
import 'package:karikore/styles/colors.dart';
import 'package:karikore/views/login.dart';
import 'package:karikore/views/members/members.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<AppState>(
      create: (_) => AppState(), child: MyApp()));
}

var api = Api();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Consumer<AppState>(builder: (context, model, child) {
      api.setToken(model.getAccessToken(), model.getRefreshToken());
      return CupertinoApp(
        title: 'Karikore',
        theme: CupertinoThemeData(
          primaryColor: KColors.earth,
        ),
        home: model.getAccessToken() != null
            ? MembersView()
            : LoginView(title: 'Karikore'),
      );
    });
  }
}
