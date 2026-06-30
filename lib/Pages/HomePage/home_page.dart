import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_pulse/Components/tranding_loading_card.dart';
import 'package:news_pulse/Controller/news_controller.dart';
import 'package:news_pulse/Pages/NewsDetails/news_detail_page.dart';
import '../../Components/navigation_bar.dart';
import '../../Helper/format_time.dart';
import 'Widgets/NewsTile.dart';
import 'Widgets/TrendingCard.dart';
import 'Widgets/news_tile_loading.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            //SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(Icons.dashboard),
                ),
                Text("NEWSPULSE", style: Theme.of(context).textTheme.headlineMedium),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(Icons.person),
                ),
              ],
            ),
            SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // ── Hottest News Section ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Hottest News", style: Theme.of(context).textTheme.bodyLarge),
                        Text("See All", style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                    SizedBox(height: 20),

                    LayoutBuilder(
                      builder: (context, constraints) {
                        final height = MediaQuery.of(context).size.height * 0.34;
                        return SizedBox(
                          height: height,
                          child: Obx(() {
                            if (newsController.isTrendingLoading.value) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    TrandingLoadingCard(),
                                    TrandingLoadingCard(),
                                  ],
                                ),
                              );
                            }
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: newsController.fiveTrendingNewsList.length,
                              itemBuilder: (context, index) {
                                final e = newsController.fiveTrendingNewsList[index];
                                return TrendingCard(
                                  imageUrl: e.urlToImage ?? '',
                                  title: e.title ?? '',
                                  tag: 'Most trending',
                                  author: e.author ?? 'Unknown',
                                  time: formatTime(e.publishedAt),
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
                        );
                      },
                    ),

                    SizedBox(height: 20),

                    // ── News For You Section ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("News for you", style: Theme.of(context).textTheme.bodyLarge),
                        Text("See All", style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                    SizedBox(height: 20),
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
                        itemCount: newsController.fiveNewsList.length,
                        itemBuilder: (context, index) {
                          final e = newsController.fiveNewsList[index];
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

                    SizedBox(height: 20),

                    // apple news section //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Apple News", style: Theme.of(context).textTheme.bodyLarge),
                        Text("See All", style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                    SizedBox(height: 20),
                    Obx(() {
                      if (newsController.isAppleNewsList.value) {
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
                        itemCount: newsController.fiveAppleNews.length,
                        itemBuilder: (context, index) {
                          final e = newsController.fiveAppleNews[index];
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

                    SizedBox(height: 20),

                    // tesla news section //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tesla News", style: Theme.of(context).textTheme.bodyLarge),
                        Text("See All", style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                    SizedBox(height: 20),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final height = MediaQuery.of(context).size.height * 0.34;
                        return SizedBox(
                          height: height,
                          child: Obx(() {
                            if (newsController.isTeslaNewsList.value) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    TrandingLoadingCard(),
                                    TrandingLoadingCard(),
                                  ],
                                ),
                              );
                            }
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: newsController.fiveTeslaNews.length,
                              itemBuilder: (context, index) {
                                final e = newsController.fiveTeslaNews[index];
                                return TrendingCard(
                                  imageUrl: e.urlToImage ?? '',
                                  title: e.title ?? '',
                                  tag: 'Most trending',
                                  author: e.author ?? 'Unknown',
                                  time: formatTime(e.publishedAt),
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
                        );
                      },
                    ),

                    SizedBox(height: 20),

                    //business news section//
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Business News", style: Theme.of(context).textTheme.bodyLarge),
                        Text("See All", style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                    SizedBox(height: 20),
                    Obx(() {
                      if (newsController.isBusinessNewsList.value) {
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
                        itemCount: newsController.fiveBusinessNews.length,
                        itemBuilder: (context, index) {
                          final e = newsController.fiveBusinessNews[index];
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

                    SizedBox(height: 20),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}