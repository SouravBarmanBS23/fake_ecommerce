import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fake_ecommerce/src/features/home_product/home_banner/data/models/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constant/constant_values.dart';
import '../provider/banner_provider.dart';
import '../widgets/shimmer_effect.dart';

class HomeBanner extends ConsumerStatefulWidget {
  const HomeBanner({super.key});

  @override
  ConsumerState<HomeBanner> createState() => _HomeBodyState();
}

class _HomeBodyState extends ConsumerState<HomeBanner> {


  int currentIndex = 0;
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight =  MediaQuery.of(context).size.height;
    final userData = ref.watch(bannerListProvider);

    return  userData.when(
        data: (data){
          List<BannerModel> articleList  =  data.map((e) => e).toList();

          return Column(
            children: [
              CarouselSlider(
                carouselController: controller,
                items: articleList.map((e) {

                  return GestureDetector(
                    onTap: () {
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // Background Image with rounded corners
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl: e.image, // Use the URL from your Article data
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const SmallShimmerEffect(),
                              errorWidget: (context, url, error) =>
                              const Center(child: Icon(Icons.error)),
                            ),
                          ),
                          // Slide Content
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        // Wrap this text widget with Expanded
                                        child: Text(
                                          e.title, // Use the title from your Article data
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          e.rating.rate.toString(), // Replace with actual time data
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Rest of your slide content
                                  // ...
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  viewportFraction: 0.8, // it takes the full width
                  height: 280,
                  // scrollPhysics: const FixedExtentScrollPhysics(),
                  // autoPlayAnimationDuration : const Duration(seconds: 2),
                  autoPlay: true,
                  autoPlayCurve: Curves.decelerate,
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (val, _) {
                    // No need to use setState here
                    setState(() {
                      currentIndex = val;
                    });
                    print("new index $val");
                    //   controller.jumpToPage(val);

                    controller.animateToPage(val,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.decelerate);
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DotsIndicator(
                dotsCount: articleList.length,
                position: currentIndex,
                decorator: DotsDecorator(
                  spacing: const EdgeInsets.all(2),
                  activeColor: const Color(0xff444698),
                  color: const Color(0xff999b9d),
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ],
          );
        },
        error:  (error, s) => const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline),
              ],
            ),
          ],
        ),
        loading: () => const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShimmerEffect(),
          ],
        ),
    );
  }
}
