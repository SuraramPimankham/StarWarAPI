import 'package:flutter/cupertino.dart';
import 'package:student_api/main.dart';
import 'package:student_api/people_list_model.dart';
import 'package:student_api/people_model.dart';
import 'package:student_api/people_provider.dart';

class PeopleService {
  PeopleProvider _peopleProvider = new PeopleProvider();

  Future<PeopleListModel> getPeopleList() {
    return _peopleProvider.getPeopleList();
  }

  Future<PeopleModel> getPeopleModel(String id) {
    return _peopleProvider.getPeopleModel(id);
  }
}
