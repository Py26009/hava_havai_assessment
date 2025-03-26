import 'package:hava_havai_assessment/Models/Products%20Model.dart';

abstract class ProductsState{}

class ProductsInitialState extends ProductsState{}

class ProductsLoadingState extends ProductsState{}

class ProductsLoadedState extends ProductsState{
     JSONModel mData;
     ProductsLoadedState({required this.mData});
}

class ProductsErrorState extends ProductsState{
  String errorMsg;
  ProductsErrorState({required this.errorMsg});
}

