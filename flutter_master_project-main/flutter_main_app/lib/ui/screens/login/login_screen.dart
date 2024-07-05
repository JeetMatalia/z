import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boiler_plate/bloc/network_cubit.dart';
import 'package:flutter_boiler_plate/l10n/localization.dart';
import 'package:flutter_boiler_plate/model/requests/request_login_emailpass.dart';
import 'package:flutter_boiler_plate/model/responses/response_login.dart';
import 'package:flutter_boiler_plate/resources/color_manager.dart';
import 'package:flutter_boiler_plate/resources/resources.dart';
import 'package:flutter_boiler_plate/ui/screens/home/home_screen.dart';
import 'package:flutter_boiler_plate/user_preferences/user_preferences.dart';
import 'package:flutter_boiler_plate/utils/network_utilities.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../controller/auth_provider.dart';
import '../../../model/requests/device_info.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthProvider counterProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    counterProvider = Provider.of<AuthProvider>(context);
    counterProvider.networkCubit ??= BlocProvider.of<NetworkCubit>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: ColorManager.primary,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () async {
                    await submitLoginRequest(context);
                  },
                  child: Text(AppLocalizations.of(context)!.login,
                      style: getRegularStyle(
                          color: ColorManager.white, fontSize: 16.sp)),
                ),
                BlocConsumer<NetworkCubit, NetworkState>(
                    listener: (context, state) async {
                  if (state is ErrorState) {
                    BlocProvider.of<NetworkCubit>(context).showApiErrorDialog(
                        context, state.errorBody.message!, "Error", () {});
                  }
                }, builder: (context, state) {
                  return const SizedBox();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> submitLoginRequest(BuildContext context) async {
    DeviceInfo details = DeviceInfo(
        deviceId: "1cwceqwferwh5w4",
        deviceToken: "APA91bFe1JzUe6fbm9UhjtsS",
        osType: "android",
        osVersion: "10.0.0",
        appVersion: "1.1.1",
        make: "Realme",
        model: "7i",
        ipAddress: "1.1.1.1",
        customerId: "",
        customerEmail: "");

    BlocProvider.of<NetworkCubit>(context).showLoader(context);
    var response = await counterProvider.loginWithEmail(LoginWithEmailRequest(
        email: "test888@yopmail.com",
        password: "Zignuts@123",
        deviceInfo: details));
    BlocProvider.of<NetworkCubit>(context).hideLoader(context);
    NetworkUtils().handleResponse(response, context);
    if (response != null) {
      var useDetail = LoginResponse.fromJson(json.decode(response.body));
      UserPreferences.saveLoginUserInfo(useDetail.data!);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }
}
