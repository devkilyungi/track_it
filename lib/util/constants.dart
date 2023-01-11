import 'package:flutter/material.dart';

const double cardHeight = 242.0 * 0.75;

const TextStyle greetingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const TextStyle headerStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const TextStyle subHeaderStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const TextStyle regularTextStyle = TextStyle(
  fontSize: 15,
);

const TextStyle remainingAmountStyle = TextStyle(
  fontSize: 40,
);

const EdgeInsetsGeometry topBottom = EdgeInsets.symmetric(
  vertical: 20.0,
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

const Color lightCreamColor = Color(0XFFFFF7D6);
const Color primaryColor = Color(0XFF994731);
const Color secondaryColor = Color(0XFFD3AB8F);
