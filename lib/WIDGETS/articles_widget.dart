import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:friday_application/MODEL/articole_data.dart';
import 'package:friday_application/UTILITIES/theme.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      height: 80,
      width: 700,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: baseColor.withOpacity(0.2))),
      child: Stack(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 70,
                    width: 120,
                    child: article.urlToImage == null
                        ? Container(
                            color: Colors.amber,
                          )
                        : Image.network(
                            article.urlToImage!,
                            fit: BoxFit.fitHeight,
                          ),
                  ),
                  Container(
                    height: 70,
                    width: 120,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromARGB(100, 0, 0, 0),
                        Color.fromARGB(255, 0, 0, 0),
                      ],
                    )),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: 500,
                child: Text(
                  article.title!,
                  maxLines: 3,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: baseColor.withOpacity(0.5),
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.only(bottom: 5, right: 10),
              child: Text(
                article.source!.name!,
                maxLines: 3,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 12.0,
                  color: baseColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
