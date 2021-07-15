import 'package:flutter/cupertino.dart';
import 'package:karikore/views/members/members.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              CupertinoSliverNavigationBar(
                largeTitle: Text(widget.title),
                backgroundColor: CupertinoColors.white,
              )
            ];
          },
          body: Padding(
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.destructiveRed,
                        shape: BoxShape.circle,
                      ),
                      child:
                      Icon(CupertinoIcons.arrow_right_to_line, size: 240),
                    ),
                  ),
                  CupertinoTextField(
                    placeholder: 'e-mail',
                  ),
                  CupertinoTextField(
                    placeholder: 'password',
                    obscureText: true,
                  ),
                  Container(
                    width: double.infinity,
                    child: CupertinoButton(
                      child: Text('ログイン'),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context, CupertinoPageRoute(builder: (builder) {
                          return MembersView();
                        }));
                      },
                      color: CupertinoColors.activeBlue,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CupertinoButton(
                          child: Text('パスワードを忘れた方'), onPressed: () {}),
                      Text('|'),
                      CupertinoButton(
                        child: Text('アカウント作成'),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ))),
    );
  }
}
