import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:m_bloc_office/core/utils/extensions/base_extensions.dart';
import 'package:m_bloc_office/core/utils/functions/base_funcations.dart';
import 'package:m_bloc_office/core/utils/widgets/custom_button.dart';
import 'package:m_bloc_office/core/utils/widgets/custom_textformfield.dart';
import 'package:m_bloc_office/core/values/base_strings.dart';
import '../core/utils/widgets/custom_appbar.dart';
import '../core/utils/widgets/detail_widgets.dart';
import '../core/values/base_assets.dart';
import '../core/values/base_colors.dart';
import '../data/model/staff_model.dart';
import '../routes/routes.dart';

class OfficeViewScreen extends StatefulWidget {
  const OfficeViewScreen({super.key});

  @override
  State<OfficeViewScreen> createState() => _OfficeViewScreenState();
}

class _OfficeViewScreenState extends State<OfficeViewScreen> {
  bool expanded = false;

  final TextEditingController searchController = TextEditingController();
  final TextEditingController firstNameContr = TextEditingController();
  final TextEditingController lastNameContr = TextEditingController();
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  void isExpanded() {
    setState(() {
      expanded = !expanded;
    });
  }

  void nextPage() {
    if (currentPage < 2) {

      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  List<StaffModel> staffList = [
    StaffModel(
        avtar: BaseAssets.avtarOne, name: "Jacques", lastName: "Jordaan"),
    StaffModel(
        avtar: BaseAssets.avtarTwo, name: "Daniel ", lastName: "Novitzkas"),
    StaffModel(
        avtar: BaseAssets.avtarThree, name: "Jacques", lastName: "Jordaan"),
    StaffModel(
        avtar: BaseAssets.avtarFour, name: "Jacques", lastName: "Jordaan"),
    StaffModel(
        avtar: BaseAssets.avtarFive, name: "Jacques", lastName: "Jordaan"),
    StaffModel(
        avtar: BaseAssets.avtarSix, name: "Jacques", lastName: "Jordaan"),
    StaffModel(
        avtar: BaseAssets.avtarSeven, name: "Jacques", lastName: "Jordaan"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24.0),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          backgroundColor: const Color(0xff0D4477),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return addStaffMemberDialog(context);
              },
            );
          },
          child: SvgPicture.asset(BaseAssets.addIcon),
        ),
      ),
      appBar: CustomAppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        customTitle: Text(
          BaseStrings.Office,
          style: getTheme(context: context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          AnimatedContainer(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            height: expanded ? 270.h : 132.h,
            duration: const Duration(milliseconds: 300),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 10,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 16, top: 17),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, BaseRoute.officeViewScreen);
                            },
                            child: Text(
                              "Specno",
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
                      InkWell(
                        onTap: () {
                          isExpanded();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "More info",
                              style: getTheme(context: context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: BaseColors.allOfficeTextColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                            ),
                            5.toHSB,
                            SvgPicture.asset(
                              expanded == false
                                  ? BaseAssets.downArrow
                                  : BaseAssets.upArrow,
                            ),
                          ],
                        ),
                      ),
                      if (expanded) ...[
                        Expanded(
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              12.toVSB,
                              customIconWithText(
                                  BaseAssets.callIcon, "082 364 9864", context),
                              12.toVSB,
                              customIconWithText(BaseAssets.mailIcon,
                                  "info@specno.com", context),
                              12.toVSB,
                              customIconWithText(BaseAssets.peopledIcon,
                                  "Office Capacity: 25 ", context),
                              12.toVSB,
                              customIconWithText(
                                  BaseAssets.locationIcon,
                                  "10 Willie Van Schoor Dr, Bo Oakdale, Cape Town, 7530",
                                  context),
                            ],
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ],
            ),
          ).paddingSymmetric(horizontal: 17, vertical: 10),
          24.toVSB,
          CustomTextFormField(
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: BaseColors.blackColors,
                      )),
                  labelText: BaseStrings.search,
                  controller: searchController,
                  onChanged: (val) {})
              .paddingSymmetric(horizontal: 16, vertical: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                BaseStrings.staffMemberInOffice,
                style: getTheme(context: context).textTheme.titleLarge,
              ),
              Text(
                "11",
                style: getTheme(context: context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 18.sp),
              )
            ],
          ).paddingOnly(left: 12, right: 24),
          13.toVSB,
          Expanded(
            child: ListView.builder(
              itemCount: staffList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  trailing: IconButton(
                      onPressed: () {

                        showDialog(context: context, builder: (context) => staffMemberMoreOptionDialog(context),);
                      },
                      icon: const Icon(
                        Icons.more_vert,
                        size: 24,
                      )),
                  leading: CircleAvatar(
                    child: SvgPicture.asset(staffList[index].avtar),
                  ),
                  title: Text(
                      "${staffList[index].name} ${staffList[index].lastName}"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
Widget addStaffMemberDialog(BuildContext context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      backgroundColor: const Color(0xffF8FAFC),
      titlePadding:
      const EdgeInsets.symmetric( vertical: 10),
      title: ListTile(
        horizontalTitleGap: 1,
contentPadding: const EdgeInsets.only(left: 8,right: 10),
         leading:  Visibility(child: currentPage == 1 ?  IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_sharp)):SizedBox.shrink()),
         title:  Text(
            textAlign: TextAlign.left,
            BaseStrings.newStaffMember,
            style: getTheme(context: context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w800,fontSize: 18.sp),
          ),
         trailing:  SvgPicture.asset(BaseAssets.closeCircle)

      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 100.h,
            child: PageView(
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFormField(
                        labelText: BaseStrings.firstName,
                        controller: firstNameContr,
                        onChanged: (val) {}),
                    CustomTextFormField(
                        labelText: BaseStrings.firstName,
                        controller: firstNameContr,
                        onChanged: (val) {})
                  ],
                ),
                SizedBox(
                  height: 52.h,
                  width: 52.w, // 5 avatars * (radius * 2 + spacing)
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10, // Space between avatars
                    runSpacing: 20, // Space between rows
                    children: List.generate(7, (index) {
                      return CircleAvatar(
                        radius: 24.w,
                        child: SvgPicture.asset(staffList[index].avtar),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          10.toVSB,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(2, (int index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 10,
                width: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentPage == index
                      ? Colors.blue
                      : Colors.grey,
                ),
              );
            }),
          ),
        ],
      ),
      actions: [
      currentPage == 0 ?  CustomButton(
          labelText: BaseStrings.next,
          onPressed: () {
            nextPage;
          },
        ) : CustomButton(
        labelText: BaseStrings.addstaffmember,
        onPressed: () {

        },
      )
      ],
    );
}

Widget staffMemberMoreOptionDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      backgroundColor: const Color(0xffF8FAFC),
      titlePadding:
      const EdgeInsets.symmetric( vertical: 10),
      title:null,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
            labelText: BaseStrings.editStaff.toUpperCase(),
            onPressed: () {
              Navigator.of(context).pop();
              showDialog(context: context, builder: (context) => editStaffMemberDialog(context));

            },
          ),
          10.toVSB,
           TextButton(onPressed:(){
             showDialog(context: context,builder: (context) =>     deleteStaffMemberMoreOptionDialog(context),);


           }, child: Text(BaseStrings.deleteStaff.toUpperCase(),style:getTheme(context: context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500,color: BaseColors.btnColor),) ,)
        ],
      ),

    );
}
Widget deleteStaffMemberMoreOptionDialog(BuildContext context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      backgroundColor: const Color(0xffF8FAFC),
      titlePadding:
      const EdgeInsets.symmetric( vertical: 10),
      title:Row(
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_sharp)),
          SizedBox(
            width: 220.w,
            child: Text(
              maxLines: 2,
              textAlign: TextAlign.left,
              BaseStrings.deleteStaffTxt,
              style: getTheme(context: context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w700,fontSize: 20.sp,fontFamily: BaseStrings.interRegular,),
            ),
          ),
        ],),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
BackgroundColor: BaseColors.dltBtnColor,
            labelText: BaseStrings.deleteOffice.toUpperCase(),
            onPressed: () {

            },
          ),
          10.toVSB,
           TextButton(onPressed:null, child: Text(BaseStrings.keepOffice.toUpperCase(),style:getTheme(context: context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500,color: BaseColors.btnColor),) ,)
        ],
      ),

    );
}


  Widget editStaffMemberDialog(BuildContext context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      backgroundColor: const Color(0xffF8FAFC),
      titlePadding:
      const EdgeInsets.symmetric( vertical: 10),
      title: ListTile(
          horizontalTitleGap: 1,
          contentPadding: const EdgeInsets.only(left: 8,right: 10),
          leading:  Visibility(child: currentPage == 1 ?  IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_sharp)):SizedBox.shrink()),
          title:  Text(
            textAlign: TextAlign.left,
            BaseStrings.editStaffMember,
            style: getTheme(context: context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w800,fontSize: 18.sp),
          ),
          trailing:  SvgPicture.asset(BaseAssets.closeCircle)

      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 100.h,
            child: PageView(
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFormField(
                        labelText: BaseStrings.firstName,
                        controller: firstNameContr,
                        onChanged: (val) {}),
                    CustomTextFormField(
                        labelText: BaseStrings.firstName,
                        controller: firstNameContr,
                        onChanged: (val) {})
                  ],
                ),
                SizedBox(
                  height: 52.h,
                  width: 52.w, // 5 avatars * (radius * 2 + spacing)
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10, // Space between avatars
                    runSpacing: 20, // Space between rows
                    children: List.generate(7, (index) {
                      return CircleAvatar(
                        radius: 24.w,
                        child: SvgPicture.asset(staffList[index].avtar),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          10.toVSB,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(2, (int index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 10,
                width: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentPage == index
                      ? Colors.blue
                      : Colors.grey,
                ),
              );
            }),
          ),
        ],
      ),
      actions: [
        currentPage == 0 ?  CustomButton(
          labelText: BaseStrings.next,
          onPressed: () {
            nextPage;
          },
        ) : CustomButton(
          labelText: BaseStrings.addstaffmember,
          onPressed: () {

          },
        )
      ],
    );
  }


  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
