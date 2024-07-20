import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final double? width;
  final void Function()? onTap;
  final double? height;
  final IconData? icon;
  final String buttonText;

  const ButtonWidget(
      {super.key,
      this.width,
      this.height,
      this.icon,
      required this.buttonText,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.maxFinite,
        height: height ?? 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xff0072C6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon),
            Text(
              buttonText,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
