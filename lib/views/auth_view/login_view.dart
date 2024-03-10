import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:spin_to_win/views/auth_view/auth_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

var authController=Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Hey, Welcome",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: GetBuilder<AuthController>(
            init: AuthController(),
            builder: (authController) {
              return Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          const Icon(
                            Icons.person_2_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              controller: authController.nameController,
                              decoration: const InputDecoration(
                                hintText: 'Enter your name',
                                border: InputBorder.none,
                                // contentPadding: EdgeInsets.zero
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                         const  Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              controller:  authController.emailController,
                              decoration: const InputDecoration(
                                hintText: 'Enter you email',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                         const  Icon(
                            Icons.phone_android_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                         const SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              controller: authController.mobileNumberController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Enter you mobile number',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    //height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Padding(
                            padding: EdgeInsets.only(top: 12.0),
                            child: Icon(
                              Icons.info_outline,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              controller: authController.descriptionController,
                              maxLines: 10,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                hintText: 'Description',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          ),
        ),
      ),

      bottomSheet: BottomAppBar(
       color: Colors.purple[100],
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GetBuilder<AuthController>(
            init: AuthController(),
            builder: (authController) {
              return InkWell(
                onTap: (){
                  authController.authRequest(context);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black
                  ),
                  alignment: Alignment.center,
                  child: const Text("Save",style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
