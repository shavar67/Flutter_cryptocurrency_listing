part of 'crytpo_bloc_bloc.dart';

abstract class CrytpoBlocState extends Equatable {
  const CrytpoBlocState();

  @override
  List<Object> get props => [];
}

class CrytpoBlocInitial extends CrytpoBlocState {}

class CryptoInitialView extends CrytpoBlocState {}

class CryptoError extends CrytpoBlocState {
  final AppErrorType errortype;

  const CryptoError(this.errortype);
}

class CryptoViewLoaded extends CrytpoBlocState {
  final List<CurrencyModel> currencies;
  final int defaultIndex;

  CryptoViewLoaded({this.currencies, this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'default index cannot be 0');
  List<Object> get props => [currencies, defaultIndex];
}
