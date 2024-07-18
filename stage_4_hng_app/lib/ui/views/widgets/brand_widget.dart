import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandWidget extends StatelessWidget {
  final String brandName;
  final String logoPath;

  const BrandWidget({
    Key? key,
    required this.brandName,
    required this.logoPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: const Color(0xFFF9F9F9),
            child: SvgPicture.asset(
              logoPath,
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(brandName, style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}
