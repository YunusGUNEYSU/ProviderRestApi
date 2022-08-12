
import 'package:dio_provider_block/model/resource_model.dart';
import 'package:dio_provider_block/service/reqres_service.dart';
import 'package:flutter/material.dart';

import '../product/service/project_dio.dart';
import '../view/reqres_view.dart';

abstract class ReqResViewModel extends State<ReqResView> with ProjectDioMixin  {
 late final IReqresService _reqresService;
 
List<Data> resources=[];
 @override
  void initState() {
    
    super.initState();
    _reqresService=ReqresService(service);
    _fetc();
  }
  Future<void> _fetc() async {

    resources=(await _reqresService.fetchResourceItem())?.data??[];
  }

}