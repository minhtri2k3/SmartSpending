import 'package:flutter/material.dart';

class AppBar01 extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const AppBar01({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor : Colors.cyanAccent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Anchoi',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            'Tieudung',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
