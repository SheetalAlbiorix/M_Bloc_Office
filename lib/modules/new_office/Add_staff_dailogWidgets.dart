import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:m_bloc_office/core/utils/extensions/base_extensions.dart';
import 'package:m_bloc_office/core/values/base_colors.dart';
import '../../core/utils/functions/base_funcations.dart';
import '../../core/utils/helpers/key.dart';
import '../../core/utils/helpers/validators.dart';
import '../../core/utils/widgets/custom_button.dart';
import '../../core/utils/widgets/custom_textformfield.dart';
import '../../core/values/base_assets.dart';
import '../../core/values/base_strings.dart';
import '../../data/model/new_office_modle.dart';
import '../../data/model/staff_model.dart';
import 'new_office_bloc.dart';

class AddStaffDialogWidget extends StatefulWidget {
  final OfficeModel? officeModel;
  final StaffModel? staffModel;

  const AddStaffDialogWidget({super.key,  this.officeModel,this.staffModel});

  @override
  AddStaffDialogWidgetState createState() => AddStaffDialogWidgetState();
}

class AddStaffDialogWidgetState extends State<AddStaffDialogWidget> {
  int currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  final TextEditingController searchController = TextEditingController();
  final TextEditingController firstNameContr = TextEditingController();
  final TextEditingController lastNameContr = TextEditingController();
  AllKey allKey = AllKey();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  bool expanded = false;

  void nextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  String selectedAvatarPath = '';

  void isExpanded() {
    setState(() {
      expanded = !expanded;
    });
  }

  List<String> avatatList = [
    BaseAssets.avtarOne,
    BaseAssets.avtarTwo,
    BaseAssets.avtarThree,
    BaseAssets.avtarFour,
    BaseAssets.avtarFive,
    BaseAssets.avtarSix,
    BaseAssets.avtarSeven,
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: const Color(0xffF8FAFC),
      titlePadding: const EdgeInsets.symmetric(vertical: 10),
      title: ListTile(
        horizontalTitleGap: 1,
        contentPadding: const EdgeInsets.only(left: 8, right: 10),
        leading: Visibility(
          child: currentPage == 1
              ? IconButton(
                  onPressed: () {
                    pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOut);
                  },
                  icon: const Icon(Icons.arrow_back_sharp))
              : const SizedBox.shrink(),
        ),
        title: Text(
          textAlign: TextAlign.left,
          BaseStrings.newStaffMember,
          style: getTheme(context: context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w800, fontSize: 18.sp),
        ),
        trailing: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(BaseAssets.closeCircle)),
      ),
      content: BlocBuilder<NewOfficeBloc, NewOfficeState>(
        builder: (context, state) {
          if (state is avatarSelected) {
            selectedAvatarPath = state.avtar ?? "";
          }
          return Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: allKey.addStaffFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 137.h,
                  child: PageView(
                    controller: pageController,
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
                              validator: (val) {
                                return validateFirstName(val);
                              },
                              onChanged: (val) {}),
                          5.toVSB,
                          CustomTextFormField(
                            labelText: BaseStrings.lastName,
                            controller: lastNameContr,
                            onChanged: (val) {},
                            validator: (val) {
                              return validateLastName(val);
                            },
                          )
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
                            final avatarPath = avatatList[index];
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<NewOfficeBloc>(context).add(SelectAvatar(avatarPath));
                                // selectedAvatarPath = avatarPath;
                              },
                              child: CircleAvatar(
                                radius: 24.w,
                                backgroundColor: state is avatarSelected &&
                                        state.avtar == avatarPath
                                    ? Colors.blue.withOpacity(0.3)
                                    : Colors.transparent,
                                child: Container(
                            decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                            color: state is  avatarSelected && state.avtar == avatarPath
                            ? BaseColors.selectColorBorder
                                : Colors.transparent,
                            width: 4,
                            ),),
                                    child: SvgPicture.asset(avatarPath)),
                              ),
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
                        color: currentPage == index ? Colors.blue : Colors.grey,
                      ),
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
      actions: [
        currentPage == 0
            ? CustomButton(
                labelText: BaseStrings.next,
                onPressed: () {
                  if (allKey.addStaffFormKey.currentState!.validate()) {
                    nextPage();
                  }
                },
              )
            : CustomButton(
                labelText: BaseStrings.addstaffmember,
                onPressed: () {
                  if (allKey.addStaffFormKey.currentState!.validate() &&
                      selectedAvatarPath.isNotEmpty) {
                    final staff = StaffModel(
                      lastName: lastNameContr.text,
                      name: firstNameContr.text,
                      avtar: selectedAvatarPath,
                      officeId: int.parse((widget.officeModel?.id ?? "").toString()),
                    );
                    BlocProvider.of<NewOfficeBloc>(context).add(AddStaff(staff));
                    Navigator.pop(context);
                  }
                  ;
                })
      ],
    );
  }
}
