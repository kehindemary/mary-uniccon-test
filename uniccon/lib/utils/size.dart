import 'package:flutter/cupertino.dart';

size(BuildContext context) => MediaQuery.of(context).size;

mediaSize(BuildContext context) {
  double fontScale = 1;
  double deviceHeight = MediaQuery.of(context).size.height;
  if (deviceHeight > 740) {
    fontScale = 1.11;
  }
  if (deviceHeight < 740) {
    fontScale = 0.99;
  }
  if (deviceHeight < 670) {
    fontScale = 0.9;
  }
  if (deviceHeight < 615) {
    fontScale = 0.83;
  }
  return fontScale;
}
