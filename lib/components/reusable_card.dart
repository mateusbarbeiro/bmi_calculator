import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
    final Function? onPressed;
    final Color color;
    final Widget? cardChild;

    // ignore: use_key_in_widget_constructors
    const ReusableCard({required this.color, this.cardChild, this.onPressed});

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: () {
                onPressed != null ? onPressed!() : null;
            },
            child: Container(
                child: cardChild,
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: color,
                ),
            ),
        );
    }
}
