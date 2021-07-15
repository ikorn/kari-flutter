import 'package:flutter/cupertino.dart';

class FavoriteButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavoriteButtonState();
}

class FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
        child: CupertinoButton(
        child: _isFavorited ? Icon(CupertinoIcons.heart_fill) : Icon(CupertinoIcons.heart),
        onPressed: _toggleFavorite,
    ));
  }
}