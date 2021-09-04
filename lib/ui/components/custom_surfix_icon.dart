import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/constants.dart';
import '/size_config.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    required this.svgIcon,
  });

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        10,
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: SvgPicture.asset(

        svgIcon,
        color: kPrimaryColor,
        height: getProportionateScreenWidth(18),
      ),
    );
  }
}
