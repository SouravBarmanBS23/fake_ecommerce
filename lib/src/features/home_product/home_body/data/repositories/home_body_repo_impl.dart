

import 'package:dartz/dartz.dart';

import 'package:fake_ecommerce/src/core/network/error_model.dart';
import 'package:fake_ecommerce/src/core/network/request_handler.dart';
import 'package:fake_ecommerce/src/features/home_product/home_body/data/data_sources/home_body_data_sources.dart';

import 'package:fake_ecommerce/src/features/home_product/home_body/data/models/home_model.dart';

import '../../domain/repositories/home_body_repo.dart';

class HomeRepoImpl extends HomeRepo{

  HomeRepoImpl({
    required this.homeBodyDataSource
});

  HomeBodyDataSource homeBodyDataSource;

  @override
  Future<Either<ErrorModel, List<HomeModel>>> homeBodyData() async {
    // TODO: implement homeBodyData
    return await homeBodyDataSource.homeData().guard((data) {
      final homeModels = List<HomeModel>.from(
        (data as List).map((item) => HomeModel.fromJson(item)),
      );
      return homeModels;

    });
  }

}