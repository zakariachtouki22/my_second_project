import 'package:flutter/material.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/back_widget.dart';
import 'package:grocery_app/widgets/on_sale_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = '/OnSaleScreen';
  @override
  Widget build(BuildContext context) {
    bool saleIsEmpty = true;
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        leading: BackWidget(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: TextWidget(
          text: 'Product On Sale',
          color: color,
          textSize: 24,
          isTitle: true,
        ),
      ),
      body: saleIsEmpty == true
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset('assets/images/cat/empty.png')),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'No product on sale yet \n Stay tuned',
                    style: TextStyle(
                        color: color,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              childAspectRatio: size.width / (size.height * 0.52),
              // crossAxisSpacing: 10,
              // mainAxisSpacing: 10,
              children: List.generate(4, (index) => OnSaleWidget()),
            ),
    );
  }
}
