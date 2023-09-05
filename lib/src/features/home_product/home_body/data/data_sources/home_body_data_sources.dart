



import 'package:dio/dio.dart';
import 'package:fake_ecommerce/src/core/network/network.dart';
import 'package:fake_ecommerce/src/features/home_product/home_body/data/data_sources/home_body_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final homeBodyDataSourceProvider = Provider<HomeBodyDataSource>((ref){
  return HomeBodyDataSourceImpl(client: ref.watch(dioProvider));
} );

abstract class HomeBodyDataSource{

  Future<Response> homeData();

}