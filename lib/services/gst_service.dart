import 'dart:convert';

import 'package:gstin_app/models/gst_model.dart';
import 'package:http/http.dart' as http;

Future<GstModel?> getGstDetails(String id) async {
  String uri = 'https://gstin.free.beeceptor.com/$id';
  var url = Uri.parse(uri);

  var response = await http.get(url);
  // print(response.body);

  if (response.statusCode == 200) {
    Map jsonData = json.decode(response.body);
    var gstDetail = GstModel.fromJson(jsonData);
    // print(gstDetail.address1);
    return gstDetail;
  } else {
    throw Exception("Unable to fetch details");
  }
}

Future<GstReturnStatus> getReturnDetails(String id) async {
  String uri = 'https://gstin.free.beeceptor.com/status/$id';
  var url = Uri.parse(uri);

  var response = await http.get(url);
  // print(response.body);

  if (response.statusCode == 200) {
    Map jsonData = json.decode(response.body);
    var gstReturnStatus = GstReturnStatus.fromJson(jsonData);
    // print(gstDetail.address1);
    return gstReturnStatus;
  } else {
    throw Exception("Unable to fetch details");
  }
}
