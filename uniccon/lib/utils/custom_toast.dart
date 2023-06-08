
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:uniccon/utils/custom_colors.dart';
import 'package:uniccon/views/reuseableWidgets/custom_text.dart';

customToast({required String message, required Color color}) {
  showSimpleNotification(CustomText(text: message, color: CustomColors.white,),
      background: color, duration: const Duration(seconds: 3));
}