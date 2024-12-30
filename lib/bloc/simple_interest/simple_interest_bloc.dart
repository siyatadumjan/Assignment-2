import 'package:bloc/bloc.dart';
import 'simple_interest_event.dart';

class SimpleInterestBloc extends Cubit<double> {
  SimpleInterestBloc() : super(0.0);

  void calculateInterest(double principal, double rate, double time) {
    final interest = (principal * rate * time) / 100;
    emit(interest);
  }
}
