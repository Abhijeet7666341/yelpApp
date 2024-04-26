import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yelpapp/constant/color_constant.dart';

TextStyle appBarTitleTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: 18.sp,
    color: blackColor,
    fontWeight: FontWeight.w500,
  );
}

TextStyle tileHeadingTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: 15.sp,
    color: blackColor,
    fontWeight: FontWeight.w500,
  );
}

TextStyle tileSubTitleTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: 12.sp,
    color: greyColor.withOpacity(0.8),
    fontWeight: FontWeight.w500,
  );
}

TextStyle tilereviewCountTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: 12.sp,
    color: greyColor.withOpacity(0.8),
    fontWeight: FontWeight.w500,
  );
}

TextStyle tilePhoneTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: 14.sp,
    color: lightBlack,
    fontWeight: FontWeight.w500,
  );
}

TextStyle statusTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: 12.sp,
    color: whiteColor,
    fontWeight: FontWeight.w500,
  );
}

// DETAIL PAGE

TextStyle nameTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: 22.sp,
    color: blackColor,
    fontWeight: FontWeight.w700,
  );
}

TextStyle addressTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: 18.sp,
    color: greyColor.withOpacity(0.8),
    fontWeight: FontWeight.w500,
  );
}

TextStyle ratingTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: 12.sp,
    color: greyColor.withOpacity(0.8),
    fontWeight: FontWeight.w500,
  );
}

TextStyle detailHeadingTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: 12.sp,
    color: greyColor,
    fontWeight: FontWeight.w300,
  );
}

TextStyle detailValueTextStyle() {
  return GoogleFonts.montserrat(
    fontSize: 15.sp,
    color: lightBlack,
    fontWeight: FontWeight.w500,
  );
}