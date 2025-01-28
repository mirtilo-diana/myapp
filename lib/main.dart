import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 231, 224, 128)),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Programa Layout'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String output = "0";
  String expression = "";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      expression = "";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      } else if (operand == "-") {
        _output = (num1 - num2).toString();
      } else if (operand == "*") {
        _output = (num1 * num2).toString();
      } else if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      expression = "$expression $num2 = $_output";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "÷") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
      expression = "$num1 $operand";
    } else {
      if (_output == "0") {
        _output = buttonText;
      } else {
        _output += buttonText;
      }
    }
    setState(() {
      output = double.parse(_output).toString();
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(buttonText, style: const TextStyle(fontSize: 20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(expression, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(output, style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
          Row(
            children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("÷")
            ],
          ),
          Row(
            children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("x")
            ],
          ),
          Row(
            children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("-")
            ],
          ),
          Row(
            children: [
              buildButton("limpar"),
              buildButton("0"),
              buildButton("="),
              buildButton("+")
            ],
          ),
        ],
      ),
    );
  }
}

