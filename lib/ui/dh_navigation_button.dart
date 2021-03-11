import 'package:dapur_hangus_app/theme.dart';
import 'package:flutter/material.dart';

class DHNavigationButton extends StatefulWidget {
  final String title;
  final bool isSelected;
  final Function onTap;

  DHNavigationButton(
      {@required this.title, @required this.isSelected, @required this.onTap});

  @override
  _DHNavigationButtonState createState() => _DHNavigationButtonState();
}

class _DHNavigationButtonState extends State<DHNavigationButton> {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            margin: EdgeInsets.only(top: defaultPadding * 2),
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: widget.isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color:
                      widget.isSelected ? null : Theme.of(context).primaryColor,
                  fontWeight: widget.isSelected ? FontWeight.w700 : null),
            ),
          ),
        ),
      ),
    );
  }
}
