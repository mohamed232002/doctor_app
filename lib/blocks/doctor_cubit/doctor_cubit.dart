import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';
import '../../service/dio_helper.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {

  static DoctorCubit get (context) => BlocProvider.of(context);

  DoctorCubit() : super(DoctorInitial());

  void loginPost(void Function()? funFeiled,void Function()? funSucssed,LoginModel loginModel){
    DioHelper.dio.post('https://vcare.integration25.com/api/auth/login',
        data:loginModel.toJeson(),
        options: Options(headers: {'Accept': 'application/json'}) ).then((value) {
          var data = jsonDecode(value.data);
         print(data);
         print(data['code']);
         if(data['code'] ==200 ){
           funSucssed!();
         }else{
           funFeiled!();
         }

    });

  }

  void RegsterPost(void Function()? funFeiled,void Function()? funSucssed,RegesterModel regesterModel){
    DioHelper.dio.post('https://vcare.integration25.com/api/auth/register',
        data:regesterModel.toJeson(),
        options: Options(headers: {'Accept': 'application/json'}) ).then((value) {
      var data = jsonDecode(value.data);
      print(data);
      print(data['code']);
      if(data['code'] ==200 ){

        funSucssed!();
      }else{
        funFeiled!();
      }


    });

  }

}
