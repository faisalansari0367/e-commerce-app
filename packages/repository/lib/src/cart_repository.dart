import 'models/cart_item.dart';

abstract class CartRepository {
  Future<void> addItem(CartItem item);
  Future<void> removeItem(String productId);
  Future<void> updateQuantity(String productId, int quantity);
  Future<List<CartItem>> getCartItems();
  Future<void> clearCart();
}
