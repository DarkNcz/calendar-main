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
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.train,
                  size: 40,
                ),
                /*'เดินทาง'*/
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.table_chart,
                  size: 40,
                ),
                /*'Daily'*/
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.fastfood_outlined,
                  size: 40,
                ),
                /* 'อาหาร'*/
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.celebration_outlined,
                  size: 40,
                ),
                /* 'สังคม'*/
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.apartment,
                  size: 40,
                ),
                /*'ที่พัก' */
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.card_giftcard,
                  size: 40,
                ),
                /*  'ของขวัญ'*/
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.phone_android,
                  size: 40,
                ),
                /* 'อินเตอร์เน็ต'*/
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.shopping_cart,
                  size: 40,
                ),
                /* 'การแต่งกาย'*/
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.movie,
                  size: 40,
                ),
                /* 'ภาพยนต์'*/
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.brush,
                  size: 40,
                ),
                /*'ความงาม' */
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.medical_services,
                  size: 40,
                ),
                /*'โรงพยาบาล' */
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.monetization_on_outlined,
                  size: 40,
                ),
                /*'ภาษี' */
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.airplanemode_active,
                  size: 40,
                ),
                /*'ท่องเที่ยว' */
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.camera_alt_outlined,
                  size: 40,
                ),
                /*'รูป' */
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.casino_rounded,
                  size: 40,
                ),
                /*  'พนัน'*/
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.chair_rounded,
                  size: 40,
                ),
                /* 'เฟอร์นิเจอร์'*/
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.coffee,
                  size: 40,
                ),
                /*'เครื่องดื่ม' */
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.ice_skating_outlined,
                  size: 40,
                ),
                /*   'กีฬา'*/
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.local_gas_station_outlined,
                  size: 40,
                ),
                /* 'น้ำมัน'*/
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.pets_outlined,
                  size: 40,
                ),
                /*  'สัตว์เลี้ยง'*/
              )),
          IconButton(
              onPressed: () {},
              icon: CategoryCard(
                Icon(
                  Icons.sports_esports_rounded,
                  size: 40,
                ),
                /* 'เกมส์'*/
              )),
        ],
      ),
    );
  }
}
