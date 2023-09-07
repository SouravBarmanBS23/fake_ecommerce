import 'package:fake_ecommerce/src/core/router/routers.dart';
import 'package:fake_ecommerce/src/features/authentication/login/presentation/pages/login_page.dart';
import 'package:fake_ecommerce/src/features/authentication/registration/presentation/pages/registration_page.dart';
import 'package:fake_ecommerce/src/features/cart/presentation/pages/cart_page.dart';
import 'package:fake_ecommerce/src/features/home_product/home/presentation/home_page.dart';
import 'package:fake_ecommerce/src/features/home_product/home/presentation/main_page.dart';
import 'package:fake_ecommerce/src/features/settings/presentation/pages/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';


import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/category_product/presentation/pages/category_page.dart';
import 'go_router_provider.dart';


final GlobalKey<NavigatorState> _rootState = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellState = GlobalKey(debugLabel: 'shell');


final goRouterProvider = Provider<GoRouter>((ref){
  bool isDuplicate = false;
  // final notifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
      initialLocation: '/login',
      navigatorKey: _rootState,
      // refreshListenable: notifier,
      // redirect: (context, state) {
      //
      //   final isLoggedIn = notifier.isLoggedIn;
      //   final isGoingToLogin = state.matchedLocation == '/login';
      //
      //   if (!isLoggedIn && !isGoingToLogin && !isDuplicate) {
      //     isDuplicate = true;
      //     return '/login';
      //   }
      //   if (isGoingToLogin && isGoingToLogin && !isDuplicate)  {
      //     isDuplicate = true;
      //     return '/';
      //   }
      //   if(isDuplicate) {
      //     isDuplicate = false;
      //   }
      //   return null;
      //
      // },
      routes: [
        GoRoute(
            name: RoutersName.root,
            path: '/home',
            builder: (context,state) => HomePage(key: state.pageKey,)
        ),

        GoRoute(
          path: '/login',
          name: RoutersName.login,
          builder: (context, state) => LoginPage(key: state.pageKey),
        ),
        GoRoute(
          path: '/registration',
          name: RoutersName.registration,
          builder: (context, state) => RegistrationPage(key: state.pageKey),
        ),

        ShellRoute(
          navigatorKey: _shellState,
          builder: (context,state,child) => MainPage(key: state.pageKey,child: child),
          routes: [
            GoRoute(
                name: RoutersName.home,
                path: '/',
              pageBuilder: (context,state){
                  return NoTransitionPage(child: HomePage(key: state.pageKey,));
              }
            ),
            GoRoute(
                name: RoutersName.category,
                path: '/category',
                pageBuilder: (context,state){
                  return NoTransitionPage(child: CategoryPage(key: state.pageKey,));
                }
            ),
            GoRoute(
                name: RoutersName.cart,
                path: '/cart',
                pageBuilder: (context,state){
                  return NoTransitionPage(child: CartPage(key: state.pageKey,));
                }
            ),
            GoRoute(
                name: RoutersName.settings,
                path: '/setting',
                pageBuilder: (context,state){
                  return NoTransitionPage(child: SettingPage(key: state.pageKey,));
                }
            ),



          ]
        )


      ]

  );




});