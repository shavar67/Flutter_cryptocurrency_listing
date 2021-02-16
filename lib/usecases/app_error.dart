import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final AppErrorType appErrorType;
  const AppError(this.appErrorType);

  @override
  // TODO: implement props
  List<Object> get props => [AppErrorType];
}

enum AppErrorType { api, network }
