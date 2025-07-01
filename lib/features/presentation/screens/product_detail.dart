import 'package:bloc_provider/bloc_provider.dart' hide BlocBuilder;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';
import '../widgets/app_loading.dart';
import '../widgets/filter_sheet.dart';
import '../widgets/product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Products",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black),
            onPressed: () => _showFilterBottomSheet(context),
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.status == ProductStatus.loading) {
            return AppLoading();
          }

          if (state.status == ProductStatus.idle) {
            final product = state.product;
            if (product.isEmpty) {
              return Center(
                child: Text(
                  "Hech qanday mahsulot topilmadi",
                  style: TextStyle(fontSize: 18),
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: product.length,
              itemBuilder: (context, index) {
                final item = product[index];
                return ProductCard(
                  imageUrl: item.images.first.image,
                  description: item.descriptionCrl,
                );
              },
            );
          }

          if (state.status == ProductStatus.error) {
            return Center(
              child: Text(
                "Ma'lumot yuklanmadi",
                style: TextStyle(color: Colors.redAccent, fontSize: 18),
              ),
            );
          }

          return Center(
            child: Text(
              "Holat aniqlanmadi",
              style: TextStyle(color: Colors.grey),
            ),
          );
        },
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => FilterSheet(
        onApply: (min, max, color) {
          context.read<ProductBloc>().add(
            ProductLoad(minPrice: min, maxPrice: max, color: color),
          );
        },
      ),
    );
  }
}
