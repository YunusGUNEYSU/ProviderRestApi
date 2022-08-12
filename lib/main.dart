import 'package:dio_provider_block/product/global/resource_context.dart';
import 'package:dio_provider_block/product/global/theme_notifer.dart';
import 'package:dio_provider_block/randomimage/random_image.dart';
import 'package:dio_provider_block/view/reqres_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers:[
      ChangeNotifierProvider(create: (context) =>LightTheme() ,),
      Provider(create:(_) => ResourceContext()),
    ],
    builder: (context, child) => const MyApp(),
    
    )
    
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: context.watch<LightTheme>().currentTheme,
      home: const ReqResView(),
    );
  }
}