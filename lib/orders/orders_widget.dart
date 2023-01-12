import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/cart/product_detail.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class OrdersWidget extends StatefulWidget {
  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return ListTile(
      title: TextWidget(text: 'Title x 12', color: color, textSize: 18),
      subtitle: const Text('Paid \$12.8'),
      leading: FancyShimmerImage(
        width: size.width * 0.18,
        imageUrl: 'https://picsum.photos/250?image=9',
        boxFit: BoxFit.fill,
      ),
      trailing: TextWidget(
        text: '05/01/2023',
        color: color,
        textSize: 18,
      ),
      onTap: () {
        GlobalMethods.navigatTo(
            context: context, routeName: ProductDetail.routeName);
      },
    );
  }
}
