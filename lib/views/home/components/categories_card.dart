import 'package:blog_snake/views/home/components/side_card.dart';
import 'package:flutter/material.dart';

import 'category_button.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideCard(
      titleSection: 'Categories',
      bodyWidget: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          // TODO: Pegar o quantitativo de cada tag e descreve-las abaixo e ao clicar no link fazer a busca de posts com a tag
          CategoryButton(
            categoryName: 'Dart',
            quantityByCategory: 6,
            onPressed: () {},
          ),
          CategoryButton(
            categoryName: 'Flutter',
            quantityByCategory: 8,
            onPressed: () {},
          ),

          CategoryButton(
            categoryName: 'Python',
            quantityByCategory: 9,
            onPressed: () {},
          ),
          CategoryButton(
            categoryName: 'Django',
            quantityByCategory: 7,
            onPressed: () {},
          ),
          CategoryButton(
            categoryName: 'Design',
            quantityByCategory: 2,
            onPressed: () {},
          ),
          CategoryButton(
            categoryName: 'Data Science',
            quantityByCategory: 4,
            onPressed: () {},
          ),
          CategoryButton(
            categoryName: 'Power BI',
            quantityByCategory: 4,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
