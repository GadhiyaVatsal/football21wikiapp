import 'package:flutter/material.dart';
import 'package:football21wikiapp/utils/app_colors.dart';
import 'package:football21wikiapp/utils/size_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class TextGenerator {
  Widget buildText({
    required String text,
    required BuildContext context,
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.titleText,
  }) {
    return Text(
      text,
      style: GoogleFonts.robotoCondensed(
        color: color,
        fontSize: fontSize == 20 ? displayWidth(context) * 0.06 : fontSize,
        fontWeight: fontWeight,
      ),
      softWrap: true,
      overflow: TextOverflow.clip,
    );
  }
}
