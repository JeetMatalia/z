class Question {
  final String id;
  final String title;
  final Map<String, bool> options;

  //create a constructor
  Question({
    required this.id,
    required this.options,
    required this.title,
  });

  //override the toString method to print the questions on console
  @override
  String toString() {
    return 'Ouestion(id: $id , title : $title , options:$options)';
  }
}
