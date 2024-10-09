import '../core/export.dart';

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final List<Color> gradientColors;

  const GradientIcon({
    super.key,
    required this.icon,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: gradientColors,
        ).createShader(bounds);
      },
      child: Icon(
        icon,
        color: Colors.black12, // This color will be overridden by the shader mask
      ),
    );
  }
}
