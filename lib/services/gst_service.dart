import 'dart:convert';
import 'dart:io';

import 'package:gstin_app/models/gst_model.dart';
import 'package:gstin_app/services/error_handling.dart';
import 'package:http/http.dart' as http;

class GstService {
  Future<GstModel> getGstDetails(String id) async {
    String uri = 'https://gstin.free.beeceptor.com/$id';
    var url = Uri.parse(uri);

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        Map jsonData = json.decode(response.body);
        var gstDetail = GstModel.fromJson(jsonData);
        // print(gstDetail.address1);
        return gstDetail;
      } else {
        throw Exception("Unable to fetch details");
      }
    } on SocketException {
      throw Failure('No Internet Connection');
    } on HttpException {
      throw Failure('Couldn\'t find details');
    } on FormatException {
      throw Failure('Bad response format');
    }
    // print(response.body);
  }

  Future<GstReturnStatus> getReturnDetails(String id) async {
    String uri = 'https://gstin.free.beeceptor.com/status/$id';
    var url = Uri.parse(uri);

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        Map jsonData = json.decode(response.body);
        var gstReturnStatus = GstReturnStatus.fromJson(jsonData);
        // print(gstDetail.address1);
        return gstReturnStatus;
      } else {
        throw Failure("Unable to fetch details");
      }
    } on SocketException {
      throw Failure('No Internet Connection');
    } on HttpException {
      throw Failure('Couldn\'t find details');
    } on FormatException {
      throw Failure('Bad response format');
    }
    // print(response.body);
  }
}





// error, loading state, data : build interface 