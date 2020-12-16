import 'package:flutter/material.dart';

class AppRoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final Color color;
  final Color textColor;

  AppRoundedButton(
      {@required this.title,
      @required this.callback,
      this.color,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: this.color != null ? this.color : Colors.white,
        textColor: this.textColor != null ? this.textColor : Colors.black,
        onPressed: this.callback,
        child: Text(
          this.title,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontWeight: FontWeight.bold),
        ));
  }
}
