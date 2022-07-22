

import 'package:get_storage/get_storage.dart';
import 'package:masala_box_test/models/list_data.dart';


class LocalStorage {
  static final GetStorage _storage = GetStorage();

  clearStorage() async {
    return await _storage.erase();
  }

  setSortOrder(var sortOrder)async{
    return await setLocalDataByKey('sort', sortOrder);
  }
  getSortOrder()async{
    var a =  await getLocalDataByKey('sort');
    return a ;
  }




  getLocalDataByKey(key) async {
    return await _storage.read(key);
  }

  setLocalDataByKey(key, value) async {
    return await _storage.write(key, value.toString());
  }
}
