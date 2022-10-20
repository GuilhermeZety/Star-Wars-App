import 'package:flutter/material.dart';

class DividerWithWidget extends StatefulWidget {
  const DividerWithWidget({Key? key, this.child}) : super(key: key);

  final Widget? child; 

  @override
  State<DividerWithWidget> createState() => _DividerWithWidgetState();
}

class _DividerWithWidgetState extends State<DividerWithWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.transparent,
                  Colors.grey,
                ]
              )
            ),
            height: 1,
          ),
        ),
        widget.child != null ? (const SizedBox(width: 5)) : const SizedBox(),        
        widget.child != null ?  widget.child! : const SizedBox(),
        widget.child != null ? (const SizedBox(width: 5)) : const SizedBox(),
        Expanded(
          child: Container(
              decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.transparent,
                  Colors.grey,
                ]
              )
            ),
            height: 1,
          ),
        ),
      ],
    );
  }
}