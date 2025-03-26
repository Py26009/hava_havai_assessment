import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hava_havai_assessment/API_Helper/Api_Helper.dart';
import 'package:hava_havai_assessment/Bloc/AddToCartBloc/add%20cart%20bloc.dart';
import 'package:hava_havai_assessment/Bloc/Products%20Bloc.dart';
import 'package:hava_havai_assessment/Screens/Splash%20Screen.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>ProductsBloc(ApiHelper: APIHelper())),
        BlocProvider(create: (_) => CartBloc()),
      ], child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen()
    );
  }
}
