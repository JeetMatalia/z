double add(double num1, double num2) {
  return num1 + num2;
}

double sub(double num1, double num2) {
  return num1 - num2;
}

double mul(double num1, double num2) {
  return num1 * num2;
}

double div(double num1, double num2) {
  if (num2 == 0) {
    return double.infinity; // Handle division by zero
  }
  return num1 / num2;
}

String doesContainDecimal(dynamic value) {
  if (value.toString().contains('.')) {
    return value.toString();
  } else {
    return value.toStringAsFixed(1); // Ensure one decimal point is shown
  }
}
