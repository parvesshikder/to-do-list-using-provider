import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final dynamic bgColor;
  final IconData iconData;
const CategoryIcon({ Key? key, required this.bgColor,  this.iconData = Icons.add }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(iconData, size: 30, color: Colors.white,),
      ),
    );
  }
}