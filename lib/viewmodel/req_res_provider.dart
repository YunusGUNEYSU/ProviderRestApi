import 'package:dio_provider_block/product/global/resource_context.dart';
import 'package:flutter/cupertino.dart';

import '../model/resource_model.dart';
import '../service/reqres_service.dart';

class ReqResProvider extends ChangeNotifier {
  final IReqresService _reqresService;

  List<Data> resources = [];
  bool isLoading=false;

  void _changeLoading(){
    isLoading=!isLoading;
    notifyListeners();
  }

  ReqResProvider(this._reqresService) {
    _fetc();
  }

  Future<void> _fetc() async {
    _changeLoading();
    resources = (await _reqresService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }
  void saveToLocole(ResourceContext resourceContext){
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}
