import 'package:http/http.dart' as http;
import 'Vocabulary.dart';
import 'dart:convert';

class VocabularyService {
  static const baseUrl = 'http://localhost:3000';
  static const headers = {'Content-Type': 'application/json; charset=UTF-8'};

  // GET /languagelearningapp
  static Future<List<Vocabulary>> getVocabulary() async {
    final response = await http.get(Uri.parse('$baseUrl/vocabulary'));

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List;
      return jsonList.map((json) => Vocabulary.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load vocabulary');
    }
  }

  // POST /languagelearningapp
  static Future<Vocabulary> createVocabulary(Vocabulary vocab) async {
    final jsonBody = jsonEncode(vocab.toJson());

    final response = await http.post(
      Uri.parse('$baseUrl/vocabulary'),
      headers: headers,
      body: jsonBody,
    );

    if (response.statusCode == 201) {
      final json = jsonDecode(response.body);
      return Vocabulary.fromJson(json);
    } else {
      throw Exception('Failed to create vocabulary');
    }
  }

  // PUT /languagelearningapp/:id
  static Future<Vocabulary> updateVocabulary(Vocabulary vocab) async {
    final jsonBody = jsonEncode(vocab.toJson());

    final response = await http.put(
      Uri.parse('$baseUrl/vocabulary/${vocab.id}'),
      headers: headers,
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Vocabulary.fromJson(json);
    } else {
      throw Exception('Failed to update vocabulary');
    }
  }

  // DELETE /languagelearningapp/:id
  static Future<void> deleteVocabulary(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/vocabulary/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete vocabulary');
    }
  }
}
