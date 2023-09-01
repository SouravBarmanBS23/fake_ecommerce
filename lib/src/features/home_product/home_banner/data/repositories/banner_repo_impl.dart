


import 'package:dartz/dartz.dart';

import 'package:fake_ecommerce/src/core/network/error_model.dart';
import 'package:fake_ecommerce/src/core/network/request_handler.dart';

import '../../domain/repositories/banner_repo.dart';
import '../data_sources/banner_data_source.dart';
import '../models/banner_model.dart';



class BannerRepoImpl implements BannerRepo{

  BannerRepoImpl({
    required this.bannerDataSource
});

  BannerDataSource bannerDataSource;

  @override
  Future<Either<ErrorModel, List<BannerModel>>> banner() async{
    return await bannerDataSource.banner().guard((data) {
      final bannerModels = List<BannerModel>.from(
        (data as List).map((item) => BannerModel.fromJson(item)),
      );
      return bannerModels;

    });
  }
}