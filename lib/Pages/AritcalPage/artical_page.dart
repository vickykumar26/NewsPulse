import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../Controller/news_controller.dart';
import '../../Helper/format_time.dart';
import '../HomePage/Widgets/NewsTile.dart';
import '../HomePage/Widgets/news_tile_loading.dart';
import '../NewsDetails/news_detail_page.dart';
import 'Widgets/search_widgets.dart';

class ArticalPage extends StatelessWidget {
  ArticalPage({super.key});

  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchWidgets(),
              SizedBox(height: 20,),
              Expanded(
                child: ListView(
                  children: [
                    Obx(() {
                      if (newsController.isAllNewsLoading.value) {
                        return Column(
                          children: [
                            NewsTileLoading(),
                            NewsTileLoading(),
                            NewsTileLoading(),
                          ],
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: newsController.allNewsList.length,
                        itemBuilder: (context, index) {
                          final e = newsController.allNewsList[index];
                          return NewsTile(
                            imageUrl: e.urlToImage ?? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                            title: e.title ?? '',
                            time: formatTime(e.publishedAt),
                            author: e.author ?? 'Unknown',
                            ontap: () {
                              Get.bottomSheet(
                                NewsDetailPage(news: e),
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                              );
                            },
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
