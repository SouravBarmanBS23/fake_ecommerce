
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

  // Future<Response> testData() async{
  //
  //   var map = <String, dynamic>{};
  //   map['username'] = 'sourav';
  //   map['password'] = '12345';
  //
  //   var headers = <String, String>{
  //     'Content-Type': 'application/json', // Specify the content type as JSON
  //     'Authorization': 'Bearer YOUR_ACCESS_TOKEN_HERE', // Replace with your actual Bearer token
  //   };
  //
  //   final res = await client.post(
  //       APIType.protected,
  //       'products/category/jewelery',
  //       headers
  //   );
  //
  //   return res;
  // }

}
