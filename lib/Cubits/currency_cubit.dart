import 'package:currency_converter/Cubits/currency_state.dart';
import 'package:currency_converter/Models/currency_models.dart';
import 'package:currency_converter/Services/currency-API.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';



class CurrencyCubit extends Cubit<CurrencyState> {
  final CurrencyService currencyService;

  CurrencyCubit({required this.currencyService}) : super(CurrencyInitial());

  void getConversionRates() async {
    try {
      emit(CurrencyLoading());
      final conversionRates = await currencyService.getConversionRates();
      emit(CurrencyLoaded(conversionRates: conversionRates));
    } catch (e) {
      emit(CurrencyError(error: e.toString()));
    }
  }

 double convert(double amount, String from, String to, CurrencyConversion conversionRates) {
  double fromRate = (conversionRates.conversionRates[from] as num).toDouble();
  double toRate = (conversionRates.conversionRates[to] as num).toDouble();
  return (amount / fromRate) * toRate;
}

}
