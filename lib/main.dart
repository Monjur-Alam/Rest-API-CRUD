import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api_flutter/services/notes_service.dart';
import 'package:rest_api_flutter/views/note_list.dart';

void setUpLocator() {
  GetIt.I.registerLazySingleton(() => NotesService());
}

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteList(),
    );
  }
}
