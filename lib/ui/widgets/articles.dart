import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Articles extends StatelessWidget {
  final String title;
  final String subtitle;
  final String linkImage;
  const Articles(
      {super.key,
      required this.title,
      required this.linkImage,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: 400,
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.grey[200]!,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(subtitle),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(linkImage))),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 8),
              Icon(Icons.remove_red_eye_outlined),
              SizedBox(width: 8),
              Text('10'),
              SizedBox(width: 20),
              Icon(Icons.comment_outlined),
              SizedBox(width: 8),
              Text('0'),
              Expanded(child: Container()),
              Icon(Icons.share),
              SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
    );
  }
}
