import 'package:flutter/material.dart';

const double cardHeight = 242.0;

const TextStyle greeting = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

const TextStyle header = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const TextStyle remainingAmount = TextStyle(
  fontSize: 28,
);

const TextStyle subHeader = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const TextStyle regularText = TextStyle(
  fontSize: 15,
);

const EdgeInsetsGeometry topBottom = EdgeInsets.symmetric(
  vertical: 10.0,
);

const EdgeInsetsGeometry leftRight = EdgeInsets.symmetric(
  horizontal: 20.0,
);

SizedBox verticalSpacing(double height) {
  SizedBox sizedBox = SizedBox(
    height: height,
  );
  return sizedBox;
}
