import 'package:bloc/bloc.dart';
import 'package:elaro/features/presentation/bloc/product_event.dart';
import 'package:elaro/features/presentation/bloc/product_state.dart';
import '../../data/repository/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repo;

  ProductBloc({required ProductRepository repo})
    : _repo = repo,
      super(ProductState.initial()) {
    on<ProductLoad>(_loadFilter);
  }

  Future<void> _loadFilter(
    ProductLoad event,
    Emitter<ProductState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ProductStatus.loading));
      final product = await _repo.fetchFilterProduct(
        event.minPrice,
        event.maxPrice,
        event.color,
      );
      emit(state.copyWith(status: ProductStatus.idle, product: product));
    } catch (e) {
      print("Xato: $e");
      return emit(state.copyWith(status: ProductStatus.error));
    }
  }
}
