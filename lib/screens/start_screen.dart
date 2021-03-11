import 'package:dapur_hangus_app/screens/receipt_book_page.dart';
import 'package:flutter/material.dart';
import 'package:dapur_hangus_app/theme.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  void navigateToReceiptBook() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => ReceiptBookPage()));
  }

  Widget buildButton() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        bottomLeft: Radius.circular(50),
      ),
      child: Material(
        color: Colors.transparent,
        type: MaterialType.button,
        child: InkWell(
          onTap: navigateToReceiptBook,
          child: Ink(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(
                left: defaultPadding * 2.5,
                right: defaultPadding * 2,
                top: defaultPadding,
                bottom: defaultPadding),
            child: Center(
              child: Text(
                'Get Started',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: defaultPadding * 2, top: defaultPadding),
                child: Icon(
                  Icons.person_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 32,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: defaultPadding * 2, left: defaultPadding / 2),
              child: RotatedBox(
                quarterTurns: -1,
                child: RichText(
                  text: TextSpan(
                      text: 'Dapur',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                      children: [
                        TextSpan(
                          text: 'Hangus',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Color(0xFF2E88D6),
                              ),
                        ),
                        TextSpan(
                            text: '\nCooking for Malaysian recipe',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(color: Colors.white, height: 0.0))
                      ]),
                ),
              ),
            ),
            Positioned(
              right: -MediaQuery.of(context).size.width * 0.4,
              top: MediaQuery.of(context).size.height / 7,
              child: Image.asset('assets/dish.png'),
              height: MediaQuery.of(context).size.height * 0.6,
            ),
            Positioned(
              right: 0,
              bottom: MediaQuery.of(context).size.height / 8,
              child: buildButton(),
            ),
          ],
        ),
      ),
    );
  }
}
