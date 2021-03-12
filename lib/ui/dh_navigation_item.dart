import 'package:dapur_hangus_app/theme.dart';
import 'package:flutter/material.dart';

class DHNavigationItem extends StatefulWidget {
  final String title;
  final bool isSelected;
  final Function onTap;

  DHNavigationItem(
      {@required this.title, @required this.isSelected, @required this.onTap});

  @override
  _DHNavigationItemState createState() => _DHNavigationItemState();
}

class _DHNavigationItemState extends State<DHNavigationItem> {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            margin: EdgeInsets.only(top: defaultPadding * 1.5),
            decoration: BoxDecoration(
              color: widget.isSelected
                  ? Theme.of(context).scaffoldBackgroundColor
                  : Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: AnimatedPadding(
              duration: Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              padding: widget.isSelected
                  ? EdgeInsets.symmetric(
                      vertical: defaultPadding,
                      horizontal: defaultPadding * 2,
                    )
                  : EdgeInsets.symmetric(
                      vertical: defaultPadding / 2,
                      horizontal: defaultPadding,
                    ),
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: widget.isSelected
                        ? null
                        : Theme.of(context).scaffoldBackgroundColor,
                    fontWeight: widget.isSelected ? FontWeight.w700 : null),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
