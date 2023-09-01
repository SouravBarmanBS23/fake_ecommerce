
import 'dart:developer';

import 'package:fake_ecommerce/src/features/home_product/home_banner/data/models/banner_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home/domain/home_usecases.dart';

final bannerListProvider = FutureProvider<List<BannerModel>>((ref) async{
  final list = await ref.watch(bannerUseCaseProvider).bannerList();

  return list.fold((l) {
    log('user_list_provider',error: l);
    return [];
  }, (r){
    return r;
  });
});




