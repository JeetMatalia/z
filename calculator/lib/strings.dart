String doesContainDecimal(dynamic result) {
  if (result.toString().contains('.')) {
    List<String> splitDecimal = result.toString().split('.');
    if (!(int.parse(splitDecimal[1]) > 0))
      return result = splitDecimal[0].toString();
  }
  return result;
}

String add(numOne, numTwo) {
  var result = (numOne + numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

String sub(numOne, numTwo) {
  var result = (numOne - numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

String mul(numOne, numTwo) {
  var result = (numOne * numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

String div(numOne, numTwo) {
  var result = (numOne / numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}
