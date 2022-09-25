import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/utils/constants.dart';

class NavigationOption extends StatelessWidget {
  final String? title;
  final bool? selected;
  final Function()? onSelected;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  NavigationOption({
    @required this.title,
    @required this.selected,
    @required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected!();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title!,
            style: TextStyle(
              color: selected! ? kPrimaryColor : Colors.grey[400],
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          selected!
              ? Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 8.0,
                      width: 8.0,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
