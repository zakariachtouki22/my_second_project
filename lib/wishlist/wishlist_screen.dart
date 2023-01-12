import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/back_widget.dart';
import 'package:grocery_app/widgets/empty_screen.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:grocery_app/wishlist/wishlist_widget.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreenState';
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    bool _isEmpty = true;
    return _isEmpty == true
        ? EmptyScreen(
            imagePath: 'assets/images/cat/a1.png',
            title: 'Whoops!',
            subtitle: 'Your cart is empty\nAdd something and make me happy',
            buttonText: 'Shop now',
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: BackWidget(),
              automaticallyImplyLeading: false,
              elevation: 0,
              title: TextWidget(
                text: 'Wishlist(2)',
                color: color,
                textSize: 20,
                isTitle: true,
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              actions: [
                IconButton(
                    onPressed: () {
                      GlobalMethods.warningDialog(
                          context: context,
                          title: 'Empty your wishlist',
                          subtitle: 'Are you sure ?',
                          fct: () {});
                    },
                    icon: Icon(
                      IconlyLight.delete,
                      color: color,
                    ))
              ],
            ),
            body: WishListWidget());
  }
}
