class TestModel {
  final Person person;
  final PersonTrait personTrait;

  const TestModel({this.person, this.personTrait});
}

class Person {
  final String firstName, lastName;

  const Person({this.firstName, this.lastName});
}

class PersonTrait {
  final String skinColor, height, weight, hair;

  const PersonTrait({this.skinColor, this.height, this.hair, this.weight});
}
