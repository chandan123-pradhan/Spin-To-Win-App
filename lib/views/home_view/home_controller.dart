import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:spin_to_win/constant/api_endpoints.dart';
import 'package:spin_to_win/constant/params_constant.dart';
import 'package:spin_to_win/constant/sharedpref_constant.dart';
import 'package:spin_to_win/helpers/helper_methods.dart';
import 'package:spin_to_win/models/user_model.dart';
import 'package:spin_to_win/services/api_services.dart';
import 'package:spin_to_win/views/home_view/home_view.dart';

class HomeController extends GetxController{
  UserModel? user;
  Future<void>getUserData(context)async{
    try{
      String userId=await HelperMethods.getUserId(key: SharedPrefConstant.ID);
      ApiServices().getApiRequest(url: ApiEndPoints.GetEmployeeData+'/${userId}').then((value){
        debugger();
        if(value!.statusCode=='200'){
          user=UserModel.fromJson(value.data);
        }else{
           HelperMethods.showSnackBar(context, value.message);
        }
      });
    }catch(e){
      print(e);
    }
  }
  
}