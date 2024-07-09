import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tombu_shopping_app/models/product_model.dart';
import 'package:tombu_shopping_app/ui/common/constants.dart';

class ApiService {
  final String baseUrl = "https://api.timbu.cloud/products";

  Future<List<Product>> fetchProducts(int page, int size) async {
    final response = await http.get(
      Uri.parse(
        "$baseUrl?organization_id=$kOrganizationId&Appid=$kAppId&Apikey=$kApiKey&page=$page&size=$size",
      ),
    );

    print('Response status: ${response.statusCode}'); // Log the status code
    print('Response body: ${response.body}'); // Log the response body

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> items = data['items'];
      return items.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products: Server Error: Something went wrong on the API server.');
    }
  }
}