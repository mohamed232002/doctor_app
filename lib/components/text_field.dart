import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key,required this.iconData,required this.hintText,this.fun,this.endIcon}) : super(key: key);
 final IconData iconData;
 final String hintText;
 final IconData? endIcon;
 final void Function()? fun;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(7.0),
      child: TextFormField(
        decoration:  InputDecoration(
          border:const OutlineInputBorder(),
          hintText: hintText,
          prefixIcon:Icon(iconData),
            suffixIcon: IconButton(icon: Icon(endIcon),
              onPressed:fun,
            )

        ),
      ),
    );
  }
}
