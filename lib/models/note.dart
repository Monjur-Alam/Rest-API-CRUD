class Note {
  String noteID;
  String noteTitle;
  String noteContent;
  DateTime createDateTime;

  Note(
      {required this.noteID,
      required this.noteTitle,
      required this.noteContent,
      required this.createDateTime});

  factory Note.fromJson(Map<String, dynamic> item) {
    return Note(
        noteID: item['noteID'],
        noteTitle: item['noteTitle'],
        noteContent: item['noteContent'],
        createDateTime: DateTime.parse(item['createDateTime'])
    );
  }
}
