import 'package:blog_snake/config/constants.dart';
import 'package:blog_snake/views/_shared/auth_buttons.dart';
import 'package:blog_snake/views/_shared/logo_snake_blog.dart';
import 'package:blog_snake/views/_shared/social_buttons.dart';
import 'package:blog_snake/views/home/components/web_menu.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kDarkBlackColor,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            constraints: const BoxConstraints(maxWidth: kMaxWidth),
            child: Column(
              children: [
                Row(
                  children: const [
                    LogoSnakeBlog(),
                    Spacer(),
                    WebMenu(),
                    Spacer(),
                    SocialButtons(),
                    LoginButton(),
                    RegisterButton()
                  ],
                ),
                const SizedBox(
                  height: kDefaultPadding * 2,
                ),
                const Text(
                  'Welcome to Snake Blog',
                  style: TextStyle(
                      fontSize: 32, color: Colors.white, letterSpacing: 4),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Here you find everything about Python with Django and Dart with Flutter!',
                    style: TextStyle(color: Colors.white70, letterSpacing: 2),
                  ),
                ),
                FittedBox(
                  child: TextButton(
                    style: TextButton.styleFrom(primary: kPrimaryColor),
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Text(
                            'See our courses',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
