import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_provider_block/model/resource_model.dart';

abstract class IReqresService {
  final Dio dio;

  IReqresService(this.dio);

  Future<ResourceModel?> fetchResourceItem();
}

enum _ReqresPath { resource }

class ReqresService extends IReqresService {
  ReqresService(super.dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final response = await dio.get('/${_ReqresPath.resource.name}');
    if (response.statusCode == HttpStatus.ok) {
      final jsonbody = response.data;
      if (jsonbody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonbody);
      }
    }
    return null;
  }
}
