
import 'package:doctor_app/screens/patient_account.dart';
import 'package:flutter/material.dart';

import '../components/list_of_doctor.dart';
import 'my_account.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home_work_outlined),
        title: const Text('Appointment',style: TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.menu))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Text('Wednesday , 22 May 2019',style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            const SizedBox(height: 20),
            ListOfDoctor(name: 'Lulian Ruga', time: '10:50'),
            ListOfDoctor(name: 'Victoria Oiarl', time: '13:00'),
            ListOfDoctor(name: 'Diana Sfefan', time: '15:20'),
            ListOfDoctor(name: 'Gheorge Boba', time: '16:00'),
            ListOfDoctor(name: 'Alexandru Sandu', time: '16:40'),
            ListOfDoctor(name: 'Dumitru Simona', time: '08:00'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyAccount()));
              }, child: const Text('My Account')),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const PatientAccount()));
                }, child: const Text('Patient Account'))
            ],),
          ],
        ),
      ),
    );
  }
}
