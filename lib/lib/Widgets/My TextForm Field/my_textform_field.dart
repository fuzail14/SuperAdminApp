import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyTextFormField extends StatefulWidget {
 final TextEditingController? controller;
 final String? hintText;
 final String? labelText;
 final Color?  labelTextColor;
 final Color? hintTextColor;
 final Color onFocusedBorderColor;
 final Color onEnabledBorderColor;
 final bool  obscureText;
 final String? Function(String?)? validator;
 final void   Function()? onTap;
  const MyTextFormField({super.key,
 this.onTap,
 this.controller,
 this.validator,
 required this.hintText,
 required  this.obscureText,
 this.labelTextColor,
 required  this.labelText,
 this.hintTextColor,
 required this.onFocusedBorderColor,
 required this.onEnabledBorderColor});


  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return    Padding(padding: const EdgeInsets.all(8),
        child: Container(width: MediaQuery.of(context).size.width*0.4,
          decoration: const BoxDecoration(
          ),
          child: TextFormField(


            onTap:widget.onTap ,

            validator: widget.validator,
            obscureText:widget.obscureText ,

            maxLines: 1,
            controller:widget. controller,
            decoration:     InputDecoration(

              labelStyle: TextStyle(color: widget.labelTextColor,),
              hintStyle: TextStyle(color:  widget.hintTextColor,),
              hintText: widget.hintText,
              labelText: widget.labelText,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                    color:  widget.onFocusedBorderColor,
                    width: 1
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: widget.onEnabledBorderColor,
                  width: 1,
                ),
              ),

            ),
          ),
        ));

  }
}
