import 'package:dapur_hangus_app/theme.dart';
import 'package:flutter/material.dart';

class DHDishCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.6,
        maxHeight: MediaQuery.of(context).size.width * 0.8,
      ),
      margin: const EdgeInsets.symmetric(
          vertical: defaultPadding / 2, horizontal: defaultPadding * 2),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(32)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 6,
                offset: Offset(1, 1),
              )
            ]),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Color(0xFF11538C),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(defaultPadding),
                        topLeft: Radius.circular(defaultPadding * 2))),
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: defaultPadding * 2,
                        top: defaultPadding,
                        bottom: defaultPadding,
                        right: defaultPadding),
                    child: Text(
                      '1H 30M',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: defaultPadding * 2, right: defaultPadding),
                child: Icon(
                  Icons.bookmark_sharp,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  size: 40,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: defaultPadding,
                    bottom: defaultPadding,
                    right: defaultPadding * 5),
                child: RichText(
                  maxLines: 3,
                  text: TextSpan(
                      text: 'Nasi Lemak Chicken Rendang',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          height: 1),
                      children: [
                        TextSpan(
                          text: '\nMalay Cuisine',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: Colors.white, height: 1),
                        )
                      ]),
                ),
              ),
            ),
            Positioned(
                right: -defaultPadding * 2,
                top: defaultPadding / 2,
                child: Image.asset(
                  'assets/dish.png',
                  height: MediaQuery.of(context).size.width * 0.6,
                ))
          ],
        ),
      ),
    );
  }
}
