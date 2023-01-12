import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/cart/product_detail.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/heart_btn.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class WishListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return GestureDetector(
      onTap: () {
        GlobalMethods.navigatTo(
            context: context, routeName: ProductDetail.routeName);
      },
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        padding: EdgeInsets.zero,
        childAspectRatio: size.width / (size.height * 0.40),
        // crossAxisSpacing: 10,
        // mainAxisSpacing: 10,
        children: List.generate(
          4,
          (index) => Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  border: Border.all(color: color, width: 0.5),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 3,
                          child: Image.asset('assets/images/cat/a5.png')),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        IconlyLight.bag2,
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: HeartBTN(),
                                  )
                                ],
                              ),
                            ),
                            Flexible(
                                flex: 2,
                                child: TextWidget(
                                  text: 'Peass',
                                  color: color,
                                  textSize: 18,
                                  isTitle: true,
                                )),
                            Flexible(
                              flex: 2,
                              child: TextWidget(
                                text: '\$2.99',
                                color: color,
                                textSize: 20,
                                isTitle: true,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
