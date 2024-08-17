import 'package:flutter/cupertino.dart';

class GradientBackground extends StatelessWidget {
  final List<Color> colors;
  final List<Widget> children;
  const GradientBackground(
      {super.key, required this.colors, required this.children});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: LinearGradient(colors: colors)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
               height: 20,
            ),
            ...children,
          ],
        ),
      ),
    );

  }
}
