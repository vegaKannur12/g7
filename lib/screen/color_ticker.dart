import 'package:flutter/material.dart';

class ColorTicker extends StatelessWidget {

  String image;
  final bool selected;
  Size? size;
  ColorTicker({required this.image, required this.selected, this.size});

  @override
  Widget build(BuildContext context) {
    print(selected);
    // return CircleAvatar(
    //   radius: 35,
    //   backgroundImage: NetworkImage(image),
    // );
    return Container(
      width: size!.width*0.2,
      height: size!.height*0.25,
      decoration: BoxDecoration(
        image:
            DecorationImage(fit: BoxFit.fill, image: NetworkImage(image)),
        shape: BoxShape.circle,
        border: selected
            ? Border.all(color: Colors.green, width: 3)
            : Border.all(color: Colors.grey),
      ),
    );
  }
}
