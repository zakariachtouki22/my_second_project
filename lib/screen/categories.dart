import 'package:flutter/material.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/categories_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44c),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];
  List<Map<String, dynamic>> catInfo = [
    {'imgPath': 'assets/images/cat/a7.png', 'catText': 'Fruits'},
    {'imgPath': 'assets/images/cat/a6.png', 'catText': 'Vegetables'},
    {'imgPath': 'assets/images/cat/a5.png', 'catText': 'Herbs'},
    {'imgPath': 'assets/images/cat/a4.png', 'catText': 'Nuts'},
    {'imgPath': 'assets/images/cat/a2.png', 'catText': 'Spices'},
    {'imgPath': 'assets/images/cat/a1.png', 'catText': 'Grains'}
  ];
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: TextWidget(
          text: 'Categories',
          color: color,
          textSize: 24,
          isTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(
            6,
            (index) => CategoriesWidget(
              catText: catInfo[index]['catText'],
              passedColor: gridColors[index],
              imgPath: catInfo[index]['imgPath'],
            ),
          ),
        ),
      ),
    );
  }
}
