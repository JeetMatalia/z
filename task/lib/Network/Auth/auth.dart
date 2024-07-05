import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:elementthree/Asset/string.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class Auth {

  static login({required String email, required String password, required BuildContext context}) async{
    var header = {"Content-Type": "multipart/form-data"};
    print(email);
    var body = {
      "email" : email,
      "password": password,
      "device_token": "A",
      "device_type": "A",
      "category_id": "A",
    };
    try{
      var responce = await  http.post(Uri.parse(AppString.loginEndpoint),body: json.encode(body),headers: header);
      if(responce.statusCode == 200){
      context.goNamed("home");
      }
      else{
        BotToast.showText(text: "${json.decode(responce.body)["error"]}");
      }
    }catch (e){
      BotToast.showText(text: "${e.toString()}");
    }
  }

  static register({required String email, required String password, required String firstName, required String lastName, required String confirmPassword, required BuildContext context})async{
    var header = {"Content-Type": "multipart/form-data"};
    print("=>> First Name ${firstName}");
    var body = {
      "email" : email ,
      "password": password,
      "first_name": firstName,
      "last_name": lastName,
      "password_confirmation": password,
      "device_token": "A",
      "device_type": "A",
      "category_id": "A",
    };

    // var body = <String,dynamic>{};
    // body["email"] = email ;
    // body["password"] = password;
    // body["device_token"] = "A";
    // body["device_type"] = "A";
    // body["category_id"] = "A";
    // body["first_name"] = firstName;
    // body["last_name"] = lastName;
    // body["password_confirmation"] = confirmPassword;
    try{
    var responce = await  http.post(Uri.parse(AppString.registerEndpoint),body: json.encode(body),headers: header);
    print(responce.body);

    if(responce.statusCode == 200){
      context.goNamed("home");
    }
    else{
     // print("=>>>> ${json.decode(responce.body)["error"]}");
      BotToast.showText(text: "${json.decode(responce.body)["error"]}");
    }
    }catch(e){
      BotToast.showText(text: "${e.toString()}");
    }

  }
}