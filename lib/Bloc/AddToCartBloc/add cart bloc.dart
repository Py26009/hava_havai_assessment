import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hava_havai_assessment/Bloc/AddToCartBloc/add%20cart%20event.dart';
import 'package:hava_havai_assessment/Bloc/AddToCartBloc/add%20cart%20state.dart';

import '../../Models/Products Model.dart';

class CartBloc extends Bloc<CartEvent, CartState>{
  final List<ProductsModel> _cartItems = [];
  CartBloc():super(CartInitialState()){
    on<AddToCartEvent>((event, emit){
      if (!_cartItems.contains(event.mProduct)) {
        _cartItems.add(event.mProduct);
      }
      emit(CartUpdatedState(List.from(_cartItems)));
    });

    on<RemoveFromCartEvent>((event, emit) {
      _cartItems.remove(event.mProduct);
      emit(CartUpdatedState(List.from(_cartItems)));
    });
  }

}