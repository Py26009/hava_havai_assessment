import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hava_havai_assessment/App_utilities/app_utilities.dart';
import 'package:hava_havai_assessment/Bloc/Products%20Bloc.dart';
import 'package:hava_havai_assessment/Bloc/Products%20Events.dart';
import 'package:hava_havai_assessment/Bloc/Products%20State.dart';
import 'package:hava_havai_assessment/Screens/Carts%20Page.dart';

import '../Bloc/AddToCartBloc/add cart bloc.dart';
import '../Bloc/AddToCartBloc/add cart event.dart';

class CataloguePage extends StatefulWidget {
  const CataloguePage({super.key});

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {


  @override
  void initState() {
    super.initState();
   BlocProvider.of<ProductsBloc>(context).add(GetProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().bgColor,
      appBar: AppBar(
        backgroundColor: AppColors().bgColor,
        title: Text("Catalogue", style: mTextStyle22(mFontWeight: FontWeight.normal),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Icon(Icons.favorite_border_outlined, size: 26,),
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Stack(
              children:[ InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CartsPage()));
                },
                  child: Icon(Icons.shopping_cart_outlined, size: 30,)),
        Positioned(
             right: 0,
                    top: -2, // Adjust position if needed
                 child: Container(
                   height: 20,
                 width: 20,
                 padding: EdgeInsets.all(4),
                 decoration: BoxDecoration(
               color: Colors.red,
                  borderRadius: BorderRadius.circular(14),
    ),
                   child: Text(
                     "", // Replace with your cart count variable
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 10,
                       fontWeight: FontWeight.bold,
                     ),
                     textAlign: TextAlign.center,
                   ),
        ),
        ),
    ]
            ),
          )
        ],

      ),
      body: BlocBuilder<ProductsBloc, ProductsState>
        (builder: (context, state){
         if(state is ProductsLoadingState){
             return Center(
               child: CircularProgressIndicator(),
             );
         }else if(state is ProductsErrorState){
           return Center(
             child: Text("${state.errorMsg}"),
           );
         }else if(state is ProductsLoadedState){
           var mItems = state.mData;
             return GridView.builder(
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                   childAspectRatio: 5/7,
                   mainAxisSpacing: 10,
                   crossAxisSpacing: 10,),
               shrinkWrap: true,
               itemCount: 30,
                 itemBuilder: (_,index){
                   /// ORIGINAL PRICE LOGIC
                   num  a = (mItems.products[index].price.toDouble())*100;
                   num b = 100 -(mItems.products[index].discountPercentage.toDouble());
                  num c = a/b;
                   String price = c.toStringAsFixed(2);
                   return  Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(           /// MAIN CONTAINER
                         decoration: BoxDecoration(
                         color: Color(0xffF6F6F3),
                     borderRadius: BorderRadius.circular(15),
                     border: Border.all(
                     color:  Colors.black26, width: 2)),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Container(   /// WISHLIST ICON CONTAINER
                                 width: 35,
                                 height: 35,
                                 decoration: BoxDecoration(
                                     borderRadius: const BorderRadius.only(topRight: Radius.circular(14),bottomLeft: Radius.circular(10)),
                                     color:Color(0xffFF660E)
                                 ),
                                 child: IconButton(onPressed: (){},
                                     icon:Icon(Icons.favorite_border_outlined, size: 18, color: Colors.white,)),
                               )
                             ],),
                           Container(  /// PRODUCT IMAGE CONTAINER
                             width: 190,
                             height: 100,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(15),
                                 color: Colors.grey.shade100),
                             child: Image.network(mItems.products[index].thumbnail, fit: BoxFit.fill,),
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(right: 6.0),
                                 child: Container(
                                   height: 25,
                                   width: 65,
                                   decoration: BoxDecoration(
                                     border: Border.all(
                                       color: Colors.black
                                     ),
                                     borderRadius: BorderRadius.circular(10),
                                   ),
                                   child: InkWell(
                                       onTap: (){
                                         BlocProvider.of<CartBloc>(context).add(AddToCartEvent(mItems.products[index]));

                                         ScaffoldMessenger.of(context).showSnackBar(
                                           SnackBar(content: Text("${mItems.products[index].title} added to cart")),
                                         );
                                       },
                                       child: Center(child: Text("Add" ,style: mTextStyle14(mColor: Colors.red),))),
                                 ),
                               )
                             ],
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 4.0),
                             child: Text(mItems.products[index].title, style: mTextStyle14(mFontWeight: FontWeight.bold,),),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 4.0),
                             child: Text(mItems.products[index].brand,),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 4.0),
                             child: Row(
                               children: [
                                 Text("Rs.", style: TextStyle(decoration: TextDecoration.lineThrough)),
                                 Text("$price", style: TextStyle(decoration: TextDecoration.lineThrough),),
                                 Text("  Rs."),
                                 Text(mItems.products[index].price.toString()),
                               ],
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 4.0),
                             child: Row(
                               children: [
                                 Text(mItems.products[index].discountPercentage.toString(), style: TextStyle(color: Colors.red),),
                                 Text("%",  style: TextStyle(color: Colors.red)),
                                 Text(" OFF", style: TextStyle(color: Colors.red)),
                                 SizedBox(width: 50,),
                               ],
                             ),
                           )
                         ],
                       )
                     ),
                   );

                 });

         }else{
           return Container();
         }
      }),
        
      

    );
  }

}
