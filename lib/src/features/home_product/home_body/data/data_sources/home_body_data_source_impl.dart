



import 'package:dartz/dartz.dart';
import 'package:dio/src/response.dart';
import 'package:fake_ecommerce/src/core/network/error_model.dart';
import 'package:fake_ecommerce/src/features/home_product/home_body/data/models/home_model.dart';
import 'package:fake_ecommerce/src/features/home_product/home_body/domain/repositories/home_body_repo.dart';
import 'package:network/network.dart';

import 'home_body_data_sources.dart';

class HomeBodyDataSourceImpl extends HomeBodyDataSource{

  HomeBodyDataSourceImpl({
    required this.client
});

  final RestClient client ;

  @override
  Future<Response> homeData() {
    // TODO: implement homeData
    final response  = client.get(
        APIType.public,
        'products'
    );
    return response;
  }


}