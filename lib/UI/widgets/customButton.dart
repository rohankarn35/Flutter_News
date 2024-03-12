import 'package:flutter/material.dart';

class CustomButton {
  Widget customButton(String buttonText, VoidCallback tapFunction) {
    return GestureDetector(
      onTap: tapFunction,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: Offset.zero,
                blurRadius: 12,
                spreadRadius: 0,
              )
            ]),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
