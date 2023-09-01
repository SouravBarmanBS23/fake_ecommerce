
import 'package:dio/dio.dart';
import 'package:network/network.dart';

import 'banner_data_source.dart';





class BannerDataSourceImpl implements BannerDataSource{

  BannerDataSourceImpl({
    required this.client
});

  final RestClient client;

  @override
  Future<Response> banner() async {

    final response = await client.get(
      APIType.public,
      'products/category/jewelery', // path
    );
    return response;
  }

}
