import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MoviesFeatureLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      constraints: BoxConstraints(
          minWidth: 350, maxHeight: MediaQuery.of(context).size.height * 0.4),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
                width: MediaQuery.of(context).size.width * 0.32,
                margin: EdgeInsets.only(
                  right: 20,
                ),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        height: 186,
                        width: 140,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 100,
                        height: 18.0,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 70,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ));
          }),
    );
  }
}
