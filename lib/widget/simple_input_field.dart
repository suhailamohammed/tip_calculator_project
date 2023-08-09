import 'package:flutter/material.dart';

class SimpleInputField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final IconData? iconData;
  const SimpleInputField({super.key, required this.controller, required this.title, required this.hintText, this.iconData});

  @override
  State<SimpleInputField> createState() => _SimpleInputFieldState();
}

class _SimpleInputFieldState extends State<SimpleInputField> {



  static const Color containerBox = Color(0xffF5F8FB);
  static const Color textBlock = Color(0xff232323);
  static const Color textLightBlock = Color(0xff717171);
  static const Color clearButtonColor = Color(0xffFF7511);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: textBlock),),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: textLightBlock),
              suffixIcon: widget.iconData != null ? Icon(widget.iconData, color: textBlock) : Text(''),
              filled: true,
              fillColor: containerBox,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(width: 0, color: Colors.transparent)
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(width: 0, color: Colors.transparent)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(width: 0, color: Colors.transparent)
              )
          ),

          onFieldSubmitted: (value){
            if(value.isEmpty)
            {
              widget.controller.text = "0.00";
            }
            widget.controller.text = value.toString();
            setState(() {});
          },

          onSaved: (value){
            widget.controller.text = value.toString();
            setState(() {});
          },

          validator: (value) {
            if(value == null || value.isEmpty) {
              return "Please enter a valid number";
            }
            return null;
          },
        ),
      ],
    );
  }
}
