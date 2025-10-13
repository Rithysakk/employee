enum Skill { FLUTTER, DART, OTHER }

class Employee {
  String name;
  double baseSalary;
  int yearsOfExperience;
  List<Skill> skills;

  Employee(this.name, this.baseSalary, this.yearsOfExperience, this.skills);

  double calculateTotalSalary() {
    double total = baseSalary + (yearsOfExperience * 2000);

    for (var skill in skills) {
      if (skill == Skill.FLUTTER) total += 5000;
      else if (skill == Skill.DART) total += 3000;
      else total += 1000;
    }

    return total;
  }

  void Details() {
    print('Name: $name');
    print('Experience: $yearsOfExperience years');
    print('Skills: ${skills.map((s) => s.name).join(', ')}');
    print('Total Salary: \$${calculateTotalSalary()}');
    print('----------------------');
  }
}

void main() {
  var emp1 = Employee('Sokea', 40000, 3, [Skill.FLUTTER, Skill.DART]);
  var emp2 = Employee('Ronan', 45000, 5, [Skill.OTHER]);

  emp1.Details();
  emp2.Details();
}
