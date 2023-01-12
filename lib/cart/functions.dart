import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Functions{
  Functions(param0);

  static Widget quantityController({
    required VoidCallback fct,
    required IconData icon,
    required Color addColor,
  }) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Material(
          color: addColor,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: fct,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}