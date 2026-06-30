import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_pulse/Model/news_model.dart';

class NewsController extends GetxController {
  RxList<Articles> trendingNewsList = <Articles>[].obs;
  RxList<Articles> fiveTrendingNewsList = <Articles>[].obs;

  RxList<Articles> allNewsList = <Articles>[].obs;
  RxList<Articles> fiveNewsList = <Articles>[].obs;

  RxList<Articles> appleNewsList = <Articles>[].obs;
  RxList<Articles> fiveAppleNews = <Articles>[].obs;

  RxList<Articles> teslaNewsList = <Articles>[].obs;
  RxList<Articles> fiveTeslaNews = <Articles>[].obs;

  RxList<Articles> businessNewsList = <Articles>[].obs;
  RxList<Articles> fiveBusinessNews = <Articles>[].obs;

  FlutterTts flutterTts = FlutterTts();

  RxBool isTrendingLoading = false.obs;
  RxBool isAllNewsLoading = false.obs;
  RxBool isAppleNewsList = false.obs;
  RxBool isTeslaNewsList = false.obs;
  RxBool isBusinessNewsList = false.obs;
  RxBool isSpeaking = false.obs;

  @override
  void onInit() {
    super.onInit();

    print("1");
    getTrendingNews();

    print("2");
    getAllNews();

    print("3");
    getAppleNews();

    print("4");
    getTeslaNews();

    print("5");
    getBusinessNews();

    print("6");

    flutterTts.setCancelHandler(() {
      isSpeaking.value = false;
    });

    flutterTts.setCompletionHandler(() {
      isSpeaking.value = false;
    });

    flutterTts.setErrorHandler((msg) {
      isSpeaking.value = false;
    });
  }

  Future<void> getTrendingNews() async {
    print("getTrendingNews started");

    isTrendingLoading.value = true;
    try {
      var baseURL =
          "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=87194e30fdc647a9936cc2ad394e91ae";
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        NewsModel newsModel = NewsModel.fromJson(body);
        trendingNewsList.assignAll(newsModel.articles ?? []);
      }
      fiveTrendingNewsList.assignAll(
        trendingNewsList.take(5).toList(),
      );
    } catch (e) {
      print("Error: $e");
    } finally {
      isTrendingLoading.value = false;
    }
  }

  Future<void> getAllNews() async {
    print("getAllNews started");
    isAllNewsLoading.value = true;
    try {
      var baseURL =
          "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=87194e30fdc647a9936cc2ad394e91ae";
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        NewsModel newsModel = NewsModel.fromJson(body);
        allNewsList.assignAll(newsModel.articles ?? []);
      }
      fiveNewsList.assignAll(
        allNewsList.take(5).toList(),
      );
    } catch (e) {
      print("Error: $e");
    } finally {
      isAllNewsLoading.value = false;
    }
  }

  Future<void> getAppleNews() async {
    print("getAppleNews started");
    isAppleNewsList.value = true;
    try {
      var baseURL =
          "https://newsapi.org/v2/everything?q=apple&from=2026-06-29&to=2026-06-29&sortBy=popularity&apiKey=87194e30fdc647a9936cc2ad394e91ae";
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        NewsModel newsModel = NewsModel.fromJson(body);
        appleNewsList.assignAll(newsModel.articles ?? []);
      }
      fiveAppleNews.assignAll(
        appleNewsList.take(5).toList(),
      );
    } catch (e) {
      print("Error: $e");
    } finally {
      isAppleNewsList.value = false;
    }
  }

  Future<void> getTeslaNews() async {
    print("getTeslaNews started");
    isTeslaNewsList.value = true;
    try {
      var baseURL =
          "https://newsapi.org/v2/everything?q=tesla&from=2026-05-30&sortBy=publishedAt&apiKey=87194e30fdc647a9936cc2ad394e91ae";
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        NewsModel newsModel = NewsModel.fromJson(body);
        teslaNewsList.assignAll(newsModel.articles ?? []);
      }
      fiveTeslaNews.assignAll(
        teslaNewsList.take(5).toList(),
      );
    } catch (e) {
      print("Error: $e");
    } finally {
      isTeslaNewsList.value = false;
    }
  }

  Future<void> getBusinessNews() async {
    print("getBusinessNews started");
    isBusinessNewsList.value = true;
    try {
      var baseURL =
          "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=87194e30fdc647a9936cc2ad394e91ae";
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        NewsModel newsModel = NewsModel.fromJson(body);
        businessNewsList.assignAll(newsModel.articles ?? []);
      }
      fiveBusinessNews.assignAll(
        businessNewsList.take(5).toList(),
      );
    } catch (e) {
      print("Error: $e");
    } finally {
      isBusinessNewsList.value = false;
    }
  }

  Future<void> searchNews(String query) async {
    isAllNewsLoading.value = true;
    try {
      var baseURL =
          "https://newsapi.org/v2/everything?q=$query.com&apiKey=87194e30fdc647a9936cc2ad394e91ae";
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        NewsModel newsModel = NewsModel.fromJson(body);
        allNewsList.clear();
        allNewsList.assignAll(newsModel.articles ?? []);
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isAllNewsLoading.value = false;
    }
  }

  Future<void> speak(String text) async {
    if (isSpeaking.value) return;

    isSpeaking.value = true;

    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);

    await flutterTts.speak(text);
  }

  Future<void> stopSpeaking() async {
    await flutterTts.stop();
    isSpeaking.value = false;
  }

}