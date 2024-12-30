import 'package:dashboard_project/bloc/simple_interest/simple_interest_bloc.dart';
import 'package:dashboard_project/bloc/student/student_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/area_circle/area_circle_bloc.dart';
import '../bloc/dashboard_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initBloc();
}

void _initBloc() {
  // Individual Blocs
  serviceLocator.registerLazySingleton(() => AreaCircleBloc());
  serviceLocator.registerLazySingleton(() => SimpleInterestBloc());
  serviceLocator.registerLazySingleton(() => StudentBloc());

  // DashboardBloc to pass AreaCircleBloc and SimpleInterestBloc
  serviceLocator.registerFactory(() => DashboardBloc(
        serviceLocator<AreaCircleBloc>(),
        serviceLocator<SimpleInterestBloc>(),
        serviceLocator<StudentBloc>(),
      ));
}
