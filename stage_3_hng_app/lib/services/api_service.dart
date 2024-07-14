import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:stage_3_hng_app/models/product_model.dart';

class ApiService {
  final String baseUrl = "https://api.timbu.cloud/products";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse(
        "$baseUrl?organization_id=${dotenv.env['ORGANIZATION_ID']}&Appid=${dotenv.env['APP_ID']}&Apikey=${dotenv.env['API_KEY']}",
      ),
    );

    // Added for debugging
    print(
        'Request URL: $baseUrl?organization_id=${dotenv.env['ORGANIZATION_ID']}&Appid=${dotenv.env['APP_ID']}&Apikey=${dotenv.env['API_KEY']}');

    print('Response status: ${response.statusCode}'); // Log the status code
    print('Response body: ${response.body}'); // Log the response body

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> items = data['items'];
      print('Parsed items: $items'); // Log the parsed items
      return items.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception(
          'Failed to load products: Server Error: Something went wrong on the API server.');
    }
  }
}
