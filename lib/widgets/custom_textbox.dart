import 'package:flutter/material.dart';

class CustomTextBox extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obsecureText;
  final String? Function(String?)? validate;
  const CustomTextBox({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obsecureText,
    required this.validate,
  });

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  bool obsecureReference = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      obsecureReference = widget.obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obsecureReference,
      decoration: InputDecoration(
        hintText: widget.hintText,
        constraints: BoxConstraints(maxHeight: 48),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: widget.obsecureText
            ? InkWell(
                onTap: () {
                  setState(() {
                    obsecureReference = !obsecureReference;
                  });
                },
                child: Icon(Icons.remove_red_eye_outlined))
            : SizedBox(),
      ),
      validator: widget.validate,
    );
  }
}
