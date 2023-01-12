import 'package:flutter/material.dart';
import 'package:grocery_app/auth/signup.dart';
import 'package:grocery_app/cart/product_detail.dart';
import 'package:grocery_app/inner_screen/on_sale_screen.dart';
import 'package:grocery_app/orders/orders_screen.dart';
import 'package:grocery_app/screen/btm_bar.dart';
import 'package:grocery_app/viewed_recently/viewed_screen.dart';
import 'package:grocery_app/wishlist/wishlist_screen.dart';
import './consts/theme_data.dart';
import './provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'auth/foget_password.dart';
import 'auth/login.dart';
import 'consts/feeds_screen.dart';
import 'neumorphism.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkThem =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themProvider, child) {
        themProvider.getDarkThem;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(themProvider.getDarkThem, context),
          home: Nuemorphism(),
          routes: {
            OnSaleScreen.routeName: (ctx) => OnSaleScreen(),
            FeedsScreen.routeName: (ctx) => FeedsScreen(),
            ProductDetail.routeName: (ctx) => ProductDetail(),
            WishlistScreen.routeName: (ctx) => WishlistScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            ViewedScreen.routeName: (ctx) => ViewedScreen(),
            SignUpScreen.routeName: (ctx) => SignUpScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
            ForgetPassScreen.routeName1: (ctx) => ForgetPassScreen(),
            BottomBarScreen.routeName1: (ctx) => BottomBarScreen(),
            ForgetPassScreen.routeName2: (ctx) => ForgetPassScreen(),
          },
        );
      }),
    );
  }
}
