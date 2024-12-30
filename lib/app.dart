import 'package:dashboard_project/service_locator/service_locator.dart';
import 'package:dashboard_project/view/dashboard_bloc_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/dashboard_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Class Assignment 2',
      home: BlocProvider.value(
        value: serviceLocator<DashboardBloc>(),
        child: DashboardBlocView(),
      ),
    );
  }
}
