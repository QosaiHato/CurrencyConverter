import 'package:currency_converter/Cubits/currency_cubit.dart';
import 'package:currency_converter/Services/currency-API.dart';
import 'package:currency_converter/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      home: BlocProvider(
        create: (context) => CurrencyCubit(currencyService: CurrencyService())..getConversionRates(),
        child: CurrencyConverterScreen(),
      ),
    );
  }
}
