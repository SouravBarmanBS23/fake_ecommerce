import 'package:fake_ecommerce/src/core/router/router_config.dart';
import 'package:fake_ecommerce/src/features/authentication/core/data/models/registration_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

  void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
   Hive.registerAdapter(RegistrationDataModelAdapter());
  await Hive.openBox<RegistrationDataModelAdapter>('user_info');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {

    final router = ref.watch(goRouterProvider);


    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
    // theme: ThemeData.dark(),
     //routerConfig: ref.,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
