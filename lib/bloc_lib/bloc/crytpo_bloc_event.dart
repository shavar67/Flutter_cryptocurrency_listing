part of 'crytpo_bloc_bloc.dart';

abstract class CrytpoBlocEvent extends Equatable {
  const CrytpoBlocEvent();

  @override
  List<Object> get props => [];
}

class LoadCryptoEvent extends CrytpoBlocEvent {
  final int defaultIndex;

  const LoadCryptoEvent({this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'default index cannot be less than 0');

  @override
  List<Object> get props => [defaultIndex];
}
