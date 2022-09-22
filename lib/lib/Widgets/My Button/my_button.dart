import 'package:flutter/material.dart';
class MyButton extends StatefulWidget {
  final double horizontalPadding ;
  final double verticalPadding ;
  final double? height;
  final double? width;
  final double? border;
  final String name;
  final Color color;
  final Color? textColor;
  final int maxLines;
  final void Function()? onPressed;

  const MyButton({super.key,required this.horizontalPadding,required this.verticalPadding,this.textColor, this.height,this.width, this.border,required this.name, required this.color, required this.maxLines, this.onPressed});


  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return   Padding(padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding, vertical: widget.verticalPadding),
      child: Container(
        width: widget.width,
        height:widget.height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              primary: widget.color
          ),
          child:  Text(widget.name,maxLines: widget.maxLines,style: TextStyle(color: widget.textColor),),
          onPressed: widget.onPressed,
        ),
      ),
    )
    ;
  }
}
