import 'dart:math';

class CalculatorBrain {

    CalculatorBrain({required this.height, required this.weight});

    final int height;
    final int weight;
    late double _bmi;

    String calculateBMI() {
        _bmi = (weight) / pow(height / 100, 2);
        return _bmi.toStringAsFixed(1);
    }

    String getResults() {
        if (_bmi >= 25) {
            return 'Acima do peso';
        } else if (_bmi > 18.5) {
            return 'Normal';
        } else {
            return 'Abaixo do peso';
        }
    }

    String getInterpretation() {
        if (_bmi >= 25) {
            return 'Você tem um peso mais alto do que normal. Tente se exercitar mais.';
        } else if (_bmi > 18.5) {
            return 'Você tem um peso normal. Bom trabalho.';
        } else {
            return 'Você tem um peso abaixo do normal. Tente comer mais.';
        }
    }
}