import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.title,
    this.buttonColor = Colors.grey,
    required this.onPress,
  });

  final String title;
  final Color buttonColor;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: InkWell(
          onTap: onPress,
          child: Container(
            width: 80,
            height: 80,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: buttonColor),
            child: Center(
                child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 30),
            )),
          ),
        ),
      ),
    );
  }
}
