import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaimon/gaimon.dart';
import '../../../../../core/constant/constant_values.dart';
import '../../data/models/home_model.dart';
import '../provider/home_body_provider.dart';
import '../widgets/home_body_shimmer.dart';

class HomeBody extends ConsumerStatefulWidget {
  const HomeBody({super.key});

  @override
  ConsumerState<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends ConsumerState<HomeBody> {
  final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 3.3;
    double cardHeight = MediaQuery.of(context).size.height / 5.0;

    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    final userData = ref.watch(bodyProductListProvider);


    return userData.when(
        data: (data){
          List<HomeModel> homeProductList  =  data.map((e) => e).toList();
          return  Flexible(
            child: Container(
              // color: Colors.blueAccent,
              width: double.infinity,
              child: Scrollbar(
                controller: _scrollController,
                thickness: 8,
                thumbVisibility: false,
                //trackVisibility : true,//According to your choice
                // thumbVisibility: true, //
                radius: const Radius.circular(5),
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // number of items in each row
                    mainAxisSpacing: 8.0, // spacing between rows
                    crossAxisSpacing: 8.0,
                    childAspectRatio: cardWidth / cardHeight,
                    // spacing between columns
                  ),
                  padding: const EdgeInsets.all(8.0), // padding around the grid
                  itemCount: 10, // total number of items
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(2),
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  color: Colors.white, // color of grid items
                                  // borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: homeProductList[index].image.toString(),
                                    placeholder: (context, url) =>
                                    const Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                color: const Color(0xfff1f2f4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 5,),
                                           AutoSizeText(
                                            homeProductList[index].title.toString(),
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 5,),
                                          RatingBar.builder(
                                            initialRating: homeProductList[index].rating.count.toDouble(),
                                            minRating: 1,
                                            itemSize : 15,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                            const EdgeInsets.symmetric(horizontal: 1.0),
                                            itemBuilder: (context, _) => const Icon(
                                              Icons.star,
                                              color: Colors.blue,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          const SizedBox(height: 5,),
                                           Text('\$ ${homeProductList[index].price.toString()}'),

                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Colors.blue,
                                      ),
                                      child:  const Icon(Icons.add,
                                          color: Colors.white, size: 25, weight: 5),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
        error: (error, s) => const Text('Error'),
        loading: ()=> const HomeBodyShimmer(),);
  }
}
