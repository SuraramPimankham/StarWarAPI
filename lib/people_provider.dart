import 'dart:convert';
import 'package:http/http.dart';
import 'package:student_api/people_list_model.dart';
import 'package:student_api/people_model.dart';

class PeopleProvider {
  get id => null;

  Future<PeopleListModel> getPeopleList() async {
    var uri = Uri.https('swapi.dev', 'api/people');
    Response res = await get(uri);
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      PeopleListModel pModel = PeopleListModel.fromJson(body);
      return pModel;
    } else {
      print("Can't get response form server");
      throw "Server exception";
    }
  }

  Future<PeopleModel> getPeopleModel(String id) async {
    var uri = Uri.https('swapi.dev', 'api/people/' + id);
    Response res = await get(uri);
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      PeopleModel model = PeopleModel.fromJson(body);
      return model;
    } else {
      print("Can't get response from server");
      print(uri);
      throw "Server exception";
    }
  }
}
