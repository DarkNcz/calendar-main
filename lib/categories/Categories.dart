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
              'เดินทาง'),
          CategoryCard(
              Icon(
                Icons.table_chart,
                size: 40,
              ),
              'Daily'),
          CategoryCard(
              Icon(
                Icons.fastfood_outlined,
                size: 40,
              ),
              'อาหาร'),
          CategoryCard(
              Icon(
                Icons.celebration_outlined,
                size: 40,
              ),
              'สังคม'),
          CategoryCard(
              Icon(
                Icons.apartment,
                size: 40,
              ),
              'ที่พัก'),
          CategoryCard(
              Icon(
                Icons.card_giftcard,
                size: 40,
              ),
              'ของขวัญ'),
          CategoryCard(
              Icon(
                Icons.phone_android,
                size: 40,
              ),
              'อินเตอร์เน็ต'),
          CategoryCard(
              Icon(
                Icons.shopping_cart,
                size: 40,
              ),
              'การแต่งกาย'),
          CategoryCard(
              Icon(
                Icons.movie,
                size: 40,
              ),
              'ภาพยนต์'),
          CategoryCard(
              Icon(
                Icons.brush,
                size: 40,
              ),
              'ความงาม'),
          CategoryCard(
              Icon(
                Icons.medical_services,
                size: 40,
              ),
              'โรงพยาบาล'),
          CategoryCard(
              Icon(
                Icons.monetization_on_outlined,
                size: 40,
              ),
              'ภาษี'),
          CategoryCard(
              Icon(
                Icons.airplanemode_active,
                size: 40,
              ),
              'ท่องเที่ยว'),
          CategoryCard(
              Icon(
                Icons.camera_alt_outlined,
                size: 40,
              ),
              'รูป'),
          CategoryCard(
              Icon(
                Icons.casino_rounded,
                size: 40,
              ),
              'พนัน'),
          CategoryCard(
              Icon(
                Icons.chair_rounded,
                size: 40,
              ),
              'เฟอร์นิเจอร์'),
          CategoryCard(
              Icon(
                Icons.coffee,
                size: 40,
              ),
              'เครื่องดื่ม'),
          CategoryCard(
              Icon(
                Icons.ice_skating_outlined,
                size: 40,
              ),
              'กีฬา'),
          CategoryCard(
              Icon(
                Icons.local_gas_station_outlined,
                size: 40,
              ),
              'น้ำมัน'),
          CategoryCard(
              Icon(
                Icons.pets_outlined,
                size: 40,
              ),
              'สัตว์เลี้ยง'),
          CategoryCard(
              Icon(
                Icons.sports_esports_rounded,
                size: 40,
              ),
              'เกมส์'),
        ],
      ),
    );
  }
}
