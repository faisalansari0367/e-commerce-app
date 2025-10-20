import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@Freezed(toJson: true)
class Product with _$Product {
  const factory Product({required String id, required String name, required double price, required String image, required String description}) =
      _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
