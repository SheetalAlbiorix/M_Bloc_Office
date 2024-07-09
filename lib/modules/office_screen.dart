import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_bloc_office/core/utils/functions/base_funcations.dart';
import 'package:m_bloc_office/core/values/base_assets.dart';
import 'package:m_bloc_office/core/values/base_colors.dart';
import 'package:m_bloc_office/core/values/base_strings.dart';

class OfficeScreen extends StatefulWidget {
  const OfficeScreen({super.key});

  @override
  State<OfficeScreen> createState() => _OfficeScreenState();
}

class _OfficeScreenState extends State<OfficeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        backgroundColor: BaseColors.canvasColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(24.0),
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            backgroundColor: const Color(0xff0D4477),
            onPressed: () {
              setState(() {});
            },
            child: SvgPicture.asset(BaseAssets.addIcon),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                BaseStrings.allOffices,
                style: getTheme(context: context).textTheme.headlineMedium,
              ),
            ),
            AnimatedContainer(
              height: 320.h,
              duration: const Duration(milliseconds: 1),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Specno",
                        style: getTheme(context: context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                color: BaseColors.allOfficeTextColor,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w800),
                      ),
                      InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(BaseAssets.editIcon)),
                    ],
                  )
                ],
              ),
            ).paddingSymmetric(horizontal: 17),
          ],
        ),
      ),
    );
  }
}
