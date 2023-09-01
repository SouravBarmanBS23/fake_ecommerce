

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/error_model.dart';
import '../../home_banner/data/models/banner_model.dart';
import '../../home_banner/domain/repositories/banner_repo.dart';
import '../../home_banner/presentation/provider/banner_provider.dart';

final bannerUseCaseProvider = Provider<HomeUseCases>(
        (ref) => HomeUseCases(
          bannerRepo: ref.watch(bannerRepoProvider),
    ));

class HomeUseCases{

  HomeUseCases({
    required this.bannerRepo,
  });
  final BannerRepo bannerRepo;

  Future<Either<ErrorModel, List<BannerModel>>> bannerList() async {
    return await bannerRepo.banner();
  }

}