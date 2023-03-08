import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'cal_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                // flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        userInput,
                        style:
                            const TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(answer,
                          style: const TextStyle(
                              fontSize: 40, color: Colors.white))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CalculatorButton(
                            title: 'AC',
                            onPress: () {
                              setState(() {
                                userInput = ' ';
                                answer = '0';
                              });
                            }),
                        CalculatorButton(
                            title: '+/-',
                            onPress: () {
                              setState(() {
                                userInput += ' ';
                              });
                            }),
                        CalculatorButton(
                            title: '%',
                            onPress: () {
                              setState(() {
                                userInput += '%';
                              });
                            }),
                        CalculatorButton(
                            title: '/',
                            buttonColor: Colors.orange,
                            onPress: () {
                              setState(() {
                                userInput += '/';
                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        CalculatorButton(
                            title: '7',
                            onPress: () {
                              setState(() {
                                userInput += '7';
                              });
                            }),
                        CalculatorButton(
                            title: '8',
                            onPress: () {
                              setState(() {
                                userInput += '8';
                              });
                            }),
                        CalculatorButton(
                            title: '9',
                            onPress: () {
                              setState(() {
                                userInput += '9';
                              });
                            }),
                        CalculatorButton(
                            title: 'x',
                            buttonColor: Colors.orange,
                            onPress: () {
                              setState(() {
                                userInput += 'x';
                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        CalculatorButton(
                            title: '4',
                            onPress: () {
                              setState(() {
                                userInput += '4';
                              });
                            }),
                        CalculatorButton(
                            title: '5',
                            onPress: () {
                              setState(() {
                                userInput += '5';
                              });
                            }),
                        CalculatorButton(
                            title: '6',
                            onPress: () {
                              setState(() {
                                userInput += '6';
                              });
                            }),
                        CalculatorButton(
                            title: '-',
                            buttonColor: Colors.orange,
                            onPress: () {
                              setState(() {
                                userInput += '-';
                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        CalculatorButton(
                          title: '1',
                          onPress: () {
                            setState(() {
                              userInput += '1';
                            });
                          },
                        ),
                        CalculatorButton(
                            title: '2',
                            onPress: () {
                              setState(() {
                                userInput += '2';
                              });
                            }),
                        CalculatorButton(
                            title: '3',
                            onPress: () {
                              setState(() {
                                userInput += '3';
                              });
                            }),
                        CalculatorButton(
                            title: '+',
                            buttonColor: Colors.orange,
                            onPress: () {
                              setState(() {
                                userInput += '+';
                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        CalculatorButton(
                          title: '0',
                          onPress: () {
                            setState(() {
                              userInput += '0';
                            });
                          },
                        ),
                        CalculatorButton(
                            title: '.',
                            onPress: () {
                              setState(() {
                                userInput += '.';
                              });
                            }),
                        CalculatorButton(
                            title: 'DEL',
                            onPress: () {
                              setState(() {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                              });
                            }),
                        CalculatorButton(
                            title: '=',
                            buttonColor: Colors.orange,
                            onPress: () {
                              setState(() {
                                equalButtonPressed();
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void equalButtonPressed() {
    String finalInput = userInput;
    finalInput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalInput);
    ContextModel cm = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
