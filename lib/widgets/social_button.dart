import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wastely/palletes/pallets.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final double horizontalPadding;
  const SocialButton({
    super.key,
    required this.iconPath,
    required this.label,
    required this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset(
        iconPath,
        width: 25,
        // ignore: deprecated_member_use
        color: Pallete.whiteColor,
      ),
      label: Text(label,
          style: const TextStyle(fontSize: 17, color: Pallete.whiteColor)),
      style: TextButton.styleFrom(
          padding:
              EdgeInsets.symmetric(vertical: 30, horizontal: horizontalPadding),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          side: BorderSide(color: Pallete.borderColor, width: 2)),
    );
  }
}
