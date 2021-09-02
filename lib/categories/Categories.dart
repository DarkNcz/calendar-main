import 'package:flutter/material.dart';
import 'package:calendar/categories/Category_card.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: GridView.count(
        crossAxisCount: 4,
        children: <Widget>[
          CategoryCard(
              Icon(
                Icons.train,
                size: 40,
              ),
              'Traffic'),
          CategoryCard(
              Icon(
                Icons.table_chart,
                size: 40,
              ),
              'Daily'),
          CategoryCard(
              Icon(
                Icons.local_pizza,
                size: 40,
              ),
              'Diet'),
          CategoryCard(
              Icon(
                Icons.no_drinks_outlined,
                size: 40,
              ),
              'Social'),
          CategoryCard(
              Icon(
                Icons.home,
                size: 40,
              ),
              'Residantial'),
          CategoryCard(
              Icon(
                Icons.add_box,
                size: 40,
              ),
              'Gift'),
          CategoryCard(
              Icon(
                Icons.phone_android,
                size: 40,
              ),
              'Communication'),
          CategoryCard(
              Icon(
                Icons.shopping_cart,
                size: 40,
              ),
              'Dress'),
          CategoryCard(
              Icon(
                Icons.movie,
                size: 40,
              ),
              'Recreation'),
          CategoryCard(
              Icon(
                Icons.brush,
                size: 40,
              ),
              'Beauty'),
          CategoryCard(
              Icon(
                Icons.medical_services,
                size: 40,
              ),
              'Medical'),
          CategoryCard(
              Icon(
                Icons.money_off_csred_rounded,
                size: 40,
              ),
              'Tax'),
        ],
      ),
    );
  }
}
