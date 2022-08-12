import 'package:dio/dio.dart';
import 'package:dio_provider_block/product/global/theme_notifer.dart';
import 'package:dio_provider_block/product/service/project_dio.dart';
import 'package:dio_provider_block/randomimage/random_image.dart';
import 'package:dio_provider_block/service/reqres_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/resource_model.dart';
import '../product/global/resource_context.dart';
import '../viewmodel/req_res_provider.dart';
import '../viewmodel/req_res_view_model.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({Key? key}) : super(key: key);

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

class _ReqResViewState extends State<ReqResView> with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqResProvider>(
      create: (context) =>ReqResProvider(ReqresService(service)) ,
      builder:(context, child) {
      
      return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          context.read<LightTheme>().changeTheme();
        },),
        appBar: AppBar(
          leading: Text('AAA'),
          actions: [IconButton(onPressed: (){
            Provider.of<ReqResProvider>(context, listen: false);
            context.read<ReqResProvider>().saveToLocole(context.read<ResourceContext>());
            Navigator.of(context).push(MaterialPageRoute(builder:(_) {
              return const RandomImage();
              
            }, ));
          }, icon:const Icon(Icons.add_a_photo_outlined))],
          title: context.watch<ReqResProvider>().isLoading? const CircularProgressIndicator(color: Colors.brown,):null),
        body: Column(
          children: [
           Selector<ReqResProvider,bool>(builder:(context, value, child) {
             return value? const Placeholder():const Text('data');
           }, selector:(context, provider) {
             return provider.isLoading;
           }, ),
            Expanded(child: _reqResList(context,context.watch<ReqResProvider>().resources)),
          ],
        ),
      );
    }, 
    
    );
  }

  ListView _reqResList(BuildContext context,List<Data> items) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(color: Colors.deepPurple[300], child: Text(items[index].name ?? ''));
        },
      );
  }
}
