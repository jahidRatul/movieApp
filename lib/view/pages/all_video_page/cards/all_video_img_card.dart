import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

class AllVideoImgCard extends StatelessWidget {
  final String imgPath;
  final Function onTap;

  AllVideoImgCard({
    this.imgPath,
    this.onTap,
  });

  // Future<Uint8List> getImage() async {
  //   final ByteData bytes =
  //       await rootBundle.load(imgPath ?? "assets/images/genre/72563.jpg");
  //   final Uint8List list = bytes.buffer.asUint8List();
  //   return list;
  // }

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;

    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          // width: wp(29),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                image: PCacheImage(imgPath ?? ""),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
