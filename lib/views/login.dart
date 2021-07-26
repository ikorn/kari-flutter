import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karikore/main.dart';
import 'package:karikore/model/app_state.dart';
import 'package:karikore/views/members/members.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    this.emailController.dispose();
    this.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, model, child) {
        return CupertinoPageScaffold(
          child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  CupertinoSliverNavigationBar(
                    largeTitle: Text(widget.title),
                    backgroundColor: CupertinoColors.white,
                  )
                ];
              },
              body: Padding(
                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  child: Form(
                      key: _formKey,
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
                              child: Icon(CupertinoIcons.arrow_right_to_line,
                                  size: 240),
                            ),
                          ),
                          CupertinoTextField(
                            controller: emailController,
                            placeholder: 'e-mail',
                          ),
                          CupertinoTextField(
                            controller: passwordController,
                            placeholder: 'password',
                            obscureText: true,
                          ),
                          Container(
                            width: double.infinity,
                            child: CupertinoButton(
                              child: Text('ログイン'),
                              onPressed: () async => onPressLogin(model),
                              color: CupertinoColors.activeBlue,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CupertinoButton(
                                  child: Text('パスワードを忘れた方'),
                                  onPressed: () => onPressForgotPassword()),
                              Text('|'),
                              CupertinoButton(
                                child: Text('アカウント作成'),
                                onPressed: () => onPressCreateAccount(),
                              ),
                            ],
                          )
                        ],
                      )))),
        );
      },
    );
  }

  void onPressLogin(AppState model) async {
    var email = this.emailController.text;
    var password = this.passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      return;
    }

    try {
      var token = await api.login(email, password);
      model.saveToken(token);
      api.setToken(token.accessToken, token.refreshToken);
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (builder) => MembersView()));
    } catch (e) {
      // show error
    }
  }

  void onPressForgotPassword() {
    Navigator.push(context,
        CupertinoPageRoute(builder: (builder) => Text("forgot password")));
  }

  void onPressCreateAccount() {
    Navigator.push(context,
        CupertinoPageRoute(builder: (builder) => Text("create account")));
  }
}
