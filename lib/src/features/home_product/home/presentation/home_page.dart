import 'package:fake_ecommerce/src/features/home_product/home_banner/presentation/pages/home_banner.dart';
import 'package:fake_ecommerce/src/features/home_product/home_body/presentation/pages/home_body.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            HomeBanner(),
           // HomeBody(),
          ],
        ),
      ),
    );
  }
}
