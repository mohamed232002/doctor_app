
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../blocks/doctor_cubit/doctor_cubit.dart';
import '../models/models.dart';
import 'Home_Screen.dart';

class RegesterScreen extends StatefulWidget {


  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}
 enum Gender{
  male,
  female
}
class _RegesterScreenState extends State<RegesterScreen> {
  final form_key= GlobalKey<FormState>();
  Gender? gender = Gender.male;

  bool check = true ;
  bool conCheck = true ;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var conPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit =DoctorCubit.get(context);
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: form_key,
          child: SafeArea(
            child: Column(
              children:  [
                SizedBox(height: 100,),
                Text('Create account!',style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),),
                Text('regester to get started.', style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),
               // SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(

                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Please Enter Name';
                      } if(value.length<4){
                        return 'The name must be at least 3 characters';
                      }
                      return null;
                    },
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ' Email Address',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Please Enter Phone';
                      }
                      return null;
                    },
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone',
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Please Enter Password';
                      }
                      if (value.length<7){
                        return 'The password must be at least 6 characters';
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Please Enter Password';
                      }
                      if (value != passwordController.text){
                        return 'please match password';
                      }
                      return null;
                    },
                    controller: conPasswordController,
                    obscureText: check,
                    keyboardType: TextInputType.visiblePassword,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ' confirm password',
                      suffixIcon: IconButton(onPressed: (){
                        conCheck =!conCheck;
                        setState(() {

                        });
                      }, icon: Icon(!conCheck?Icons.visibility:Icons.visibility_off)),
                      prefixIcon: Icon(Icons.lock),

                    ),
                  ),
                ),
                RadioListTile(
                    title: Text('Male'),
                    value: Gender.male , groupValue: gender, onChanged: (Gender? value){
                  gender=value;
                  setState(() {

                  });
                }),
                RadioListTile(
                    title: Text('Female'),
                    value: Gender.female, groupValue: gender, onChanged: (Gender? value){
                  gender= value ;
                  setState(() {

                  });
                }),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                    onPressed: (){
                   if (form_key.currentState!.validate()) {
                     cubit.RegsterPost(
                             () {
                           Alert(
                             context: context,
                             type: AlertType.error,
                             title: "Register Failed",
                             desc: "change email or phone",
                             buttons: [
                               DialogButton(
                                 child: Text(
                                   "OK",
                                   style: TextStyle(
                                       color: Colors.white, fontSize: 20),
                                 ),
                                 onPressed: () => Navigator.pop(context),
                                 width: 120,
                               )
                             ],
                           ).show();
                         },
                             () {
                           Alert(
                             context: context,
                             type: AlertType.success,
                             title: "Register Successful",
                             desc: "You have successfully Register",
                             buttons: [
                               DialogButton(
                                 child: Text(
                                   "OK",
                                   style: TextStyle(
                                       color: Colors.white, fontSize: 20),
                                 ),
                                 onPressed: () => Navigator.pop(context),
                                 width: 120,
                               )
                             ],
                           ).show().then((value) =>
                               Navigator.push(context, MaterialPageRoute(
                                   builder: (context) => const HomeScreen())));
                         },
                         RegesterModel(
                             email: emailController.text,
                             password: passwordController.text,
                             name: nameController.text,
                             confirmPassword: conPasswordController.text,
                             phoneNumber: phoneController.text,
                             gender: gender == Gender.male ? 0 : 1
                         ));
                   }
                   }, child: Text('Register')),
              ],
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
