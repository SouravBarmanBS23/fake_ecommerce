import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class HomeBodyShimmer extends StatefulWidget {
  const HomeBodyShimmer({super.key});

  @override
  State<HomeBodyShimmer> createState() => _HomeBodyShimmerState();
}

class _HomeBodyShimmerState extends State<HomeBodyShimmer> {
  @override
  Widget build(BuildContext context) {

    double cardWidth = MediaQuery.of(context).size.width / 3.3;
    double cardHeight = MediaQuery.of(context).size.height / 5.0;

    return Flexible(
      child: SizedBox(
        // color: Colors.blueAccent,
        width: double.infinity,
        child: GridView.builder(
          //physics: BouncingScrollPhysics(),
          shrinkWrap: false,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 8.0, // spacing between rows
            crossAxisSpacing: 8.0,
            childAspectRatio: cardWidth / cardHeight,
            // spacing between columns
          ),
          padding: const EdgeInsets.all(8.0), // padding around the grid
          itemCount: 4, // total number of items
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Colors.yellow,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
             //   height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.09),
                ),
              ),

            );
          },
        ),
      ),
    );
  }
}
