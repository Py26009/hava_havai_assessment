import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hava_havai_assessment/API_Helper/Api_Helper.dart';
import 'package:hava_havai_assessment/Bloc/Products%20Events.dart';
import 'package:hava_havai_assessment/Bloc/Products%20State.dart';
import 'package:hava_havai_assessment/Data/Remote/Urls.dart';
import 'package:hava_havai_assessment/Models/Products%20Model.dart';

import '../API_Helper/App_Exceptions.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState>{
  APIHelper ApiHelper;
  ProductsBloc({required this.ApiHelper}):super(ProductsInitialState()) {
    on<GetProductsEvent>((event, emit) async {
      emit(ProductsLoadingState());

      try {
        var resJson = await ApiHelper.getAPI(Url: AppUrls.productsUrl);
        if (resJson != null) {
          var mResData = JSONModel.fromJson(resJson);
          print(mResData);
          emit(ProductsLoadedState(mData: mResData));
        } else {
          emit (ProductsErrorState(errorMsg: "Sorry, some error occured"));
        }
      } catch (e) {
        emit (ProductsErrorState(errorMsg: e.toString()));
      }
    });
  }
}
