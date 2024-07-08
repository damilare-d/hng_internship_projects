
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tombu_shopping_app/models/product_model.dart';

class ApiService {
  final String apiKey;
  final String appId;
  final String organizationId;

  ApiService(
      {required this.apiKey,
      required this.appId,
      required this.organizationId});

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse(
        "https://api.timbu.cloud/products?organization_id=4f0a4e3def204d408ed7086ac594092e&reverse_sort=false&page=1&size=10&Appid=OH35TILK1CDNBBX&Apikey=fdab2dbd5c3142078d6833392bfa666920240707160136587933",
      ),
    );



    print('Response status: ${response.statusCode}'); // Log the status code
    print('Response body: ${response.body}'); // Log the response body


    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> items = data['items'];
      return items.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
