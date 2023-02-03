import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_api/people_model.dart';
import 'people_service.dart';

class PeopleDetailScreen extends StatelessWidget {
  PeopleService peopleService = PeopleService();
  PeopleDetailScreen(
      {required this.title, required this.url, required this.id});
  String title;
  String url;
  String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        //TODO Display pokemon detail from url
        body: FutureBuilder(
          future: peopleService.getPeopleModel(id.toString()),
          builder: (context, AsyncSnapshot<PeopleModel> snapshot) {
            if (snapshot.hasData) {
              PeopleModel data = snapshot.data!;
              return Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      Text(
                          "Name : ${data.name}\nGender : ${data.gender}\nHeight : ${data.height}\nMass : ${data.mass}\nHair Color : ${data.hairColor}\nSkin : ${data.skinColor}\nEye Color : ${data.eyeColor}\nBirth Year : ${data.birthYear}\nLink : ${data.homeworld}")
                    ],
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
