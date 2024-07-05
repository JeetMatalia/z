import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/model/requests/request_login_emailpass.dart';
import 'package:flutter_boiler_plate/model/responses/customer.dart';

import '../bloc/api_constants.dart';
import '../bloc/network_cubit.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  NetworkCubit? networkCubit;
  ModelCustomer? customerDetail;

  loginWithEmail(LoginWithEmailRequest request) async {
    http.Response? response;
    response = await networkCubit!.networkPostRequest(
        endpoint: APIConstants.customerLoginWithEmail,
        body: request.toJson(),
        isformdata: false,
        isLoader: true);
    print("Request Response : ${response!.body}");
    return response;
  }
}
