

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:m_bloc_office/core/utils/extensions/base_extensions.dart';

import '../../core/utils/functions/base_funcations.dart';
import '../../core/utils/helpers/key.dart';
import '../../core/utils/helpers/validators.dart';
import '../../core/utils/widgets/custom_appbar.dart';
import '../../core/utils/widgets/custom_button.dart';
import '../../core/utils/widgets/custom_textformfield.dart';
import '../../core/values/base_colors.dart';
import '../../core/values/base_strings.dart';
import '../../data/enums/enums.dart';
import '../../data/model/new_office_modle.dart';
import '../../data/provider/db_provider.dart';
import '../../data/services/repository.dart';
import '../../routes/routes.dart';
import 'new_office_bloc.dart';

class NewOfficeScreen extends StatefulWidget {
  const NewOfficeScreen({super.key});

  @override
  State<NewOfficeScreen> createState() => _NewOfficeScreenState();
}

class _NewOfficeScreenState extends State<NewOfficeScreen> {
  List<String> colorList = [
    "0xffFFBE0B",
    "0xffFF9B71",
    "0xffFB5607",
    "0xff97512C",
    "0xffDBBADD",
    "0xffFF006E",
    "0xffA9F0D1",
    "0xff00B402",
    "0xff489DDA",
    "0xff0072E8",
    "0xff8338EC",
  ];
  String? selectedColor;
  final TextEditingController ofcNameController = TextEditingController();
  final TextEditingController ofcAddressController = TextEditingController();
  final TextEditingController ofcEmailAddressController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController ofCapacityController = TextEditingController();

  final FocusNode ofcName = FocusNode();
  final FocusNode ofcemail = FocusNode();
  final FocusNode ofcAddress = FocusNode();
  final FocusNode ofcmobilenumber = FocusNode();
  final FocusNode ofcCapacity = FocusNode();

  void disposeController() {
    ofcNameController.dispose();
    ofcNameController.dispose();
    ofcEmailAddressController.dispose();
    ofCapacityController.dispose();
  }

  AllKey allKey = AllKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewOfficeBloc(
          OfficeRepository(officeDatabase: OfficeDatabase.instance), []),
      child: Scaffold(
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
          body: BlocListener<NewOfficeBloc, NewOfficeState>(
            listener: (context, state) {
              if (state is OfficeLoading) {
                const CircularProgressIndicator();
              } else if (state is ColorSelected) {
                selectedColor = state.selectedColor;
              } else if (state is OfficeAdded) {
                showCustomSnackBar(
                    context: context,
                    message: BaseStrings.officeAddedSuccessfully,
                    type: SnackBarType.success);
                Navigator.pushNamed(context, BaseRoute.officeScreen);
              } else if (state is NewOfficeError) {
                showCustomSnackBar(
                    context: context,
                    message: 'Error: ${state.message}',
                    type: SnackBarType.error);
              }
            },
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: allKey.newOfficeFormKey,
              child: BlocBuilder<NewOfficeBloc, NewOfficeState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomTextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            focusNode: ofcName,
                            height: 48.h,
                            validator: (val) {
                              return validateOfficeName(val);
                            },
                            labelText: BaseStrings.officeName,
                            controller: ofcNameController,
                            onChanged: (val) {}),
                        15.toVSB,
                        CustomTextFormField(
                            focusNode: ofcAddress,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.streetAddress,
                            validator: (val) {
                              return validateOfficeAddress(val);
                            },
                            labelText: BaseStrings.physicalAddress,
                            controller: ofcAddressController,
                            onChanged: (val) {}),
                        15.toVSB,
                        CustomTextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            focusNode: ofcemail,
                            validator: (val) {
                              return validateEmail(val);
                            },
                            labelText: BaseStrings.EmailAdd,
                            controller: ofcEmailAddressController,
                            onChanged: (val) {}),
                        15.toVSB,
                        CustomTextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            focusNode: ofcmobilenumber,
                            validator: (val) {
                              return validatePhoneNumber(val);
                            },
                            labelText: BaseStrings.phoneNumber,
                            controller: phoneNumberController,
                            onChanged: (val) {}),
                        15.toVSB,
                        CustomTextFormField(
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            focusNode: ofcCapacity,
                            validator: (val) {
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
                          width: (24.w * 10) * 6 - 11,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Wrap(
                                alignment: WrapAlignment.center,
                                spacing: 11,
                                runSpacing: 15, // Vertical space between rows
                                children: List.generate(11, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      context
                                          .read<NewOfficeBloc>()
                                          .add(SelectColor(colorList[index].toString()));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color:
                                              selectedColor == colorList[index]
                                                  ? BaseColors.selectColorBorder
                                                  : Colors.transparent,
                                          width: 3.0,
                                        ),
                                      ),
                                      child: CircleAvatar(
                                          backgroundColor: Color(int.parse(colorList[index])),
                                          radius: 19.w,
                                          child: null),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                        20.toVSB,
                        CustomButton(
                            labelText: BaseStrings.addOffice.toUpperCase(),
                            onPressed: () {
                              if (allKey.newOfficeFormKey.currentState!
                                  .validate()) {
                                final office = OfficeModel(
                                  name: ofcNameController.text,
                                  address: ofcAddressController.text,
                                  email: ofcEmailAddressController.text,
                                  phoneNumber: phoneNumberController.text,
                                  capacity:
                                      int.parse(ofCapacityController.text),
                                  color: selectedColor
                                      .toString(), // Choose a color
                                );
                                context.read<NewOfficeBloc>().add(
                                    AddNewOfficeEvent(officeModel: office));
                              }
                            }),
                      ],
                    ).paddingSymmetric(horizontal: 19),
                  );
                },
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    disposeController();
    super.dispose();
  }
}
