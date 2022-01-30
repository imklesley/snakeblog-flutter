import 'package:blog_snake/config/constants.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String categoryName;
  final int quantityByCategory;
  final VoidCallback onPressed;

  const CategoryButton({
    Key? key,
    required this.categoryName,
    required this.quantityByCategory,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          primary: kPrimaryColor, padding: EdgeInsets.zero),
      onPressed: onPressed,
      child: RichText(
        text: TextSpan(
          text: categoryName,
          style: const TextStyle(
              color: kDarkBlackColor, fontWeight: FontWeight.w600),
          children: [
            TextSpan(
                text: '   ($quantityByCategory)',
                style: const TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.normal))
          ],
        ),
      ),
    );
  }
}
