import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsy/features/cart/bloc/cart_bloc.dart';
import 'package:shopsy/features/cart/bloc/cart_state.dart';

class CartIconButton extends StatelessWidget {
  final int itemCount;
  final VoidCallback? onPressed;

  const CartIconButton({super.key, required this.itemCount, this.onPressed});

  static Widget withBloc() {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final count = state is CartLoaded ? state.itemCount : 0;
        return CartIconButton(itemCount: count, onPressed: () => Navigator.pushNamed(context, '/cart'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(icon: const Icon(Icons.shopping_cart_outlined), onPressed: onPressed),
        if (itemCount > 0)
          Positioned(
            right: 4,
            top: 4,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
              child: Center(
                child: Text(
                  '$itemCount',
                  style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
