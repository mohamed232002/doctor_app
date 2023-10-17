
import 'package:flutter/material.dart';

import '../components/info.dart';
class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  Icon(Icons.home_work_outlined),
        title:
        const Text('MyAccount',style: TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius:70 ,
                  backgroundImage:AssetImage('assets/images/me.jpeg'),
                ),
              ),
            ),
            const Text('Maria Loana Leonte',style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),),
            const Text('HCP Name',style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 80),
             child: Column(
               children: [
                 Info(icon: Icons.phone_android, text: '07434697256'),
                 Info(icon: Icons.lightbulb_circle_outlined, text: 'marialoana@gmail.com'),
                 Info(icon: Icons.shopping_bag, text: '55 nwal garden city'),
               ],
             ),
           ),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('Back',style: TextStyle(
              fontSize: 25
            ),))
          ],
        ),
      ),
    );
  }
}
