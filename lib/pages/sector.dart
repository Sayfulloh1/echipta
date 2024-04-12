import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class Sector {
  final String id; // Unique identifier for the sector
  final String svgPath; // SVG path data defining the sector's shape
  final Color color; // Color representing the sector
  final bool available; // Indicates if seats are available (optional)

  // Add other relevant properties for sectors, such as:
  // - Name (e.g., "A1", "VIP")
  // - Price range
  // - Capacity

  Sector({
    required this.id,
    required this.svgPath,
    required this.color,
    this.available = true, // Default to available
  });
}




class Clipper extends CustomClipper<Path> {
  Clipper({
    required this.svgPath,
  });

  String svgPath;

  @override
  Path getClip(Size size) {
    var path = parseSvgPathData(svgPath);
    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(1.1, 1.1);
    return path.transform(matrix4.storage).shift(const Offset(-220, 0));
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
