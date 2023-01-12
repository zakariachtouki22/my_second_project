import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/orders/orders_widget.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/empty_screen.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/OrdersScreenState';

  @override
  State<OrdersScreen> createState() => _OrdersScreen();
}

class _OrdersScreen extends State<OrdersScreen> {
  bool _isEmpty = true;
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return _isEmpty == true
        ? EmptyScreen(
            imagePath: 'assets/images/cat/a5.png',
            title: 'Whoops!',
            subtitle: 'Your cart is empty\nAdd something and make me happy',
            buttonText: 'Shop now',
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    IconlyLight.arrowLeft2,
                    color: color,
                  )),
              title: TextWidget(
                text: 'YourOrders(2)',
                color: color,
                textSize: 20,
                isTitle: true,
              ),
              //centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            body: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                    child: OrdersWidget(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: color,
                  );
                },
                itemCount: 10),
          );
  }
}
