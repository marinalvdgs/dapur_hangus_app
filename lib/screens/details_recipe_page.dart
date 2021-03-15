import 'package:dapur_hangus_app/theme.dart';
import 'package:dapur_hangus_app/ui/dh_recipe_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsRecipePage extends StatefulWidget {
  @override
  _DetailsRecipePageState createState() => _DetailsRecipePageState();
}

const List<String> tabs = ['Ingredients', 'Instructions', 'Reviews'];
const Map<String, String> icons = {
  '1 hour 30 min': 'assets/alarm-clock.png',
  '5 total serving': 'assets/users.png',
  '420 calories': 'assets/restaurant.png',
  'Difficult': 'assets/contrast.png'
};

class _DetailsRecipePageState extends State<DetailsRecipePage> {
  void navigateBack() {
    Navigator.of(context).pop();
  }

  Widget buildShortInfoBlock(String image, String title) {
    return Column(
      children: [
        Container(
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          margin: EdgeInsets.symmetric(vertical: defaultPadding),
          padding: EdgeInsets.all(defaultPadding),
          child: Image.asset(
            image,
            height: 22,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              .copyWith(color: Colors.white),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: defaultPadding, top: defaultPadding),
                    child: IconButton(
                        icon: Image.asset(
                          'assets/back-button.png',
                          color: Colors.white,
                        ),
                        onPressed: navigateBack),
                  ),
                ),
                Positioned(
                    top: -MediaQuery.of(context).size.width / 7,
                    right: -MediaQuery.of(context).size.width / 5,
                    child: Image.asset(
                      'assets/dish.png',
                      height: MediaQuery.of(context).size.height * 0.45,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: defaultPadding, horizontal: defaultPadding * 2.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nasi Lemak Chicken Rendang',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.white),
                ),
                Text(
                  'Nasi Lemak is a Malay fragrant rice dish cooked in coconut milk and pandan leaf. Served with boiled egg. peanuts, anchovies,cucumber slices and spicy sambal. Chicken rendang is slow cooked and stewed in the rendang sauce and this chicken rendang recipe yields flavorful and tender chicken, with complex structure of flavors, with the intense aroma of the exotic spices.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.white, height: 1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: icons.keys
                      .map((e) => buildShortInfoBlock(icons[e], e))
                      .toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: DHRecipeTabBar(
                tabsTitle: tabs, tabsBody: tabs.map((e) => Text(e)).toList()),
          )
        ],
      ),
    );
  }
}
