import 'package:storage/storage.dart';
import 'models/cart_item.dart';
import 'cart_repository.dart';
import 'cart_storage.dart';

class CartRepositoryImpl implements CartRepository {
  final CartStorage _cartStorage;

  CartRepositoryImpl(Storage storage) : _cartStorage = CartStorage(storage);

  @override
  Future<void> addItem(CartItem item) async {
    await _cartStorage.add(item);
  }

  @override
  Future<void> removeItem(String productId) async {
    await _cartStorage.remove(productId);
  }

  @override
  Future<void> updateQuantity(String productId, int quantity) async {
    await _cartStorage.updateQuantity(productId, quantity);
  }

  @override
  Future<List<CartItem>> getCartItems() async {
    return await _cartStorage.getAll();
  }

  @override
  Future<void> clearCart() async {
    await _cartStorage.clear();
  }
}
