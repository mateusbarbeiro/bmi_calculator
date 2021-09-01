import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class ResultsPage extends StatelessWidget {

    // ignore: use_key_in_widget_constructors
    const ResultsPage({required this.bmiResult, required this.resultText, required this.interpretation});

    final String bmiResult;
    final String resultText;
    final String interpretation;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Calculadora de IMC'),
            ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                    Expanded(
                        child: Container(
                            padding: const EdgeInsets.all(15.0),
                            alignment: Alignment.bottomLeft,
                            child: const Text(
                                'Seu Resultado',
                                style: kTitleTextStyle,
                            ),
                        ),
                    ),
                    Expanded(
                        flex: 5,
                        child: ReusableCard(
                            color: kActiveCardColor,
                            cardChild: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                    Text(
                                        resultText.toUpperCase(),
                                        style: kResultTextStyle,
                                    ),
                                    Text(
                                        bmiResult,
                                        style: kBMITextStyle,
                                    ),
                                    Text(
                                        interpretation,
                                        textAlign: TextAlign.center,
                                        style: kBodyTextStyle,
                                    )
                                ],
                            ),
                        ),
                    ),
                    BottomButton(
                        label: 'RECALCULAR',
                        onTap: () {
                            Navigator.pop(context);
                        },
                    ),
                ],
            ),
        );
    }
}
