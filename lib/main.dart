import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/cart/bloc/cart_bloc.dart';
import 'features/cart/bloc/cart_event.dart';
import 'features/cart/screens/cart_screen.dart';
import 'features/product/bloc/product_bloc.dart';
import 'features/product/bloc/product_event.dart';
import 'features/product/screens/product_list_screen.dart';
import 'package:repository/repository.dart';
import 'package:storage/storage.dart';

import 'features/product_detail/screens/product_detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Storage storage = HiveStorage();
  await storage.init();
  await storage.clear(); // For testing purposes only
  final ProductRepository productRepository = ProductRepositoryImpl();
  final CartRepository cartRepository = CartRepositoryImpl(storage);

  runApp(ShopsyApp(storage: storage, productRepository: productRepository, cartRepository: cartRepository));
}

class ShopsyApp extends StatelessWidget {
  final Storage storage;
  final ProductRepository productRepository;
  final CartRepository cartRepository;

  const ShopsyApp({super.key, required this.storage, required this.productRepository, required this.cartRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<ProductRepository>(create: (_) => productRepository),
        RepositoryProvider<CartRepository>(create: (_) => cartRepository),
        BlocProvider<ProductBloc>(create: (context) => ProductBloc(productRepository)..add(LoadProducts())),
        BlocProvider<CartBloc>(create: (context) => CartBloc(cartRepository)..add(LoadCart())),
      ],
      child: MaterialApp(
        title: 'Shopsy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
        home: const ProductListScreen(),
        onGenerateRoute: (settings) {
          return switch (settings.name) {
            '/cart' => MaterialPageRoute(builder: (_) => const CartScreen()),
            '/product' => MaterialPageRoute(builder: (_) => ProductDetailScreen(product: settings.arguments as Product)),
            _ => null,
          };
        },
      ),
    );
  }
}
