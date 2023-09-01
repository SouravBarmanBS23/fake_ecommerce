

import 'package:dio/dio.dart';
import 'package:fake_ecommerce/src/core/network/network.dart';
import 'package:fake_ecommerce/src/features/home_product/home_banner/data/data_sources/banner_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final bannerDataResourceProvider = Provider<BannerDataSource>((ref){
  return BannerDataSourceImpl(client: ref.watch(dioProvider));
});

abstract class BannerDataSource{
  Future<Response> banner();
}