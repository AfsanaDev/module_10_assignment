import 'package:flutter/material.dart';

class Addemployee extends StatelessWidget {
  const Addemployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Employe"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
               // border: OutlineInputBorder(),
                labelText: 'Name',
              ),
              keyboardType: TextInputType.name,
            ),
             TextFormField(
              decoration: const InputDecoration(
               // border: OutlineInputBorder(),
                labelText: 'Age',
              ),
              keyboardType: TextInputType.number,
            ),
             TextFormField(
              decoration: const InputDecoration(
               // border: OutlineInputBorder(),
                labelText: 'Salary',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){

            }, child: Text('Add Employee')),
          ],
        ),
      ),
    );
  }
}