import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

screen(String file) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [Lottie.asset(file, width: 300)],
  );
}