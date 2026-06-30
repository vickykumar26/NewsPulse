import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String tag;
  final String author;
  final String time;
  final VoidCallback ontap;

  const TrendingCard({super.key, required this.imageUrl, required this.title, required this.tag, required this.author, required this.time, required this.ontap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cardWidth = screenWidth * 0.61;
    final imageHeight = screenHeight * 0.16;

    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(right: screenWidth * 0.03),
        padding: EdgeInsets.all(screenWidth * 0.03),
        width: cardWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageUrl,
                height: imageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: imageHeight,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: Icon(Icons.broken_image),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    tag,
                    style: Theme.of(context).textTheme.labelSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    time,
                    style: Theme.of(context).textTheme.labelSmall,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.005),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              children: [
                CircleAvatar(
                  radius: screenWidth * 0.02,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: screenWidth * 0.02),
                Flexible(
                  child: Text(
                    author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: screenWidth * 0.035),  // ← responsive font
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}