import 'package:flutter/material.dart';

class CustomButtonState extends StatefulWidget {
  final Function() onPressed;
  final String text;
  const CustomButtonState(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  State<CustomButtonState> createState() => _CustomButtonStateState();
}

class _CustomButtonStateState extends State<CustomButtonState> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 400,
      child: MaterialButton(
        onPressed: widget.onPressed,
        color: Colors.blue,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        child: Text(widget.text),
      ),
    );
  }
}
