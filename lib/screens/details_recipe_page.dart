import 'package:dapur_hangus_app/theme.dart';
import 'package:dapur_hangus_app/ui/dh_recipe_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsRecipePage extends StatefulWidget {
  final String image;
  final String title;

  DetailsRecipePage({@required this.image, @required this.title});

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

  Widget buildTextContainer() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: defaultPadding * 2.5, vertical: defaultPadding / 2),
      child: Text(
        '1 kg Chicken\n1 tbsp (15g) salt\n1 cup (85g) kerisik\n1 cup (250ml) coconut milk\n1 piece (about 5 cm) cinnamon bark\n1 star anise\n4 cloves',
        style:
            Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),
      ),
    );
  }

  Widget buildBottomPanel() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(topRight: defaultRadius),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Icon(
                  Icons.bookmark_sharp,
                  color: Theme.of(context).primaryColor,
                  size: 40,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: defaultPadding * 2.5),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.all(defaultRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: defaultPadding * 4),
                      child: Text(
                        'Watch Demo',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: defaultPadding * 2.5,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: defaultPadding * 1.5),
                      child: Image.asset(
                        'assets/video-player.png',
                        color: Theme.of(context).primaryColor,
                        height: 24,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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
                      widget.image,
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
                Padding(
                  padding: const EdgeInsets.only(bottom: defaultPadding / 2),
                  child: Text(
                    widget.title,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.white, height: 1),
                  ),
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
          DHRecipeTabBar(
              tabsTitle: tabs,
              tabsBody: tabs.map((e) => buildTextContainer()).toList())
        ],
      ),
      bottomNavigationBar: buildBottomPanel(),
    );
  }
}
