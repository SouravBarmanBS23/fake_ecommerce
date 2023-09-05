





import 'package:dartz/dartz.dart';
import 'package:fake_ecommerce/src/features/home_product/home_body/domain/repositories/home_body_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/error_model.dart';
import '../../home_body/data/models/home_model.dart';

final homeBodyUseCasesProvider = Provider((ref){
  return HomeBodyUseCases(homeRepo: ref.watch(homeRepoProvider));
});

class HomeBodyUseCases{
  HomeBodyUseCases({
    required this.homeRepo,
  });
  final HomeRepo homeRepo;

  Future<Either<ErrorModel, List<HomeModel>>> homeBodyList() async {
    return await homeRepo.homeBodyData();
  }

}