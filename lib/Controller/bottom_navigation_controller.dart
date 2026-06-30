import 'package:get/get.dart';
import 'package:news_pulse/Pages/AritcalPage/artical_page.dart';
import 'package:news_pulse/Pages/HomePage/home_page.dart';
import 'package:news_pulse/Pages/ProfilePage/profile_page.dart';

class BottomNavController extends GetxController{
  RxInt index = 0.obs;

  var pages = [
    Homepage(),
    ArticalPage(),
    ProfilePage()
  ];
}