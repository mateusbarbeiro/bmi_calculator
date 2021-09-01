import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
    // ignore: use_key_in_widget_constructors
    const RoundIconButton({required this.icon, required this.onPressed});

    final IconData icon;
    final void Function()? onPressed;

    @override
    Widget build(BuildContext context) {
        return RawMaterialButton(
            child: Icon(icon),
            elevation: 6.0,
            constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            fillColor: const Color(0xff4c4f5e),
            onPressed: onPressed,
        );
    }
}
