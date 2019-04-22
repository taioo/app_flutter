import 'package:flutter/material.dart';

import './question_edit.dart';

class QuestionListPage extends StatelessWidget {
  final Function updateQuestion;
  final Function deleteQuestion;
  final List<Map<String, dynamic>> questions;

  QuestionListPage(this.questions, this.updateQuestion, this.deleteQuestion);

  Widget _deleteButton(BuildContext context, int index) {
    return IconButton(
      icon: Icon(Icons.delete_forever),
      onPressed: () {
        deleteQuestion(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
              backgroundImage: questions[index]['image'] == null
                  ? null
                  : FileImage(questions[index]['image'])),
          title: Text(questions[index]['name']),
          subtitle: Text('\age: ${questions[index]['age'].toString()}'),
          trailing: _deleteButton(context, index),
        );
      },
      itemCount: questions.length,
    );
  }
}
