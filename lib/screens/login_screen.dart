
import 'package:doctor_app/screens/regester_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../blocks/doctor_cubit/doctor_cubit.dart';
import '../models/models.dart';
import 'Home_Screen.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final form_key = GlobalKey<FormState>();

  bool check = true ;

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = DoctorCubit.get(context);
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: form_key,
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              const Text('Login',style:  TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),),
              const Text('Welcome back to the app',style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return 'Please Enter Email';
                    }
                    if (!RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' Email Address',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              const SizedBox(height: 10,)  ,
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                 validator: (value) {
                  if (value == null || value.isEmpty){
                  return 'Please Enter Password';
                  }
                  return null;
                  },
                  controller: passwordController,
                  obscureText: check,
                  keyboardType: TextInputType.visiblePassword,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'password',
                    suffixIcon: IconButton(onPressed: (){
                      check =!check;
                      setState(() {

                      });
                    }, icon: Icon(!check?Icons.visibility:Icons.visibility_off)),
                    prefixIcon: Icon(Icons.lock),

                  ),
                ),
              ),
              const SizedBox(height: 50,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 120.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        onPressed:(){
                          //print(emailController.text);
                          //print(passwordController.text);

                        if (form_key.currentState!.validate()){

                          cubit.loginPost(
                              (){
                                Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: "Login Failed",
                                  desc: "please check your email and password",
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "OK",
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      width: 120,
                                    )
                                  ],
                                ).show();
                              },
                            (){
                            Alert(
                              context: context,
                              type: AlertType.success,
                              title: "Login Successful",
                              desc: "You have successfully logged in.",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "OK",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  width: 120,
                                )
                              ],
                            ).show().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen())));
                          },
                          LoginModel(email: emailController.text,password: passwordController.text));
                        }
                        }, child: const Text('log in')),
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  RegesterScreen()));
                  }, child: const Text('Register')),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  },
);
  }
}
