import 'dart:async';

import 'package:flutter/material.dart';
import 'package:friday_application/MODEL/articole_data.dart';
import 'package:friday_application/UTILITIES/api_article.dart';
import 'package:friday_application/UTILITIES/theme.dart';
import 'package:friday_application/WIDGETS/articles_widget.dart';

class BottomSide extends StatefulWidget {
  const BottomSide({super.key});

  @override
  State<BottomSide> createState() => _BottomSideState();
}

class _BottomSideState extends State<BottomSide> {
  ApiService client = ApiService();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 300), (timer) {
      setState(() {
        client.getArticle();
        _scrollController.jumpTo(0);
        print("object");
      });
    });
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      animateToMaxMin(300, _scrollController);
    });
  }

  Future<void> animateToMaxMin(
      int seconds, ScrollController scrollController) async {
    if (scrollController.hasClients) {
      await scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        curve: Curves.linear,
        duration: Duration(seconds: seconds),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          FutureBuilder(
            future: client.getArticle(),
            builder:
                ((BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
              if (snapshot.hasData) {
                List<Article>? articles = snapshot.data;
                return ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: articles!.length,
                    itemBuilder: (context, index) =>
                        ArticleWidget(article: articles[index]));
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomPaint(
              painter: NewsBanner(),
              child: Container(
                height: 100,
                width: 150,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomPaint(
              painter: NewsBannerBorder(),
              child: Container(
                height: 100,
                width: 150,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 100,
              width: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.transparent,
                    Color.fromARGB(240, 0, 0, 0),
                    Color.fromARGB(240, 0, 0, 0),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
