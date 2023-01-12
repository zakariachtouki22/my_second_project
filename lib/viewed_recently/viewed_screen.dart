import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/viewed_recently/viewed_widget.dart';
import 'package:grocery_app/widgets/empty_screen.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class ViewedScreen extends StatefulWidget {
  static const routeName = '/ViewedScreenState';

  @override
  State<ViewedScreen> createState() => _ViewedScreen();
}

class _ViewedScreen extends State<ViewedScreen> {
  @override
  Widget build(BuildContext context) {
    bool _isEmpty = true;
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return _isEmpty == true
        ? EmptyScreen(
            title: 'title',
            subtitle: 'subtitle',
            buttonText: 'buttonText',
            imagePath: 'assets/images/cat/a6.png')
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
                text: 'History',
                color: color,
                textSize: 20,
                isTitle: true,
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethods.warningDialog(
                        context: context,
                        title: 'Empty your history',
                        subtitle: 'Are you sure',
                        fct: () {});
                  },
                  icon: Icon(
                    IconlyLight.delete,
                    color: color,
                  ),
                )
              ],
            ),
            body: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                    child: ViewedWidget(),
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
