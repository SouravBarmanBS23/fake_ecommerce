import 'package:fake_ecommerce/src/features/home_product/home_banner/presentation/pages/home_banner.dart';
import 'package:fake_ecommerce/src/features/home_product/home_body/presentation/pages/home_body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeBanner(),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    'Trending Products',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'See all',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.blue
                    ),
                    textAlign: TextAlign.left,
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            HomeBody(),
          ],
        ),
      ),
    );
  }
}
