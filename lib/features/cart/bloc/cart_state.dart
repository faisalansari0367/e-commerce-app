import 'package:equatable/equatable.dart';
import 'package:repository/repository.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> items;

  const CartLoaded(this.items);

  double get totalPrice => items.fold(0, (sum, item) => sum + item.totalPrice);

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);

  @override
  List<Object?> get props => [items];
}

class CartItemAdded extends CartState {
  final CartItem addedItem;
  final List<CartItem> items;

  const CartItemAdded(this.addedItem, this.items);

  @override
  List<Object?> get props => [addedItem, items];
}

class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object?> get props => [message];
}
