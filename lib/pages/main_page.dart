import 'package:currency_converter/Cubits/currency_cubit.dart';
import 'package:currency_converter/Cubits/currency_state.dart';
import 'package:currency_converter/Models/currency_models.dart';
import 'package:currency_converter/Widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyConverterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: BlocBuilder<CurrencyCubit, CurrencyState>(
        builder: (context, state) {
          if (state is CurrencyInitial) {
            return Center(child: Text('Select a currency to convert'));
          } else if (state is CurrencyLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CurrencyLoaded) {
            return CurrencyForm(conversionRates: state.conversionRates);
          } else if (state is CurrencyError) {
            return Center(child: Text(state.error));
          } else {
            return Center(child: Text('Unexpected state'));
          }
        },
      ),
    );
  }
}

class CurrencyForm extends StatefulWidget {
  final CurrencyConversion conversionRates;

  CurrencyForm({required this.conversionRates});

  @override
  _CurrencyFormState createState() => _CurrencyFormState();
}

class _CurrencyFormState extends State<CurrencyForm> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<String> _selectedCurrencies = [
    'USD',
    'EUR',
    'GBP',
    'JPY',
    'SAR',
    'JOD',
  ];
  final List<double> _convertedAmounts = List.generate(6, (_) => 0.0);

  void _convert(int index) {
    final amount = double.tryParse(_controllers[index].text) ?? 0.0;
    final cubit = context.read<CurrencyCubit>();

    setState(() {
      for (int i = 0; i < 6; i++) {
        if (i != index) {
          _convertedAmounts[i] = cubit.convert(
              amount,
              _selectedCurrencies[index],
              _selectedCurrencies[i],
              widget.conversionRates);
          _controllers[i].text = _convertedAmounts[i].toStringAsFixed(2);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Currency Converter',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
            Container(
              height: 470,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white, // this is the container's color
                  boxShadow: [
                    BoxShadow(
                        color: const Color.fromARGB(255, 201, 201, 201),
                        spreadRadius: 1,
                        blurRadius:
                            2), // no shadow color set, defaults to black
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(6, (index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextField(
                              controller: _controllers[index],
                              onChanged: (_) => _convert(index),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        DropdownButton<String>(
                          value: _selectedCurrencies[index],
                          items: widget.conversionRates.conversionRates.keys
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedCurrencies[index] = newValue!;
                              _convert(
                                  index); // Recalculate all other fields when currency is changed
                            });
                          },
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
