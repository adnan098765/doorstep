import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme/colors.dart';
import '../../../components/custom_container.dart';
import '../../../components/app_text.dart';

Widget rescheduleButton(
  BuildContext context, {
  required void Function()? onTap,
  Color? color,
  String? text,
  Color? borderColor,
  Color? textColor,
}) {
  return CustomContainer(
    onTap: onTap,
    height: 40.px,
    width: 150.px,
    color: color ?? AppColors.transparentColor,
    borderColor: borderColor ?? AppColors.grey300,
    borderRadius: 8.px,
    child: Center(
      child: appText(
        text ?? 'Cancel Booking',
        color: textColor ?? AppColors.blackColor,
        fontWeight: FontWeight.bold,
        // fontSize: 16,
      ),
    ),
  );
}
