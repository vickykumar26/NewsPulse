import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_pulse/Controller/news_controller.dart';
import 'package:news_pulse/Model/news_model.dart';
import '../../Helper/format_time.dart';

class NewsDetailPage extends StatelessWidget {
  final Articles news;
  const NewsDetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.find<NewsController>();
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        DraggableScrollableSheet(
          initialChildSize: 0.65,
          minChildSize: 0.4,
          maxChildSize: 0.85,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // drag handle
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 220,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  news.urlToImage ??
                                      'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                                  width: double.infinity,
                                  height: 250,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.network(
                                      'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                                      width: double.infinity,
                                      height: 250,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              news.title ?? 'Untitled',
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  formatTime(news.publishedAt),
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.red,
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    news.author ?? 'Unknown',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Row(
                                children: [
                                  Obx(() {
                                    return IconButton(
                                      icon: Icon(
                                        newsController.isSpeaking.value
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        size: 50,
                                      ),
                                      onPressed: () async {
                                        if (newsController.isSpeaking.value) {
                                          await newsController.stopSpeaking();
                                        } else {
                                          await newsController.speak(
                                            news.content ??
                                                news.description ??
                                                "No description available.",
                                          );
                                        }
                                      },
                                    );
                                  }),
                                  Expanded(
                                      child: Obx(() {
                                        return Lottie.asset(
                                          "Assets/Animation/wave.json",
                                          height: 70,
                                          repeat: true,
                                          animate: newsController.isSpeaking.value,
                                        );
                                      }),
                                  )
                                ],
                              ),
                            ),
                            
                            const SizedBox(height: 20),
                            Text(
                              news.description ?? news.content ?? 'No description available.',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),

        // Floating close button OUTSIDE/ABOVE the sheet
        Positioned(
          top: -60,
          child: InkWell(
            onTap: () async{
              Get.back();
              await newsController.stopSpeaking();
            },
            borderRadius: BorderRadius.circular(100),
            child: Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(Icons.close, size: 25, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}