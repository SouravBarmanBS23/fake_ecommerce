import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/constant/constant_values.dart';

class HomeBody extends ConsumerStatefulWidget {
  const HomeBody({super.key});

  @override
  ConsumerState<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends ConsumerState<HomeBody> {

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight =  MediaQuery.of(context).size.height;

    return Flexible(
      child: Container(
        color: Colors.blueAccent,
        width: double.infinity,
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 8.0, // spacing between rows
            crossAxisSpacing: 8.0,
            childAspectRatio: 20/19 ,
            // spacing between columns
          ),
          padding: const EdgeInsets.all(8.0), // padding around the grid
          itemCount: 10, // total number of items
          itemBuilder: (context, index) {
            return Container(
              color: Colors.greenAccent, // color of grid items
              child: Center(
                child: Text(
                  'text $index',
                  style: const TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
