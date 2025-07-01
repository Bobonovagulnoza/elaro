import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elaro/core/routes.dart';
import 'package:go_router/go_router.dart';
import '../features/data/repository/product_repository.dart';
import '../features/presentation/bloc/product_bloc.dart';
import '../features/presentation/bloc/product_event.dart';
import '../features/presentation/screens/product_detail.dart';

final router = GoRouter(
  initialLocation: Routes.product,
  routes: [
    GoRoute(
      path: Routes.product,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;

        final minPrice = extra?['minPrice'] as String? ?? '10000000';
        final maxPrice = extra?['maxPrice'] as String? ?? '20000000';
        final color = extra?['color'] as String? ?? '#050505';

        return BlocProvider(
          create: (context) => ProductBloc(
            repo: context.read<ProductRepository>(),
          )..add(ProductLoad(
            minPrice: minPrice,
            maxPrice: maxPrice,
            color: color,
          )),
          child: const ProductDetail(),
        );
      },
    ),


  ],
);
