import 'package:flutter/material.dart';

class ListOfDoctor extends StatelessWidget {
 String name ;
 String time ;

 ListOfDoctor({required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        ListTile(
          title: Text(name,style: TextStyle(
              fontSize: 20
          ),),
          subtitle: Row(
            children: [
              Icon(Icons.alarm),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(time,style: TextStyle(fontSize: 18),),
              )
            ],
          ),
        ),
        Divider(thickness: 3,)
      ],
    );
  }
}
