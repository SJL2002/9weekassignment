import 'package:flutter/material.dart';
import 'VocabularyService.dart';
import 'Vocabulary.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class VocabularyAddScreen extends StatefulWidget {
  final Function callUpdateUI;

  VocabularyAddScreen({Key? key, required this.callUpdateUI}) : super(key: key);

  @override
  _VocabularyAddScreenState createState() => _VocabularyAddScreenState();
}

class _VocabularyAddScreenState extends State<VocabularyAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _koreanController = TextEditingController();
  final _translationController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Vocabulary 테스팅'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _koreanController,
                decoration: InputDecoration(
                  labelText: 'Korean Word',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Korean word is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _translationController,
                decoration: InputDecoration(
                  labelText: 'Translation',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Translation is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final newVocabulary = Vocabulary(
                      id: '0',
                      korean: _koreanController.text,
                      translation: _translationController.text,
                      completed: false,
                    );

                    await VocabularyService.createVocabulary(newVocabulary);
                    widget.callUpdateUI();
                    Navigator.pop(context, newVocabulary);
                  }
                },
                child: Text('Add Vocabulary'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
