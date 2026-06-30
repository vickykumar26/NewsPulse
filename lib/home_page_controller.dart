import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Components/navigation_bar.dart';
import 'Controller/bottom_navigation_controller.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavController());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [

          /// Pages
          Positioned.fill(
            child: Obx(() => controller.pages[controller.index.value]),
          ),

          /// Floating Navigation Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: const CustomNavigationBar(),
          ),
        ],
      ),
    );
  }
}