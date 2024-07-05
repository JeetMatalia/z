import 'package:bot_toast/bot_toast.dart';
import 'package:elementthree/Error/toast.dart';
import 'package:elementthree/Network/Auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginFormKey = GlobalKey<FormState>();
  final _registerFormKey = GlobalKey<FormState>();
  bool isLoginSelected = true;
  // change on gestrure deteactor add logic
  bool isCustomerSelected = true;
  bool isPasswordVisible = false;
  bool isTearmAgree = false;
  // change on gesture deteactor add logic

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rpassword = TextEditingController();
  // TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  color: Colors.red,
                  child: Image.asset("asset/image/ic_login_signup_hader.png",
                      fit: BoxFit.fitHeight)),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            isLoginSelected = true;
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey,
                                    width: isLoginSelected ? 3 : 0),
                              ),
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            isLoginSelected = false;
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey,
                                    width: isLoginSelected ? 0 : 3),
                              ),
                            ),
                            child: const Text(
                              "SignUp",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 20,
            // padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.grey,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    isCustomerSelected = true;
                    setState(() {});
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 10,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color:
                          isCustomerSelected ? Colors.lightBlue : Colors.grey,
                    ),
                    child: const Center(
                        child: Text(
                      "Customer",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
                // SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    isCustomerSelected = false;
                    setState(() {});
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 10,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color:
                          isCustomerSelected ? Colors.grey : Colors.lightBlue,
                    ),
                    child: const Center(
                        child: Text(
                      "Instructor",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: isLoginSelected
                  ? displayLoginField()
                  : displayRegisterField(),
            ),
          ),
        ],
      ),
    );
  }

  Widget customTextformfiled(
      {required TextEditingController controller,
      required String text,
      required String image,
      isPassword = false}) {
    return TextFormField(
      controller: controller,
      validator: (value){
        if(value == null || value.isEmpty){
          return "This Filed is Requried";
        }
        return null;
      },
      obscureText: isPassword
          ? isPasswordVisible
              ? false
              : true
          : false,
      decoration: InputDecoration(
        prefixIcon: Container(
          child: Image.asset(
            image,
            scale: 3,
            height: 10,
            width: 10,
          ),
        ),
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: () {
                  isPasswordVisible = !isPasswordVisible;
                  setState(() {});
                },
                child: Container(
                  child: isPasswordVisible
                      ? Image.asset(
                          "asset/image/androidAuth/UnHide.png",
                          scale: 3,
                          height: 10,
                          width: 10,
                        )
                      : Image.asset(
                          "asset/image/androidAuth/Hide.png",
                          scale: 3,
                          height: 10,
                          width: 10,
                        ),
                ),
              )
            : const SizedBox(),
        hintText: text,
        hintStyle: const TextStyle(color: Colors.lightBlue),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        // Replace with your error message or remove it
      ),
    );
  }

  Widget displayLoginField() {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: customTextformfiled(
                controller: email,
                text: "Email*",
                image: "asset/image/androidAuth/Mail.png"),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: customTextformfiled(
                controller: password,
                image: "asset/image/androidAuth/Password.png",
                text: "Password*",
                isPassword: true),
          ),
          // const SizedBox(height: 20.0),
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot Password",
                  style: TextStyle(color: Colors.lightBlue),
                )
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: (){
              if(!_loginFormKey.currentState!.validate()){
                BotToast.showText(text: "Please fill All details");
              }
              else{
                Auth.login(email:email.text,password:password.text,context:context);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blue,
              ),
              child: const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget displayRegisterField() {
    return Form(
      key: _registerFormKey,
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: customTextformfiled(
                controller: firstName,
                text: "FirstName*",
                image: "asset/image/iosAuth/FirsName.png"),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: customTextformfiled(
              controller: lastName,
              image: "asset/image/iosAuth/FirsName.png",
              text: "lastName*",
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: customTextformfiled(
                controller: email,
                text: "Email*",
                image: "asset/image/androidAuth/Mail.png"),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: customTextformfiled(
                controller: rpassword,
                image: "asset/image/androidAuth/Password.png",
                text: "Password*",
                isPassword: true),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: customTextformfiled(
                controller: confirmPassword,
                image: "asset/image/androidAuth/Password.png",
                text: "ConfirmPassword*",
                isPassword: true),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: () {
                isTearmAgree = !isTearmAgree;
                setState(() {});
              },
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image(
                        image: AssetImage(isTearmAgree
                            ? "asset/image/iosAuth/selected.png"
                            : "asset/image/iosAuth/Unselected.png"),
                        height: 20,
                        width: 20),
                  ),
                  // Image.asset(""),
                  const Flexible(
                    child: Text(
                      "I hereby accept the Terms and Condition and have read the Privacy Policy",
                      style: TextStyle(
                          color: Colors.lightBlue,
                          overflow: TextOverflow.visible),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: (){
              // print("register taped");
              if(!_registerFormKey.currentState!.validate()){
                BotToast.showText(text: "Please fill All details");

              }
              else{
                // _registerFormKey.currentState!.save();
                // print("++");
                // print("=> ${rpassword}  + => ${confirmPassword.text}");
                if(rpassword.text == confirmPassword.text){
                  if(isTearmAgree){

                    Auth.register(email:email.text,password:rpassword.text,firstName:firstName.text,lastName:lastName.text,confirmPassword:confirmPassword.text,context:context);
                  }
                  else{
                    BotToast.showText(text: "Please Agree to tearm and Contition");
                  }
                }else{
                  BotToast.showText(text: "Password Missmatched");
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blue,
              ),
              child: const Center(
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
