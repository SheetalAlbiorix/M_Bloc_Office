import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:m_bloc_office/core/utils/extensions/base_extensions.dart';
import 'package:m_bloc_office/core/utils/functions/base_funcations.dart';
import 'package:m_bloc_office/core/utils/helpers/key.dart';
import 'package:m_bloc_office/core/utils/widgets/custom_appbar.dart';
import 'package:m_bloc_office/core/utils/widgets/custom_button.dart';
import 'package:m_bloc_office/core/utils/widgets/custom_textformfield.dart';
import 'package:m_bloc_office/core/values/base_strings.dart';
import '../../core/utils/helpers/validators.dart';
import '../../core/values/base_colors.dart';

class NewOfficeScreen extends StatefulWidget {
  const NewOfficeScreen({super.key});

  @override
  State<NewOfficeScreen> createState() => _NewOfficeScreenState();
}

class _NewOfficeScreenState extends State<NewOfficeScreen> {
  List<Color> colorList = [
    const Color(0xffFFBE0B),
    const Color(0xffFF9B71),
    const Color(0xffFB5607),
    const Color(0xff97512C),
    const Color(0xffDBBADD),
    const Color(0xffFF006E),
    const Color(0xffA9F0D1),
    const Color(0xff00B402),
    const Color(0xff489DDA),
    const Color(0xff0072E8),
    const Color(0xff8338EC),
  ];

  final TextEditingController ofcNameController = TextEditingController();
  final TextEditingController ofcAddressController = TextEditingController();
  final TextEditingController ofcEmailAddressController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController ofCapacityController = TextEditingController();

  final FocusNode  ofcName= FocusNode();
  final FocusNode  ofcemail= FocusNode();
  final FocusNode  ofcAddress= FocusNode();
  final FocusNode  ofcmobilenumber= FocusNode();
  final FocusNode  ofcCapacity= FocusNode();
  void disposeController() {
    ofcNameController.dispose();
    ofcNameController.dispose();
    ofcEmailAddressController.dispose();
    ofCapacityController.dispose();
  }
AllKey allKey =AllKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.canvasColor,
        appBar: CustomAppBar(
customBackgroundColor: BaseColors.canvasColor,
          centerTitle: true,
          titleSpacing: 0,
          customTitle: Text(
            BaseStrings.newOffice,
            style: getTheme(context: context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontWeight: FontWeight.w500, fontSize: 18.sp),
          ),
          automaticallyImplyLeading: true,
        ),
        body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: allKey.newOfficeFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  focusNode: ofcName,
                  height: 48.h,
            validator: (val){
              return validateOfficeName(val);
            },
                    labelText: BaseStrings.officeName,
                    controller: ofcNameController,
                    onChanged: (val) {}),
                15.toVSB,
                CustomTextFormField(
                    focusNode: ofcAddress,

                    validator: (val){
                      return validateOfficeAddress(val);
                    },
                    labelText: BaseStrings.physicalAddress,
                    controller: ofcAddressController,
                    onChanged: (val) {}),
                15.toVSB,
                CustomTextFormField(
                  focusNode: ofcemail,
                  validator:(val){
                    return validateEmail(val);
                  },
                    labelText: BaseStrings.EmailAdd,
                    controller: ofcEmailAddressController,
                    onChanged: (val) {}),
                15.toVSB,
                CustomTextFormField(
                  focusNode: ofcmobilenumber,
                    validator:(val){
                      return validatePhoneNumber(val);
                    },
                    labelText: BaseStrings.phoneNumber,
                    controller: phoneNumberController,
                    onChanged: (val) {}),
                15.toVSB,
                CustomTextFormField(
                    focusNode: ofcCapacity,
                  validator: (val){
                    return validateOfficeCapacity(val);
                  },
                    labelText: BaseStrings.maximumCapacity,
                    controller: ofCapacityController,
                    onChanged: (val) {}),
                15.toVSB,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    BaseStrings.officeColour,
                    style: getTheme(context: context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                            color: BaseColors.blackColors,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600),
                  ),
                ),
                15.toVSB,
                SizedBox(

                  width: (24.w * 10) * 6 - 11,  // Width for 6 avatars + spacing
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Wrap(
                        alignment: WrapAlignment.center, // Align items to the start of the line
                        spacing: 18,  // Horizontal space between avatars
                        runSpacing: 15,  // Vertical space between rows
                        children: List.generate(11, (index) {
                          return CircleAvatar(
                            backgroundColor: colorList[index],
                            radius: 19.w,
                            child: null,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
            20.toVSB,
                CustomButton(labelText: BaseStrings.addOffice.toUpperCase(), onPressed: (){
                  if(allKey.newOfficeFormKey.currentState!.validate()){

                  }
                }),
              ],
            ).paddingSymmetric(horizontal: 19),
          ),
        ));
  }

  @override
  void dispose() {
    disposeController();
    super.dispose();
  }
}
