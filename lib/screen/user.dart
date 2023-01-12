import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/orders/orders_screen.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/viewed_recently/viewed_screen.dart';
import 'package:grocery_app/wishlist/wishlist_screen.dart';
import '../provider/dark_theme_provider.dart';
import '../widgets/text_widget.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController = TextEditingController();
  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkThem ? Colors.white : Colors.black;
    Future<void> _showAdressDialog() async {
      await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Update'),
              content: TextField(
                // onChanged: (value) {
                //   print(
                //       '_addressTextController.text${_addressTextController.text}');
                //   _addressTextController.text;
                // },
                controller: _addressTextController,
                maxLines: 5,
                decoration:
                    const InputDecoration(hintText: 'your address email'),
              ),
              actions: [
                TextButton(onPressed: () {}, child: const Text('Update'))
              ],
            );
          });
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Hi, ',
                    style: const TextStyle(
                        color: Colors.cyan,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'MyName',
                        style: TextStyle(
                            color: color,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('My name is pressed');
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: 'email@gmail.com',
                  color: color,
                  textSize: 15,
                  //isTitle: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                _listTile(
                    title: 'Address 2',
                    color: color,
                    subtitle: 'My subtitle',
                    icon: IconlyLight.profile,
                    onpressed: () async {
                      await _showAdressDialog();
                    }),
                _listTile(
                    title: 'Orders',
                    color: color,
                    //subtitle: 'profile',
                    icon: IconlyLight.bag,
                    onpressed: () {
                      GlobalMethods.navigatTo(
                          context: context, routeName: OrdersScreen.routeName);
                    }),
                _listTile(
                    title: 'Wishlist',
                    color: color,
                    //subtitle: 'setting',
                    icon: IconlyLight.heart,
                    onpressed: () {
                      GlobalMethods.navigatTo(
                          context: context,
                          routeName: WishlistScreen.routeName);
                    }),
                _listTile(
                    title: 'Viewed',
                    color: color,
                    //subtitle: 'setting',
                    icon: IconlyLight.show,
                    onpressed: () {
                      GlobalMethods.navigatTo(
                          context: context, routeName: ViewedScreen.routeName);
                    }),
                _listTile(
                    title: 'Forget Password',
                    color: color,
                    //subtitle: 'setting',
                    icon: IconlyLight.unlock,
                    onpressed: () {}),
                SwitchListTile(
                  title: TextWidget(
                    text: themeState.getDarkThem ? 'Dark mode' : 'Light mode',
                    color: color,
                    textSize: 22,
                    //isTitle: true,
                  ),
                  secondary: Icon(themeState.getDarkThem
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkThem = value;
                    });
                  },
                  value: themeState.getDarkThem,
                ),
                _listTile(
                    title: 'Logout',
                    //subtitle: 'setting',
                    icon: IconlyLight.logout,
                    color: color,
                    onpressed: () async {
                      await GlobalMethods.warningDialog(
                        context: context,
                        title: 'Sign Out',
                        subtitle: 'Do you wanna sign out ?',
                        fct: () {},
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listTile(
      {required String title,
      String? subtitle,
      required IconData icon,
      required Function onpressed,
      required Color color}) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 22,
        //isTitle: true,
      ),
      subtitle: TextWidget(
        text: subtitle == null ? '' : subtitle,
        color: color,
        textSize: 18,
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        return onpressed();
      },
    );
  }
}
