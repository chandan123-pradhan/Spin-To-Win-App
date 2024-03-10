import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:spin_to_win/constant/api_endpoints.dart';
import 'package:spin_to_win/constant/params_constant.dart';
import 'package:spin_to_win/helpers/helper_methods.dart';
import 'package:spin_to_win/services/api_services.dart';
import 'package:spin_to_win/views/home_view/home_controller.dart';
import 'package:spin_to_win/views/home_view/home_view.dart';

class AuthController extends GetxController{
  bool isLoading=false;
  TextEditingController nameController=new TextEditingController();
  TextEditingController emailController=new TextEditingController();
  TextEditingController mobileNumberController= new TextEditingController();
  TextEditingController descriptionController= new TextEditingController();


  void authRequest(context){
    Map<String,dynamic> body={
      ParamsConstant.Name :nameController.text,
      ParamsConstant.Email :emailController.text,
      ParamsConstant.MobileNumber :mobileNumberController.text,
      ParamsConstant.Description:descriptionController.text,
    };
    ApiServices().postRequest(url: ApiEndPoints.AuthUrl, params: body).then((value) {
      HelperMethods.showSnackBar(context, value!.message);
      if(value.statusCode=='200'){
        HelperMethods.saveIdCache(id: value.data['_id']);
        HomeController().getUserData(context).then((value) {
           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
          return HomePage();
        }), (route) => false);
        });
       
      }
    });

  }
}