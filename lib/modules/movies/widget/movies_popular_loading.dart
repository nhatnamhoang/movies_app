import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MoviesPopularLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20),
      constraints: BoxConstraints(minWidth: 350, maxHeight: 150),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.only(right: 20,),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child:  Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                constraints: BoxConstraints(minWidth: 300, maxHeight: 150),
              ),
            ),
          );
        }
      ),
    );
  }
}
