import 'package:fake_ecommerce/src/features/home_product/home/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaimon/gaimon.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constant/constant_values.dart';
import '../../../../../core/router/routers.dart';
import '../../../registration/presentation/pages/registration_page.dart';
import '../../../registration/presentation/providers/registration_provider.dart';
import '../providers/login_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    screenWidth = MediaQuery.of(context).size.width;
    screenHeight =  MediaQuery.of(context).size.height;
    final loginState = ref.watch(loginCheckProvider);
    final loginCheck = ref.read(loginCheckProvider.notifier);

    return loginState == LoginState.loading ? const Scaffold(body: Center(child: CircularProgressIndicator(),),):
    loginState == LoginState.success ? const HomePage() : loginState == LoginState.initial ?
      GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome Back',
                        style: GoogleFonts.outfit(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Material(
                    elevation: 3,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 59,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xffF3F3F3),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.only(left: 22, top: 4),
                          hintText: "Username , Email & Phone Number",
                          hintStyle: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    elevation: 3,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 59,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xffF3F3F3),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.only(left: 22, top: 4),
                          hintText: "Password",
                          hintStyle: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password ?',
                        style: GoogleFonts.outfit(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      //   ref.read(goRouterNotifierProvider).isLoggedIn = true;
                      print(_emailController.text.toString());
                      print(_passwordController.text.toString());
                      loginCheck.login(_emailController.text.toString(), _passwordController.text.toString());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      // ref.read(goRouterNotifierProvider).isLoggedIn = true;
                      // GoRouter.of(context).go('/registration');
                      ref.watch(registrationProvider.notifier).state = RegistrationState.initial;
                      context.push('/registration');
                      HapticFeedback.mediumImpact();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffff7f56),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 2, child: Image.asset('images/login/left.png')),
                      // const SizedBox(width: 14,),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Or Sign up With',
                          style: GoogleFonts.outfit(
                              fontSize: 15,
                              fontWeight: FontWeight.w400),textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Image.asset('images/login/right.png')),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xffece9ec),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: const Color(0xffF89AEE),
                          ),
                        ),
                        // color: Colors.purple,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                color: const Color(0xffece9ec),
                                borderRadius: BorderRadius.circular(50),

                              ),
                              child: Image.asset(
                                'images/login/google.png',
                                width: 34, // Adjust the width to make the image smaller
                                height: 34, // Adjust the height to make the image smaller
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 25,),
                      Container(
                        height: 52,
                        width: 52,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xffece9ec),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: const Color(0xffF89AEE),
                          ),
                        ),
                        // color: Colors.purple,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                color: const Color(0xffece9ec),
                                borderRadius: BorderRadius.circular(50),

                              ),
                              child: Image.asset(
                                'images/login/Facbook.png',
                                width: 34, // Adjust the width to make the image smaller
                                height: 34, // Adjust the height to make the image smaller
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 25,),
                      Container(
                        height: 52,
                        width: 52,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xffece9ec),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: const Color(0xffF89AEE),
                          ),
                        ),
                        // color: Colors.purple,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                color: const Color(0xffece9ec),
                                borderRadius: BorderRadius.circular(50),

                              ),
                              child: Image.asset(
                                'images/login/apple.png',
                                width: 34, // Adjust the width to make the image smaller
                                height: 34, // Adjust the height to make the image smaller
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    ) : const Scaffold(body: Center(child: Text('error'),),);

  }
}


