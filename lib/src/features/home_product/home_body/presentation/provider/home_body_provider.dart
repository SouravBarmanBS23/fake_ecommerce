

import 'dart:developer';

import 'package:fake_ecommerce/src/features/home_product/home_body/data/models/home_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home/domain/home_body_usecases.dart';

final bodyProductListProvider = FutureProvider<List<HomeModel>>((ref) async {

  final productList = await ref.watch(homeBodyUseCasesProvider).homeBodyList();

  return productList.fold((l) {
    log('user_list_provider',error: l);
    return [];
  }, (r){
    return r;
  });

});