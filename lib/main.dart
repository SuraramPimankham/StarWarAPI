import 'package:flutter/material.dart';
import 'package:student_api/people_detail_screen.dart';
import 'package:student_api/people_list_model.dart';
import 'package:student_api/people_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StarWar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Person'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PeopleService peopleService = PeopleService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: peopleService.getPeopleList(),
          builder: (context, AsyncSnapshot<PeopleListModel> snapshot) {
            if (snapshot.hasData) {
              PeopleListModel lists = snapshot.data!;
              return ListView(
                children: lists.results
                    .map((PeopleListItem e) => ListTile(
                          onTap: () {
                            String url = e.url;
                            String cuturl = url.replaceAll(
                                "https://swapi.dev/api/people/", "");
                            String id = cuturl.replaceAll("/", "");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PeopleDetailScreen(
                                          title: e.name,
                                          url: e.url,
                                          id: id,
                                        )));
                          },
                          title: Text(e.name),
                        ))
                    .toList(),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
