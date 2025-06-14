import 'package:doorstep_company_app/components/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../theme/colors.dart'; // Ensure this exists
import 'app_text.dart'; // Ensure this exists

class FilterRatingBottomSheet extends StatelessWidget {
  final RatingFilterController controller = Get.put(RatingFilterController());

  FilterRatingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                Row(
                  children: [
                    const Icon(Icons.star),
                    SizedBox(width: 8.w),
                    appText('Filters', fontSize: 22.sp, fontWeight: FontWeight.bold),
                  ],
                ),
                SizedBox(height: 20.h),
                appText('Rating', fontSize: 17.sp),
                const SizedBox(height: 4),
                Container(height: 2, width: 45.w, color: AppColors.blackColor),
                SizedBox(height: 10.h),

                // ✅ Use Obx() to update UI automatically
                Obx(() => Column(
                      children: [
                        ratingCheckbox('5 Star', controller.isChecked, controller.updateCheckBox1),
                        ratingCheckbox('4 Star', controller.isChecked2, controller.updateCheckBox2),
                        ratingCheckbox('3 Star', controller.isChecked3, controller.updateCheckBox3),
                        ratingCheckbox('2 Star', controller.isChecked4, controller.updateCheckBox4),
                        ratingCheckbox('1 Star', controller.isChecked5, controller.updateCheckBox5),
                      ],
                    )),
                const Divider(),

                // ✅ Reset & Apply Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => controller.resetFilters(),
                      child: Container(
                        height: 45.h,
                        width: 180.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.grey300),
                        ),
                        child: Center(child: appText('Reset', color: AppColors.lowPurple, fontSize: 16.sp)),
                      ),
                    ),
                    roundButton(height: 45.h, width: 180.w, title: 'Apply')
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -50.h,
          right: 16.w,
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const CircleAvatar(
              backgroundColor: AppColors.whiteTheme,
              child: Icon(Icons.close),
            ),
          ),
        ),
      ],
    );
  }

  // ✅ Reusable Checkbox Widget
  Widget ratingCheckbox(String title, RxBool isChecked, Function(bool) onChanged) {
    return Row(
      children: [
        Checkbox(
          value: isChecked.value,
          onChanged: (value) => onChanged(value ?? false),
        ),
        Text(title, style: TextStyle(fontSize: 18.sp)),
      ],
    );
  }
}

// ✅ Bottom Sheet Function
void showFilterRatingBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
    isDismissible: true,
    builder: (context) => FilterRatingBottomSheet(),
  );
}

// ✅ GetX Controller for Ratings
class RatingFilterController extends GetxController {
  RxBool isChecked = false.obs;
  RxBool isChecked2 = false.obs;
  RxBool isChecked3 = false.obs;
  RxBool isChecked4 = false.obs;
  RxBool isChecked5 = false.obs;

  void updateCheckBox1(bool value) => isChecked.value = value;
  void updateCheckBox2(bool value) => isChecked2.value = value;
  void updateCheckBox3(bool value) => isChecked3.value = value;
  void updateCheckBox4(bool value) => isChecked4.value = value;
  void updateCheckBox5(bool value) => isChecked5.value = value;

  void resetFilters() {
    isChecked.value = false;
    isChecked2.value = false;
    isChecked3.value = false;
    isChecked4.value = false;
    isChecked5.value = false;
  }
}
