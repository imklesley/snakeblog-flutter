import 'package:blog_snake/config/constants.dart';
import 'package:flutter/material.dart';

class SideCard extends StatelessWidget {

  final String titleSection;
  final Widget bodyWidget;



  const SideCard({
    Key? key, required this.titleSection, required this.bodyWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        mainAxisAlignment:
        MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            titleSection,
            style: const TextStyle(
                color: kDarkBlackColor,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          bodyWidget
        ],
      ),
    );
  }
}
