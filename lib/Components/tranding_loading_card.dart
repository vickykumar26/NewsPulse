import 'package:flutter/material.dart';
import 'loading_container.dart';

class TrandingLoadingCard extends StatelessWidget {
  const TrandingLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final cardWidth = screenWidth * 0.61;
    final imageHeight = screenHeight * 0.16;

    return Container(
      margin: EdgeInsets.only(right: screenWidth * 0.03),
      padding: EdgeInsets.all(screenWidth * 0.03),
      width: cardWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoadingContainer(
            height: imageHeight,
            width: double.infinity,
          ),

          SizedBox(height: screenHeight * 0.01),

          Row(
            children: [
              Expanded(
                child: LoadingContainer(
                  height: 10,
                  width: double.infinity,
                ),
              ),
              SizedBox(width: screenWidth * 0.02),
              Expanded(
                child: LoadingContainer(
                  height: 10,
                  width: double.infinity,
                ),
              ),
            ],
          ),

          SizedBox(height: screenHeight * 0.01),

          LoadingContainer(
            height: 18,
            width: cardWidth * 0.8,
          ),

          SizedBox(height: screenHeight * 0.008),

          LoadingContainer(
            height: 18,
            width: cardWidth * 0.6,
          ),

          SizedBox(height: screenHeight * 0.015),

          Row(
            children: [
              CircleAvatar(
                radius: screenWidth * 0.02,
                child: LoadingContainer(
                  height: screenWidth * 0.04,
                  width: screenWidth * 0.04,
                ),
              ),

              SizedBox(width: screenWidth * 0.02),

              Expanded(
                child: LoadingContainer(
                  height: 10,
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}