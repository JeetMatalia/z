import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boiler_plate/bloc/network_cubit.dart';
import 'package:flutter_boiler_plate/bloc/server_status_codes.dart';
import 'package:flutter_boiler_plate/ui/screens/login/login_screen.dart';
import 'package:flutter_boiler_plate/user_preferences/user_preferences.dart';
import 'package:flutter_boiler_plate/utils/service_utilites.dart';
import 'package:http/http.dart' as http;

class NetworkUtils {
  handleResponse(http.Response response, BuildContext context) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    print('responseData is $responseData');
    if (response.statusCode == ServerStatusCodes.UNAUTHORISED ||
        response.statusCode == ServerStatusCodes.FORBIDDED) {
      ServiceUtils.showSuccessMsg(responseData["message"], context);
      UserPreferences.clearDetailsOnSignOut();
      Future(() {
        Navigator.pushNamedAndRemoveUntil(
            context, LoginScreen.id, (route) => false);
      });
      return null;
    } else if (response.statusCode == ServerStatusCodes.BAD_REQUEST) {
      ServiceUtils.showErrorMsg(responseData["message"], context);
      return null;
    }
    return response;
  }

  static showLoader(BuildContext context) {
    BlocProvider.of<NetworkCubit>(context).showLoader(context);
  }

  static hideLoader(BuildContext context) {
    BlocProvider.of<NetworkCubit>(context).hideLoader(context);
  }
}
