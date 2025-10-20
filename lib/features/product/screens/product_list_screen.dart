import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';
import 'package:shopsy/features/cart/bloc/cart_bloc.dart';
import 'package:shopsy/features/cart/bloc/cart_event.dart';
import 'package:shopsy/features/cart/bloc/cart_state.dart';
import 'package:shopsy/widgets/cart_icon_button.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_state.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopsy'), actions: [CartIconButton.withBloc()]),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return switch (state) {
            ProductLoading() || ProductInitial() => const Center(child: CircularProgressIndicator()),
            ProductError errorState => Center(child: Text(errorState.message)),
            ProductsLoaded loadedState => ProductsListview(products: loadedState.products),
          };
        },
      ),
    );
  }
}

class AddToCartListener extends BlocListener<CartBloc, CartState> {
  const AddToCartListener({super.key, required Widget child}) : super(child: child, listener: _listener);

  static _listener(BuildContext context, CartState state) {
    if (state is CartItemAdded) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${state.addedItem.product.name} added to cart'),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFF3D3D5C),
          action: SnackBarAction(label: 'VIEW CART', textColor: Colors.white, onPressed: () => Navigator.pushNamed(context, '/cart')),
        ),
      );
    }
  }
}

class ProductsListview extends StatelessWidget {
  const ProductsListview({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return AddToCartListener(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            product: product,
            onAddToCart: () {
              context.read<CartBloc>().add(AddToCart(CartItem(productId: product.id, product: product, quantity: 1)));
            },
          );
        },
      ),
    );
  }
}
