import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';

class Sky extends StatelessWidget {
  const Sky({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularParticle(
        key: UniqueKey(),
        awayRadius: 80,
        numberOfParticles: 100,
        speedOfParticles: 0.2,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        maxParticleSize: 2,
        isRandSize: true,
        isRandomColor: true,
        randColorList: [
          Colors.blue.shade100,
        ],
        awayAnimationCurve: Curves.easeInOutBack,
      );
  }
}