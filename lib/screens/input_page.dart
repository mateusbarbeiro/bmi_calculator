import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
    male,
    female,
}

class InputPage extends StatefulWidget {
    const InputPage({Key? key}) : super(key: key);

    @override
    _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
    Gender? selectedGender;
    int height = 180;
    int weight = 40;
    int age = 5;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Calculadora de IMC'),
            ),
            body: Column(
                children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Row(
                            children: <Widget>[
                                Expanded(
                                    child: ReusableCard(
                                        color: selectedGender == Gender.male
                                                ? kActiveCardColor
                                                : kInactiveCardColor,
                                        onPressed: () {
                                            setState(() {
                                                selectedGender = Gender.male;
                                            });
                                        },
                                        cardChild: const IconContent(
                                            label: 'MASCULINO',
                                            icon: FontAwesomeIcons.mars,
                                        ),
                                    ),
                                ),
                                Expanded(
                                    child: ReusableCard(
                                        color: selectedGender == Gender.female
                                                ? kActiveCardColor
                                                : kInactiveCardColor,
                                        onPressed: () {
                                            setState(() {
                                                selectedGender = Gender.female;
                                            });
                                        },
                                        cardChild: const IconContent(
                                            label: 'FEMININO',
                                            icon: FontAwesomeIcons.venus,
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ),
                    Expanded(
                        flex: 1,
                        child: ReusableCard(
                            color: kActiveCardColor,
                            cardChild: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                    const Text(
                                        'ALTURA',
                                        style: kLabelTextStyle,
                                    ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: <Widget>[
                                            Text(height.toString(), style: kNumberTextStyle),
                                            const Text(
                                                'cm',
                                                style: kLabelTextStyle,
                                            )
                                        ],
                                    ),
                                    SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                                inactiveTrackColor: const Color(0xff8d8e98),
                                                activeTrackColor: Colors.white,
                                                thumbColor: const Color(0xffeb1555),
                                                thumbShape: const RoundSliderThumbShape(
                                                        enabledThumbRadius: 15.0),
                                                overlayShape:
                                                        const RoundSliderOverlayShape(overlayRadius: 30.0),
                                                overlayColor: const Color(0x29eb1555)),
                                        child: Slider(
                                            value: height.toDouble(),
                                            min: 120.0,
                                            max: 220.0,
                                            onChanged: (double newValue) {
                                                setState(() {
                                                    height = newValue.round();
                                                });
                                            },
                                        ),
                                    )
                                ],
                            ),
                        ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Row(
                            children: <Widget>[
                                Expanded(
                                    child: ReusableCard(
                                        color: kActiveCardColor,
                                        cardChild: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                                const Text(
                                                    'PESO',
                                                    style: kLabelTextStyle,
                                                ),
                                                Text(
                                                    weight.toString(),
                                                    style: kNumberTextStyle,
                                                ),
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                        RoundIconButton(
                                                            icon: FontAwesomeIcons.minus,
                                                            onPressed: () {
                                                                setState(() {
                                                                    weight--;
                                                                });
                                                            },
                                                        ),
                                                        const SizedBox(
                                                            width: 10.0,
                                                        ),
                                                        RoundIconButton(
                                                            icon: FontAwesomeIcons.plus,
                                                            onPressed: () {
                                                                setState(() {
                                                                    weight++;
                                                                });
                                                            },
                                                        ),
                                                    ],
                                                ),
                                            ],
                                        ),
                                    ),
                                ),
                                Expanded(
                                    child: ReusableCard(
                                        color: kActiveCardColor,
                                        cardChild: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                                const Text(
                                                    'IDADE',
                                                    style: kLabelTextStyle,
                                                ),
                                                Text(
                                                    age.toString(),
                                                    style: kNumberTextStyle,
                                                ),
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                        RoundIconButton(
                                                            icon: FontAwesomeIcons.minus,
                                                            onPressed: () {
                                                                setState(() {
                                                                    age--;
                                                                });
                                                            },
                                                        ),
                                                        const SizedBox(
                                                            width: 10.0,
                                                        ),
                                                        RoundIconButton(
                                                            icon: FontAwesomeIcons.plus,
                                                            onPressed: () {
                                                                setState(() {
                                                                    age++;
                                                                });
                                                            },
                                                        ),
                                                    ],
                                                ),
                                            ],
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ),
                    BottomButton(
                        label: 'CALCULAR',
                        onTap: () {
                            CalculatorBrain calc = CalculatorBrain(
                                height: height,
                                weight: weight,
                            );

                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => ResultsPage(
                                        bmiResult: calc.calculateBMI(),
                                        resultText: calc.getResults(),
                                        interpretation: calc.getInterpretation(),
                                    ),
                                ),
                            );
                        },
                    )
                ],
            ),
        );
    }
}
