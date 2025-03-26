import '../../Models/Products Model.dart';

abstract class CartEvent {
  List<Object> get products => [];
}
class AddToCartEvent extends CartEvent {
  final ProductsModel mProduct;
  AddToCartEvent(this.mProduct);

  @override
  List<Object> get products => [mProduct];
}

class RemoveFromCartEvent extends CartEvent {
  final ProductsModel mProduct;

  RemoveFromCartEvent(this.mProduct);

  @override
  List<Object> get products => [mProduct];
}
