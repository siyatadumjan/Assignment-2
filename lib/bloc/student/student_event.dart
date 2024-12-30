import 'package:equatable/equatable.dart';

abstract class StudentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddStudent extends StudentEvent {
  final String name;
  final int age;
  final String address;

  AddStudent(this.name, this.age, this.address);

  @override
  List<Object?> get props => [name, age, address];
}

class DeleteStudent extends StudentEvent {
  final int index;

  DeleteStudent(this.index);

  @override
  List<Object?> get props => [index];
}
