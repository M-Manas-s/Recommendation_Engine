import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  final double iconSize;
  final double fontSize;

  const CustomIconButton({Key? key, required this.icon, required this.title, required this.onTap, this.iconSize = 10, this.fontSize= 15}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          Icon(icon, color: Colors.white,size: iconSize,),
          const SizedBox(height: 2.0,),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: fontSize
            )
          )
        ],
      ),
    );
  }
}
