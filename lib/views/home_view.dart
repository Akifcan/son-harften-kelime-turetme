import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelime_turetme/core/constants.dart';
import 'package:kelime_turetme/widgets/app_rounded_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  redirectToPlay() {
    Get.toNamed('/play');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _title(context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            AppRoundedButton(title: 'Başla', callback: redirectToPlay)
          ],
        ),
      ),
    );
  }

  Widget _title(context) => Text(APP_TITLE,
      style:
          Theme.of(context).textTheme.headline4.copyWith(color: Colors.black));
}
