import 'package:flutter/material.dart';

class ConfigOptionWidget extends StatelessWidget {
  const ConfigOptionWidget({super.key, required this.child, required this.onTap});

  final Widget child;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 7),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(blurRadius: 4, color: Colors.black54, offset: Offset(0, 0))
          ]
        ),
        child: child,
      ),
    );
  }
}