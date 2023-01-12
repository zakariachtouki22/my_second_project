import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/consts/const%20.dart';
import 'package:grocery_app/consts/feeds_screen.dart';
import 'package:grocery_app/inner_screen/on_sale_screen.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/feed_items.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import '../widgets/on_sale_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: size.height * 0.33,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  Consts.offerImages[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: false,
              itemCount: Consts.offerImages.length,
              pagination: SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: const DotSwiperPaginationBuilder(
                  color: Colors.white70,
                  activeColor: Colors.red,
                ),
              ),
              control: SwiperControl(color: Colors.white.withOpacity(0.6)),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextButton(
              onPressed: () {
                GlobalMethods.navigatTo(
                    context: context, routeName: OnSaleScreen.routeName);
              },
              child: TextWidget(
                text: 'View all',
                color: Colors.cyan,
                textSize: 22,
                isTitle: true,
              )),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              RotatedBox(
                quarterTurns: -1,
                child: Row(
                  children: [
                    TextWidget(
                      text: 'on sale'.toUpperCase(),
                      color: Colors.red,
                      textSize: 22,
                      isTitle: true,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      IconlyLight.discount,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                child: SizedBox(
                  height: size.height * 0.25,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return OnSaleWidget();
                      }),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: 'Our Products',
                  color: color,
                  textSize: 22,
                  isTitle: true,
                ),
                TextButton(
                    onPressed: () {
                      GlobalMethods.navigatTo(
                          context: context, routeName: FeedsScreen.routeName);
                    },
                    child: TextWidget(
                      text: 'Browse all',
                      color: Colors.cyan,
                      textSize: 22,
                      isTitle: true,
                    )),
              ],
            ),
          ),
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            padding: EdgeInsets.zero,
            childAspectRatio: size.width / (size.height * 0.69),
            // crossAxisSpacing: 10,
            // mainAxisSpacing: 10,
            children: List.generate(4, (index) => FeedItems()),
          ),
        ]),
      ),
    );
  }
}
