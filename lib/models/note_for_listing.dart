import 'package:flutter/foundation.dart';

class NoteForListing {
  String noteID;
  String noteTitle;
  DateTime createDateTime;

  NoteForListing(
      {required this.noteID,
      required this.noteTitle,
      required this.createDateTime});

  factory NoteForListing.fromJson(Map<String, dynamic> item) {
    return NoteForListing(
        noteID: item['noteID'],
        noteTitle: item['noteTitle'],
        createDateTime: DateTime.parse(item['createDateTime'])
    );
  }
}
