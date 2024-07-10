import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_bloc_office/core/utils/extensions/base_extensions.dart';
import 'package:m_bloc_office/core/utils/functions/base_funcations.dart';
import 'package:m_bloc_office/core/values/base_assets.dart';
import 'package:m_bloc_office/core/values/base_colors.dart';
import 'package:m_bloc_office/core/values/base_strings.dart';
import 'package:m_bloc_office/routes/routes.dart';

import '../core/utils/widgets/detail_widgets.dart';

class OfficeScreen extends StatefulWidget {
  const OfficeScreen({super.key});

  @override
  State<OfficeScreen> createState() => _OfficeScreenState();
}

class _OfficeScreenState extends State<OfficeScreen> {
  @override
  void initState() {
   expanded = List<bool>.filled(6,false);
    super.initState();
  }
 List<bool>? expanded ;

  void isExpanded(int index) {
    setState(() {
      expanded?[index] = !(expanded?[index] ?? false);
    });
  }
  final List<LinearGradient> gradients = [
    LinearGradient(
      colors: [Colors.blue.withOpacity(0.2), Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    LinearGradient(
      colors: [Colors.green.withOpacity(0.2), Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    LinearGradient(
      colors: [Colors.red.withOpacity(0.2), Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    // Add more gradients as needed
  ];
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
           Navigator.pushNamed(context, BaseRoute.newOfficeScreen);
            },
            child: SvgPicture.asset(BaseAssets.addIcon),
          ),
        ),
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0.0,
          backgroundColor: BaseColors.canvasColor,
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
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    height: expanded![index] ? 270.h : 132.h,
                    duration: const Duration(milliseconds: 300),
                    child: Stack(children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          width: 10,  // Adjust width as needed
                          decoration:  BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                            gradient: gradients[index % gradients.length],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 22, right: 16, top: 17),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushNamed(context, BaseRoute.officeViewScreen);
                                  },
                                  child: Text(
                                    index == 0 ? "Specno"  : "Company Name here",
                                    style: getTheme(context: context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                        color: BaseColors.allOfficeTextColor,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(BaseAssets.editIcon)),
                              ],
                            ),
                            11.toVSB,
                            Row(
                              children: <Widget>[
                                SvgPicture.asset(BaseAssets.peopleOverView),
                                12.toHSB,
                                Text.rich(TextSpan(
                                    text: '5 ',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text: 'Staff Members in Office',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: BaseColors.allOfficeTextColor,
                                            fontFamily: BaseStrings.interRegular),
                                      )
                                    ])),
                              ],
                            ),
                            9.toVSB,
                            Divider(
                              indent: 5,
                              endIndent: 10,
                              height: 0.4.h,
                              color: const Color(0xff0D4477),
                            ),
                            11.toVSB,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    isExpanded(index);
                                  },
                                  child: Text(
                                    "More info",
                                    style: getTheme(context: context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                        color: BaseColors.allOfficeTextColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                5.toHSB,
                                SvgPicture.asset(
                                  expanded![index] == false
                                      ? BaseAssets.downArrow
                                      : BaseAssets.upArrow,
                                ),
                              ],
                            ),
                            if (expanded![index]) ...[
                              Expanded(
                                child: ListView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    12.toVSB,
                                    customIconWithText(
                                        BaseAssets.callIcon, "082 364 9864",context),
                                    12.toVSB,
                                    customIconWithText(
                                        BaseAssets.mailIcon, "info@specno.com",context),
                                    12.toVSB,
                                    customIconWithText(BaseAssets.peopledIcon,
                                        "Office Capacity: 25 ",context),
                                    12.toVSB,
                                    customIconWithText(BaseAssets.locationIcon,
                                        "10 Willie Van Schoor Dr, Bo Oakdale, Cape Town, 7530",context),
                                  ],
                                ),
                              )
                            ]
                          ],
                        ),
                      ),
                    ],),

                  ).paddingSymmetric(horizontal: 17,vertical: 10);
                },
              ),
            )
          ],
        ),
      ),
    );
  }


}
