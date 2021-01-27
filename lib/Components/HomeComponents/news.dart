import 'package:flutter/material.dart';

class News extends StatelessWidget {
  const News({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        'Assets/promo.png',
        height: screenSize.width * 0.5,
        width: screenSize.width,
        fit: BoxFit.cover,
      ),
    );
  }
}

// Container(
//       height: screenSize.width * 0.5,
//       width: screenSize.width,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.blueAccent,
//       ),
//       child: Image.network('https://googleflutter.com/sample_image.jpg'),
//     );
