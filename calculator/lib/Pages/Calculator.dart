import 'package:flutter/material.dart';
import '../Components/Constance.dart';
import '../Components/Widgets/CustomTextField.dart';
import '../Components/Widgets/Keypad.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late TextEditingController _textEditingController;
  late String _currentValue = ''; // Current value entered by the user

  void _onNumberPressed(String number) {
    setState(() {
      _currentValue += number; // Append the pressed number to the current value
    });
  }

  void _onOperatorPressed(String operator) {
    // Append the operator to the current value if it's not empty
    if (_currentValue.isNotEmpty) {
      setState(() {
        _currentValue += operator;
      });
    }
  }

  void _onEqualPressed() {
    // Perform calculation if the current value is not empty
    if (_currentValue.isNotEmpty) {
      setState(() {
        // Parse and evaluate the expression
        try {
          ContextModel contextModel = ContextModel();
          Parser p = Parser();
          Expression exp = p.parse(_currentValue);
          double result = exp.evaluate(EvaluationType.REAL, contextModel);
          _currentValue = result.toString();
        } catch (e) {
          _currentValue = 'Error';
        }
      });
    }
  }

  void _onClearPressed() {
    setState(() {
      _currentValue = ''; // Clear the current value
    });
  }

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(); // Initialize _textEditingController here
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Title(),
                CustomTextField(currentValue: _currentValue,),

                Keypad(
                  onKeyPressed: _onNumberPressed,
                  onOperatorPressed: _onOperatorPressed,
                  onEqualPressed: _onEqualPressed,
                  onClearPressed: _onClearPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Title() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(
          'CALCULATOR',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
        ));
  }
}
