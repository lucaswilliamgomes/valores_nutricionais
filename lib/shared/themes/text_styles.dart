import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valores_nutricionais/shared/themes/colors.dart';

class TextStyles {
  static final title = GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: AppColors.colorFont,
  );
  static final titleTile = GoogleFonts.roboto(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppColors.colorFont,
  );
  static final subtitleTile = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.colorFontHint,
  );
}
