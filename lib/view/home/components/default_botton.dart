import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:flutter/material.dart';

class DefaultBotton extends StatelessWidget {
  DefaultBotton(
      {Key? key,
      required this.color,
      required this.title,
      required this.onTap,
      this.check,
      this.top,
      this.right})
      : super(key: key);
  double? top = 8;
  double? right = 8;
  String title;
  Color color;
  Function() onTap;
  bool? check = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onTap(),
        style: ButtonStyle(

            backgroundColor:
                MaterialStateProperty.all(const Color(0xff82225E))),
        child: Padding(
          padding: EdgeInsets.only(top: top!,right: right!,left: right!),
          child: Text(title, style: getSemiBoldStyleAR(color: color,fontSize:getProportionateScreenWidth(4))),
        ));
  }
}
