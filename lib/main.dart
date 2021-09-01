import 'dart:math';
import 'package:flutter/material.dart';
import './screens/input_page.dart';

void main() {
    runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
    const BMICalculator({Key? key}) : super(key: key);

    int tintValue(int value, double factor) =>
            max(0, min((value + ((255 - value) * factor)).round(), 255));

    Color tintColor(Color color, double factor) => Color.fromRGBO(
                tintValue(color.red, factor),
                tintValue(color.green, factor),
                tintValue(color.blue, factor),
                1,
            );

    int shadeValue(int value, double factor) =>
            max(0, min(value - (value * factor).round(), 255));

    Color shadeColor(Color color, double factor) => Color.fromRGBO(
                shadeValue(color.red, factor),
                shadeValue(color.green, factor),
                shadeValue(color.blue, factor),
                1,
            );

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: const InputPage(),
            theme: ThemeData.dark().copyWith(
                // primaryColorDark: const Color(0xff0a0e21),
                // primaryColorDark: const Color(0xff0a0e21),
                colorScheme: ColorScheme.fromSwatch(
                    primarySwatch: MaterialColor(
                        0xff0a0e21,
                        {
                            50: tintColor(const Color(0xff0a0e21), 0.9),
                            100: tintColor(const Color(0xff0a0e21), 0.8),
                            200: tintColor(const Color(0xff0a0e21), 0.6),
                            300: tintColor(const Color(0xff0a0e21), 0.4),
                            400: tintColor(const Color(0xff0a0e21), 0.2),
                            500: const Color(0xff0a0e21),
                            600: shadeColor(const Color(0xff0a0e21), 0.1),
                            700: shadeColor(const Color(0xff0a0e21), 0.2),
                            800: shadeColor(const Color(0xff0a0e21), 0.3),
                            900: shadeColor(const Color(0xff0a0e21), 0.4),
                        },
                    ),
                ),
                scaffoldBackgroundColor: const Color(0xff0a0e21),
            ),
        );
    }
}
