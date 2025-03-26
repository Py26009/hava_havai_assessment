import '../../Models/Products Model.dart';

abstract class CartState {
  List<Object> get products => [];
}

class CartInitialState extends CartState {}
class CartLoadingState extends CartState{}
class CartUpdatedState extends CartState {
  final List<ProductsModel> cartItems;

  CartUpdatedState(this.cartItems);

  @override
  List<Object> get products => [cartItems];
}