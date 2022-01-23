import 'package:flutter/material.dart';

import 'components/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(230),
          child: CustomAppBar(),
        ),
        body: ListView(
          children: [
            Container(
              color: Colors.black,
              height: 200,
            ),
            Container(
              color: Colors.black54,
              height: 200,
            ),
            Container(
              color: Colors.deepPurple,
              height: 200,
            ),
            Container(
              color: Colors.deepOrangeAccent,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
