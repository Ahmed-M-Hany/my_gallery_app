import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../../../core/utils/endpoints.dart';
import '../../../../home/presentation/views/home_screen.dart';
import '../../../data/models/images_model.dart';
import 'home_cubit_state.dart';
import 'package:http/http.dart'as http;
class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());

  List<String?> images = [
    "https://avatars.githubusercontent.com/u/101389444?v=4",
  ];

  //get images from api
  Future<void> getImages(String token) async {
    emit(HomeCubitLoading());
    try {
      final response = await http.get(
          Uri.parse(EndPoints.baseUrl+EndPoints.getImages,),
        headers:{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
            'Authorization': 'Bearer $token',
        }
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        ImagesDataModel imagesDataModel = ImagesDataModel.fromJson(data);
        images.addAll( imagesDataModel.data!.images!);
        emit(HomeCubitSuccess());
      } else {
        emit(HomeCubitFailure(err: {'message': 'Failed to load images'}));
      }
    } catch (e) {
      emit(HomeCubitFailure(err: {'message': 'Failed to load images'}));
    }
  }


}
