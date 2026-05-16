void main() {
  Set<String> studentNames = {};

  void addStudent(String name) {
    studentNames.add(name);
  }

  void printStudents(List<String> names, int index) {
    if (index < names.length) {
      print("Recursive print: ${names[index]}");
      printStudents(names, index + 1);
    }
  }

  addStudent("Mariam");
  addStudent("Madonna");

  studentNames.forEach((name) => print("Lambda print: $name"));

  printStudents(studentNames.toList(), 0);

  Set<String> newStudents = {"Sara", "Ahmed"};
  studentNames = {...studentNames, ...newStudents};

  Map<String, List<double>> studentData = {};

  void addCourse(String studentName, String courseName, {double grade = 0}) {
    if (!studentData.containsKey(studentName)) {
      studentData[studentName] = [];
    }
    studentData[studentName]!.add(grade);
  }

  double averageGrade(String studentName) {
    List<double> grades = studentData[studentName] ?? [];
    if (grades.isEmpty) return 0;
    return grades.reduce((a, b) => a + b) / grades.length;
  }

  addCourse("Mariam", "Dart", grade: 90);
  addCourse("Mariam", "Logic", grade: 80);
  print("Average Result: ${averageGrade("Mariam")}");
}