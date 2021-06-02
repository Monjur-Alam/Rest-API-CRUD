import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api_flutter/models/api_response.dart';
import 'package:rest_api_flutter/models/note.dart';
import 'package:rest_api_flutter/models/note_for_listing.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_flutter/models/note_manipulation.dart';
import 'package:rest_api_flutter/views/note_delete.dart';

class NotesService {
  static const API = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app';
  static const headers = {
    'apiKey': 'af050db7-4f51-4f2d-8017-b3516a1fae5d',
    'Content-Type': 'application/json'
  };

  get notes => null;

  Future<APIResponse<List<NoteForListing>>> getNoteList() {
    return http.get(Uri.parse(API + '/notes'), headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          notes.add(NoteForListing.fromJson(item));
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(
          data: notes, error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        data: notes, error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<Note>> getNote(String noteID) {
    return http
        .get(Uri.parse(API + '/notes/' + noteID), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
      return APIResponse<Note>(
          data: notes, error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<Note>(
            data: notes, error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> createNote(NoteManipulation noteInsert) {
    return http
        .post(Uri.parse(API + '/notes'), headers: headers, body: json.encode(noteInsert.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(
          data: notes, error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<bool>(
            data: notes, error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> updateNote(String noteID, NoteManipulation noteInsert) {
    return http
        .put(Uri.parse(API + '/notes/' + noteID), headers: headers, body: json.encode(noteInsert.toJson()))
        .then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(
          data: notes, error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<bool>(
            data: notes, error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> deleteNote(String noteID) {
    return http
        .delete(Uri.parse(API + '/notes/' + noteID), headers: headers)
        .then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(
          data: notes, error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<bool>(
            data: notes, error: true, errorMessage: 'An error occured'));
  }
}
