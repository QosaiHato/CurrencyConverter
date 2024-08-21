

import 'package:currency_converter/Models/currency_models.dart';
import 'package:equatable/equatable.dart';

abstract class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}

class CurrencyInitial extends CurrencyState {}

class CurrencyLoading extends CurrencyState {}

class CurrencyLoaded extends CurrencyState {
  final CurrencyConversion conversionRates;

  const CurrencyLoaded({required this.conversionRates});

  @override
  List<Object> get props => [conversionRates];
}

class CurrencyError extends CurrencyState {
  final String error;

  const CurrencyError({required this.error});

  @override
  List<Object> get props => [error];
}
