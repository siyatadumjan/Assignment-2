import 'package:bloc/bloc.dart';
import '../../model/student_model.dart';
import 'student_event.dart';
import 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final List<StudentModel> _students = [];

  StudentBloc() : super(StudentInitial()) {
    on<AddStudent>((event, emit) {
      emit(StudentLoading());
      _students.add(StudentModel(
        name: event.name,
        age: event.age,
        address: event.address,
      ));
      emit(StudentLoaded(_students));
    });

    on<DeleteStudent>((event, emit) {
      emit(StudentLoading());
      _students.removeAt(event.index);
      emit(StudentLoaded(_students));
    });
  }
}
