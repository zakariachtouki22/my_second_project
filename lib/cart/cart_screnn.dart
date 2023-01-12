import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/cart/cart_widget.dart';
import 'package:grocery_app/widgets/empty_screen.dart';
import 'package:grocery_app/cart/product_detail.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    bool _isEmpty = true;
    return _isEmpty == true
        ? EmptyScreen(
            imagePath: 'assets/images/cat/a2.png',
            title: 'Whoops!',
            subtitle: 'Your cart is empty\nAdd something and make me happy',
            buttonText: 'Shop now',
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: TextWidget(
                text: 'Cart(3)',
                color: color,
                textSize: 20,
                isTitle: true,
              ),
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                    onPressed: () {
                      GlobalMethods.warningDialog(
                          context: context,
                          title: 'Empty your cart',
                          subtitle: 'Are you sure ?',
                          fct: () {});
                    },
                    icon: Icon(
                      IconlyLight.delete,
                      color: color,
                    ))
              ],
            ),
            body: Column(
              children: [
                _checkout(context: context),
                Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (ctx, index) {
                        return CartWidget();
                      }),
                ),
              ],
            ));
  }

  Widget _checkout({required BuildContext context}) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: () {
                  GlobalMethods.navigatTo(
                      context: context, routeName: ProductDetail.routeName);
                },
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                      text: 'Order New', color: Colors.white, textSize: 20),
                ),
              ),
            ),
            FittedBox(
                child: TextWidget(
              text: 'Totale: \$18.24',
              color: color,
              textSize: 20,
              isTitle: true,
            )),
          ],
        ),
      ),
    );
  }
}
