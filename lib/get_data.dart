import 'package:dio/dio.dart';

import 'model/user_model.dart';

Future<List<UserModel>> getData() async {
  var url = 'https://jsonplaceholder.typicode.com/todos';
  try {
    Response response = await Dio().get(url);

    if (response.statusCode == 200) {
      var myList = response.data as List;

      return myList.map((e) => UserModel.fromJson(e)).toList();
    } else {
      return [];
    }
  } catch (e) {
    print('error');
    return [];
  }
}
