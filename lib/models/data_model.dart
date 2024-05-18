import 'dart:convert';

class DataModel {
  final int id;
  final int year;
  final String title;
  final String handle;
  final String publisher;
  final String isbn;
  final int pages;
  final List<String> notes;
  final String createdAt;
  final List<dynamic>
      villains; // Assuming villains is a list of dynamic objects for now

  DataModel({
    required this.id,
    required this.year,
    required this.title,
    required this.handle,
    required this.publisher,
    required this.isbn,
    required this.pages,
    required this.notes,
    required this.createdAt,
    required this.villains,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      year: json['Year'],
      title: json['Title'],
      handle: json['handle'],
      publisher: json['Publisher'],
      isbn: json['ISBN'],
      pages: json['Pages'],
      notes: List<String>.from(json['Notes']),
      createdAt: json['created_at'],
      villains: List<dynamic>.from(json['villains']),
    );
  }

  static List<DataModel> fromJsonList(String jsonString) {
    final data = json.decode(jsonString) as List;
    return data.map((jsonItem) => DataModel.fromJson(jsonItem)).toList();
  }
}
