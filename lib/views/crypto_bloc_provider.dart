import 'package:cryptic_currency/bloc_lib/bloc/crytpo_bloc_bloc.dart';
import 'package:cryptic_currency/usecases/error_widget.dart';
import 'package:cryptic_currency/views/currency_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoBlocProvider extends StatelessWidget {
  const CryptoBlocProvider({
    Key key,
    @required this.cryptoBloc,
  }) : super(key: key);

  final CryptoBloc cryptoBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBloc, CrytpoBlocState>(
      cubit: cryptoBloc,
      builder: (context, state) {
        if (state is CryptoViewLoaded) {
          return CurrencyWidget(
              currencies: state.currencies, defaultIndex: state.defaultIndex);
        } else if (state is CryptoError) {
          return KErrorWidget(
            onPressed: () => cryptoBloc.add(
              LoadCryptoEvent(),
            ),
            errorType: state.errortype,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
