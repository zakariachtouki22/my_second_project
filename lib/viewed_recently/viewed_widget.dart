import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/cart/product_detail.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class ViewedWidget extends StatefulWidget {
  @override
  State<ViewedWidget> createState() => _ViewedWidgetState();
}

class _ViewedWidgetState extends State<ViewedWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return ListTile(
      title: TextWidget(
        text: 'Title',
        color: color,
        textSize: 22,
        isTitle: true,
      ),
      subtitle: const Text('Paid \$12.8'),
      leading: FancyShimmerImage(
        width: size.width * 0.18,
        imageUrl: 'https://picsum.photos/250?image=9',
        boxFit: BoxFit.fill,
      ),
      trailing: GestureDetector(
        child: Container(
          width: size.width * 0.12,
          height: size.width * 0.12,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(12)),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        onTap: () {},
      ),
      onTap: () {
        GlobalMethods.navigatTo(
            context: context, routeName: ProductDetail.routeName);
      },
    );
  }
}
