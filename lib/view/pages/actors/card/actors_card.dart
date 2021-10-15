import 'package:flutter/material.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

class ActorsCard extends StatelessWidget {
  ActorsCard({this.name, this.imagePath, this.onTap});

  final String name;
  final String imagePath;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Container(
          height: 180,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).appBarTheme.color),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: PCacheImage(imagePath),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 25,
                child: Text(
                  name,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline1.color,
                    fontSize: 10.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
