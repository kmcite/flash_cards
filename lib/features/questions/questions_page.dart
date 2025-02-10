import '../../main.dart';

class QuestionsPage extends UI {
  static const path = 'questions';
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (questionsBloc.waiting) return CircularProgressIndicator().center();
    return Scaffold(
      appBar: AppBar(
        title: 'Questions'.text(),
        actions: const [
          QuestionsAmountCard(),
        ],
      ),
      body: const QuestionsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          questionsBloc.put(Question());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class QuestionsList extends ReactiveStatelessWidget {
  const QuestionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: questionsBloc.questions.length,
      itemBuilder: (context, index) {
        final question = questionsBloc.questions[index];
        return question.text();
      },
    );
  }
}

class QuestionsAmountCard extends ReactiveStatelessWidget {
  const QuestionsAmountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: questionsBloc.questions.length.text().pad(),
    );
  }
}

class CreateQuizCard extends ReactiveStatelessWidget {
  const CreateQuizCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: 'Create'.text(),
    );
  }
}
