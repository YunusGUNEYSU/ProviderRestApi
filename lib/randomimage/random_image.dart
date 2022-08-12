import 'package:dio_provider_block/product/global/resource_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RandomImage extends StatefulWidget {
  const RandomImage({Key? key}) : super(key: key);

  @override
  State<RandomImage> createState() => _RandomImageState();
}

class _RandomImageState extends State<RandomImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(context.read<ResourceContext>().model?.data?.length.toString()??''),
      ),
      body: Center(child: Image.network('https://picsum.photos/200/300')),
    );
  }
}