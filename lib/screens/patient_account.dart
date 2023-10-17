
import 'package:flutter/material.dart';

import '../components/info.dart';

class PatientAccount extends StatelessWidget {
  const PatientAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  const Icon(Icons.home_work_outlined),
        actions: [const Icon(Icons.menu)],
        title: const Text('PatientAccount',style: TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: const AssetImage('assets/images/me.jpeg'),
                  radius: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      const Text('Dumitrn Simona',style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),),
                      ElevatedButton(onPressed: (){}, child: const Text('MEDICIL HISTORY')),
                    ],
                  ),
                ),
              ],
            ),
          Padding(
            padding: const EdgeInsets.only(top: 80,bottom: 60),
            child: Column(
              children: [
                Info(icon: Icons.alarm, text: '08:00 - 09:30',fontSize: 20,),
                Info(icon: Icons.phone_android, text: '552771377',fontSize: 20,fontColor: Colors.blue),
                Info(icon: Icons.location_on, text: ' 55 Nwal Garden City',fontSize: 20,),
                Info(icon: Icons.description, text: 'medical tests are performed\nsiufgwr8vgbiper ',fontSize: 20,fontColor: Colors.blue),
              ],
            ),
          ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 45,
              runSpacing: 30,
              children: [
                SizedBox(
                  height: 40,
                    width: 120,
                    child: ElevatedButton(onPressed: (){}, child: const Text('START\nPROCEDURES',))),
                const SizedBox(
                    height: 40,
                    width: 120,
                    child: const ElevatedButton(onPressed: null, child: Text('EDIT'))),
                SizedBox(
                  height: 40,
                  width: 120,
                  child: ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: const Text('BACK')),
                ),
                SizedBox(
                    height: 40,
                    width: 120,
                    child: ElevatedButton(onPressed: (){}, child: const Text('PATIENT\nMIAAING'))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
