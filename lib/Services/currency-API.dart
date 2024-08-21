import 'package:currency_converter/Models/currency_models.dart';
import 'package:dio/dio.dart';

class CurrencyService {
  final Dio _dio = Dio();
  final String _baseUrl =
      'https://v6.exchangerate-api.com/v6/b57a6f560dae6819db82e10f';

  Future<CurrencyConversion> getConversionRates() async {
    try {
      final response = await _dio.get('$_baseUrl/latest/USD');
      if (response.statusCode == 200) {
        return CurrencyConversion.fromJson(response.data);
      } else {
        throw Exception('Failed to load conversion rates');
      }
    } catch (e) {
      throw Exception('Failed to load conversion rates');
    }
  }
}
