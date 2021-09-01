import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
    // ignore: use_key_in_widget_constructors
    const BottomButton({required this.label, required this.onTap});
    
    final String label;
    final void Function()? onTap;

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: onTap,
            child: Container(
                child: Center(
                    child: Text(
                        label,
                        style: kLargeButtonTextStyle,
                    ),
                ),
                color: kBottomContainerColor,
                margin: const EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kBottomContainerHeigh,
            ),
        );
    }
}