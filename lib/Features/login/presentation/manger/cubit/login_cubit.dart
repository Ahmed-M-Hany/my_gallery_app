import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../../../core/utils/endpoints.dart';
import '../../../../home/presentation/views/home_screen.dart';
import '../../../data/login_data_model.dart';
import 'login_cubit_state.dart';
import 'package:http/http.dart'as http;
class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(LoginCubitInitial());
  late String token;
  bool isLogged=false;
  UserData? userData;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future login({required BuildContext context}) async {
    String email = emailController.text;
    String password = passwordController.text;
    email="lilla91@example.net";
    password="password";
    // if(formKey.currentState!.validate()) {
    //   formKey.currentState!.save();
    // } else {
    //   return;
    // }
    emit(LoginCubitLoading());
    try {
      http.Response response;
      response= await http.post(
        Uri.parse(EndPoints.baseUrl+EndPoints.loginEndpoint),
        body: {
          'email':email,
          'password':password,
        },
      );
      print("response: ${response.body}");
      var data = jsonDecode(response.body);
      if(response.statusCode>=200 && response.statusCode<300){
        emit(LoginCubitSuccess());
        if(context.mounted){
          goToHomePage(context);
        }
        userData=UserData.fromJson(data);
        if(userData!.token==null){
          throw Exception('Token is null');
        }
        token = userData!.token!;
        if (kDebugMode) {
          print(token);
        }


      }else if(response.statusCode==422){
        print(data);
        emit(LoginCubitFailure( err: data));


      }else{
        throw Exception(response.reasonPhrase.toString());
      }

    } on Exception catch (e) {
      emit(LoginCubitFailure(err: {
        'error':e.toString(),
      }));
    }
  }
  void goToHomePage(BuildContext context){
    Navigator.pushNamed(context, HomePage.id);
  }

}
