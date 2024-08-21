class CurrencyConversion {
  final Map<String, dynamic> conversionRates;

  CurrencyConversion({required this.conversionRates});

  factory CurrencyConversion.fromJson(Map<String, dynamic> json) {
    return CurrencyConversion(conversionRates: json['conversion_rates']);
  }
}
