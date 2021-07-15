import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: Image.asset('asset/images/logo.png'),
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'Enter E-mail address.',
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey)
                    ),
                  ),
                ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter password',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey)
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}