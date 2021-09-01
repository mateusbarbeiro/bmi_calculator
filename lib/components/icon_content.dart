import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

const iconSize = 80.0;

class IconContent extends StatelessWidget {
    final String label;
    final IconData icon;
    // ignore: use_key_in_widget_constructors
    const IconContent({required this.label, required this.icon});

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Icon(
                    icon,
                    size: iconSize,
                ),
                const SizedBox(
                    height: 15.0,
                ),
                Text(
                    label,
                    style: kLabelTextStyle
                )
            ],
        );
    }
}
