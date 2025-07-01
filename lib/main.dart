import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'core/router.dart';
import 'features/data/products/products_remote.dart';
import 'features/data/repository/product_repository.dart';
import 'features/presentation/bloc/product_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => ProductsRemote()),
        Provider(
          create: (context) => ProductRepository(client: context.read()),
        ),
        BlocProvider(create: (context) => ProductBloc(repo: context.read())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Elanora',
        routerConfig: router,
      ),
    );
  }
}
