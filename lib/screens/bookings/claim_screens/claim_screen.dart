import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme/colors.dart';
import '../../../components/custom_container.dart';
import '../../../components/app_text.dart';
import 'claim_detail_screen.dart';

class ClaimScreen extends StatefulWidget {
  const ClaimScreen({super.key});

  @override
  _ClaimScreenState createState() => _ClaimScreenState();
}

class _ClaimScreenState extends State<ClaimScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(8.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ClaimDetailScreen()));
                        },
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: const EdgeInsets.only(top: 8),
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: AppColors.grey300)),
                                child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        appText('Home cleaning', fontSize: 18.px, fontWeight: FontWeight.bold),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            appText('Claim ID # 56457573'),
                                            CustomContainer(
                                                height: 30.px,
                                                width: 100.px,
                                                borderColor: AppColors.lowPurple,
                                                borderRadius: 40.px,
                                                color: AppColors.lowPurple.withOpacity(0.1),
                                                child: Center(
                                                    child: appText('Status',
                                                        color: AppColors.lowPurple, fontWeight: FontWeight.bold)))
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            appText('Initiated On:', fontWeight: FontWeight.bold),
                                            appText('10 Oct, 2023 20:02',
                                                color: AppColors.hintGrey, fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            appText('Rs. 0.0',
                                                color: AppColors.darkGreen, fontWeight: FontWeight.bold, fontSize: 15),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => const ClaimDetailScreen()));
                                                },
                                                child: appText(
                                                  'View Details',
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.darkBlueShade,
                                                )),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            appText('Service date: ', fontWeight: FontWeight.bold),
                                            appText('12 Oct, 2023 02:15 PM',
                                                fontWeight: FontWeight.bold, color: AppColors.hintGrey),
                                          ],
                                        ),
                                      ],
                                    )));
                          },
                        ))),
              ],
            )));
  }
}
