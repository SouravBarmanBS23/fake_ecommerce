
import 'package:dartz/dartz.dart';
import 'package:fake_ecommerce/src/features/home_product/home_body/data/data_sources/home_body_data_source_impl.dart';
import 'package:fake_ecommerce/src/features/home_product/home_body/data/models/home_model.dart';
import 'package:fake_ecommerce/src/features/home_product/home_body/data/repositories/home_body_repo_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/network/error_model.dart';
import '../../data/data_sources/home_body_data_sources.dart';


final homeRepoProvider = Provider<HomeRepo>((ref) {
  return HomeRepoImpl(homeBodyDataSource: ref.watch(homeBodyDataSourceProvider));
} );

abstract class HomeRepo {
  Future<Either<ErrorModel, List<HomeModel>>> homeBodyData();
}
