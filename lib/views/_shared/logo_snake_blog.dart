import 'package:blog_snake/controllers/stores/web_menu_store.dart';
import 'package:blog_snake/views/home/home_view.dart';
import 'package:provider/provider.dart';

import '/config/constants.dart';
import 'package:flutter/material.dart';

class LogoSnakeBlog extends StatelessWidget {
  const LogoSnakeBlog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebMenuStore _webMenuStore = Provider.of<WebMenuStore>(context);

    return InkWell(
      child: Row(
        children: [
          RichText(
              text: const TextSpan(
                  text: 'Snake',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  children: [
                TextSpan(
                  text: 'Blog ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )
              ])),
          Image.asset(
            'assets/icons/snake_icon.png',
            fit: BoxFit.cover,
            height: 40,
          ),
        ],
      ),
      onTap: () {
        _webMenuStore.updateIndex(0);
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: Duration.zero,
            pageBuilder: (buildContext, animation1, animation2) =>
                const HomeView(),
          ),
        );
      },
    );
  }
}
