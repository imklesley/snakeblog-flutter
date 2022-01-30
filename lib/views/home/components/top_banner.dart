import 'package:blog_snake/config/constants.dart';
import 'package:flutter/material.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180 ,
      color: kDarkBlackColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome to Snake Blog',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 32, color: Colors.white, letterSpacing: 4),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              'Here you find everything about Python with Django and Dart with Flutter!',textAlign: TextAlign.center,
              style:
              TextStyle(color: Colors.white70, letterSpacing: 2),
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
          ),
        ],
      ),
    );
  }
}
