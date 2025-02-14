import 'package:balanced_meal/theme/theme.dart';
import 'package:flutter/material.dart';

class SmallRoundedButton extends StatelessWidget {
  const SmallRoundedButton({
    super.key,
    required this.onTap,
    required this.iconData,
  });
  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: InkWell(
        onTap: onTap,
        child: Material(
          color: AppTheme.primaryColor,
          type: MaterialType.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
