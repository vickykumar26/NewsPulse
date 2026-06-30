import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/bottom_navigation_controller.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavController>();
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              width: 230,
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      controller.index.value = 0;
                    },
                    child: Obx(
                          () => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceOut,
                        width: 40,
                        height: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: controller.index.value == 0
                              ? Theme.of(context).colorScheme.primary
                              : null,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.home,
                          size: 25,
                          color: controller.index.value == 0
                              ? Theme.of(context).colorScheme.onBackground
                              : Theme.of(context).colorScheme.secondaryContainer,
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      controller.index.value = 1;
                    },
                    child: Obx(
                          () => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceOut,
                        width: 40,
                        height: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: controller.index.value == 1
                              ? Theme.of(context).colorScheme.primary
                              : null,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.book,
                          size: 25,
                          color: controller.index.value == 1
                              ? Theme.of(context).colorScheme.onBackground
                              : Theme.of(context).colorScheme.secondaryContainer,
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      controller.index.value = 2;
                    },
                    child: Obx(
                          () => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceOut,
                        width: 40,
                        height: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: controller.index.value == 2
                              ? Theme.of(context).colorScheme.primary
                              : null,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.settings,
                          size: 25,
                          color: controller.index.value == 2
                              ? Theme.of(context).colorScheme.onBackground
                              : Theme.of(context).colorScheme.secondaryContainer,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}