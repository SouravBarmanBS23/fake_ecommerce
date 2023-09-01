
import 'package:dartz/dartz.dart';
import 'package:fake_ecommerce/src/features/home_product/home_banner/data/data_sources/banner_data_source.dart';
import 'package:fake_ecommerce/src/features/home_product/home_banner/data/repositories/banner_repo_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/network/error_model.dart';
import '../../data/models/banner_model.dart';


final bannerRepoProvider = Provider<BannerRepo>((ref) {
  return BannerRepoImpl(bannerDataSource: ref.watch(bannerDataResourceProvider));
} );

abstract class BannerRepo {
  Future<Either<ErrorModel, List<BannerModel>>> banner();
}
