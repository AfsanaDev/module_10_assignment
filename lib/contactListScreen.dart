import 'package:flutter/material.dart';

class Contactlistscreen extends StatefulWidget {
  const Contactlistscreen({super.key});

  @override
  State<Contactlistscreen> createState() => _ContactlistscreenState();
}

class _ContactlistscreenState extends State<Contactlistscreen> {
  List<Map<String, String>> contactList = [];  // Use Map for better structure
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  

  addContactList() {
    if (nameController.text.isNotEmpty && numberController.text.isNotEmpty) {
      setState(() {
        contactList.add({
          'name': nameController.text,
          'number': numberController.text,
        });
        nameController.clear();
        numberController.clear();
      });
    }
  }

  removeContactList(int index) {
    setState(() {
      contactList.removeAt(index);  // Fix: Use removeAt() instead of remove()
      
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contact List",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Enter Name',
                hintText: 'Enter Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.phone, // Added phone keyboard
              decoration: InputDecoration(
                labelText: 'Enter Number',
                hintText: 'Enter Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: addContactList,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text(
                  'Add Contact',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            //const SizedBox(height: 10),
            SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true, // Fix: Prevent infinite height issue
                itemCount: contactList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () => showCustomDialog(context,index),
                    child:  Card(
                    child: ListTile(
                      leading: Icon(Icons.person, color: Colors.blueAccent),
                      title: Text(contactList[index]['name'] ?? "", style: TextStyle(
                        //fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),),
                      subtitle: Text(contactList[index]['number'] ?? ""),
                      trailing: IconButton(
                        icon: const Icon(Icons.phone, color: Colors.blueAccent),
                        onPressed: (){},//=> removeContactList(index),
                      ),
                    ),
                  )
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

   void showCustomDialog (BuildContext context,int index) {
                  showDialog(context: context, builder: (context){   
               return AlertDialog(
                    title: Text("Conformation"),
                    content: Text("Are you sure for delete this contact?"),
                    //title: const Text("Are you sure to remove contact?"),
                    actions: [
                      TextButton(
                        child:Icon(Icons.signal_cellular_no_sim_outlined),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(onPressed: (){ removeContactList(index);},
                       child: Icon(Icons.delete_outlined))
                  
                  ],);});
                }
                

}       
