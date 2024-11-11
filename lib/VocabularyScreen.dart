import 'package:flutter/material.dart';
import 'VocabularyAddScreen.dart';
import 'VocabularyService.dart';
import 'Vocabulary.dart';

class VocabularyListScreen extends StatefulWidget {
  const VocabularyListScreen({Key? key}) : super(key: key);

  @override
  State<VocabularyListScreen> createState() => _VocabularyListScreenState();
}

class _VocabularyListScreenState extends State<VocabularyListScreen> {
  updateListUI() {
    setState(() {});
    print("updateListUI");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vocabulary List'),
      ),
      body: FutureBuilder<List<Vocabulary>>(
        future: VocabularyService.getVocabulary(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final vocabulary = snapshot.data!;
            return ListView.builder(
              itemCount: vocabulary.length,
              itemBuilder: (context, index) {
                final vocab = vocabulary[index];
                return ListTile(
                  title: Text('${vocab.korean} - ${vocab.translation}'),
                  trailing: Checkbox(
                    value: vocab.completed,
                    onChanged: (value) {
                      // Update the completed state of the vocabulary item
                      VocabularyService.updateVocabulary(
                        Vocabulary(
                          id: vocab.id,
                          korean: vocab.korean,
                          translation: vocab.translation,
                          completed: value!,
                        ),
                      );
                      updateListUI();
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VocabularyAddScreen(callUpdateUI: updateListUI),
            ),
          );
        },
      ),
    );
  }
}
