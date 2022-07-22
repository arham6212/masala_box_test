import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:masala_box_test/common/constants.dart';
import 'package:masala_box_test/components/toast.dart';
import 'package:masala_box_test/models/images_model.dart';
import 'package:masala_box_test/models/list_data.dart';
import 'package:masala_box_test/utils/local-storage.dart';
import 'package:masala_box_test/utils/request.dart';
import 'package:masala_box_test/utils/tools.dart';

class AppController extends GetxController {
  List<ListData> listItemsModel =[];
  var imagesFromApi = <Images>[];
  bool showSortIcon = true;

  getListItems() async {
 var sortOrder = await LocalStorage().getSortOrder();

    var jsonData =
        await rootBundle.loadString('assets/json_data/local_data.json');
    Map<String, dynamic> response = jsonDecode(jsonData);
    listItemsModel.clear();
    response['page1'].forEach(
      (value) {
        listItemsModel.add(ListData.fromResponse(value));
      },
    );
    if(sortOrder!=null){
      sortListItems(sortOrder: sortOrder=='asc'?SortOrder.ascending:SortOrder.descending);
    }
    update();
  }
  getItemsForList() async {
    try {
      var response = await Request.send('photos', connectionType:ConnectionType.get);
      if (response != null ) {
        if(response is Map && response.containsKey('errors')){
          return toast(response['errors'].first);
        }
        else{
          if(response is List  ){
            imagesFromApi.clear();
            for (var value in response) {
              imagesFromApi.add(Images.fromJson(value));
            }
          }else{
            return Tools.printLog('Something went wrong');
          }
        }
      }
    } catch (e) {
      toast(e);
    } finally {
      update();
    }
  }

  sortListItems({SortOrder sortOrder = SortOrder.ascending})async{
    await LocalStorage().setSortOrder(sortOrder==SortOrder.ascending?'asc':'des');
    listItemsModel.sort((a,b){
      return sortOrder ==SortOrder.ascending?a.type.compareTo(b.type): b.type.compareTo(a.type) ;
    });
    update();
  }
}
