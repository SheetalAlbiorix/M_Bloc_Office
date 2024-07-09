import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../values/base_colors.dart';
import '../../values/base_strings.dart';
import '../functions/base_funcations.dart';

class CustomButton extends StatelessWidget {

  final String? labelText;
  final TextAlign? textAlign;
final MainAxisAlignment? mainAxisAlignment;
  final VoidCallback? onPressed;
  final Color? disabledBackgroundColor;
  const CustomButton({super.key,  this.disabledBackgroundColor, required this.labelText,required  this.onPressed, this.mainAxisAlignment, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      iconAlignment: IconAlignment.end,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: disabledBackgroundColor ,
          fixedSize: Size(350.w, 60.w),
          padding: const EdgeInsets.only(left: 29, right: 9),
          backgroundColor: BaseColors.backgroundColor,
          elevation: 3),
      onPressed: onPressed,
      child: Row(
        children: [
          Expanded(
            child: Text(
              textAlign: textAlign,
              overflow: TextOverflow.ellipsis,
              labelText ??"",
              style: getTheme(context: context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(
                fontSize: 18.sp,
                color: BaseColors.whiteColor,
                fontFamily: BaseStrings.jost,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.zero,
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: SizedBox(
              height: 17.26.sp,
              width: 21.3.sp,
              child: const Icon(
                Icons.arrow_forward,
                color: BaseColors.backgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
