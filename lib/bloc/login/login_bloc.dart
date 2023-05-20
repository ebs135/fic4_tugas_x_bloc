// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import 'package:fic4_tugas_x_bloc/data/datasources/api_datasources.dart';
import 'package:fic4_tugas_x_bloc/data/models/request/login_model.dart';
import 'package:fic4_tugas_x_bloc/data/models/response/login_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiDataSource datasource;

  LoginBloc(
    this.datasource,
  ) : super(LoginInitial()) {
    on<SaveLoginEvent>((event, emit) async {
      emit(LoginLoading());
      final result = await datasource.login(event.request);
      emit(LoginLoaded(model: result));
    });
  }
}
