import 'package:flutter/material.dart';

import '../../../Components/loading_container.dart';

class NewsTileLoading extends StatelessWidget {
  const NewsTileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          LoadingContainer(height: 120, width: 120),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: LoadingContainer(height: 20, width: 20),

                    ),
                    LoadingContainer(height: 10, width: MediaQuery.of(context).size.width/3),
                  ],
                ),
                SizedBox(height: 15,),
                LoadingContainer(height: 15, width: MediaQuery.of(context).size.width/1.8),
                SizedBox(height: 10,),
                LoadingContainer(height: 15, width: MediaQuery.of(context).size.width/2),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoadingContainer(height: 15, width: MediaQuery.of(context).size.width/4),
                    LoadingContainer(height: 15, width: MediaQuery.of(context).size.width/5),
                  ],
                ),
              ],
            ),
          )
        ],
      ),

    );
  }
}
