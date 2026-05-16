import 'dart:io';

void main() {
  List<String> studentNames = [];
  List<List<double>> studentGrades = [];

  stdout.write("Enter the number of students: ");
  int numberOfStudents = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < numberOfStudents; i++) {
    stdout.write("Enter student's name: ");
    String name = stdin.readLineSync()!;
    studentNames.add(name);

    stdout.write("Enter the number of subjects: ");
    int numSubjects = int.parse(stdin.readLineSync()!);

    List<double> grades = [];
    for (int j = 0; j < numSubjects; j++) {
      stdout.write("Enter grade for subject ${j + 1}: ");
      double grade = double.parse(stdin.readLineSync()!);
      grades.add(grade);
    }
    studentGrades.add(grades);
  }

  while (true) {
    print("\n1. Show All Results");
    print("2. Search Student");
    print("3. Exit");
    stdout.write("Choose an option: ");
    String choice = stdin.readLineSync()!;

    if (choice == "1") {
      for (int i = 0; i < studentNames.length; i++) {
        double sum = 0;
        for (double g in studentGrades[i]) {
          sum += g;
        }
        double avg = sum / studentGrades[i].length;
        
        String letterGrade;
        if (avg >= 90) letterGrade = "A";
        else if (avg >= 80) letterGrade = "B";
        else if (avg >= 70) letterGrade = "C";
        else letterGrade = "F";

        print("Name: ${studentNames[i].toUpperCase()}, Average: ${avg.toStringAsFixed(2)}, Grade: $letterGrade");
      }
    } else if (choice == "2") {
      stdout.write("Enter student name: ");
      String searchName = stdin.readLineSync()!;
      bool found = false;

      for (int i = 0; i < studentNames.length; i++) {
        if (studentNames[i].toLowerCase() == searchName.toLowerCase()) {
          double sum = 0;
          for (double g in studentGrades[i]) {
            sum += g;
          }
          double avg = sum / studentGrades[i].length;
          print("Average: ${avg.round()}");
          found = true;
          break;
        }
      }
      if (!found) print("Student not found.");
    } else if (choice == "3") {
      break;
    }
  }
}