import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_solution_challenge/nfcSharing.dart';
class MedicalIdPage extends StatefulWidget {
  const MedicalIdPage({super.key});

  @override
  State<MedicalIdPage> createState() => _MedicalIdPageState();
}

class _MedicalIdPageState extends State<MedicalIdPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
centerTitle: true,
        title: Text('Medical ID',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          
          
          //Profile
          SizedBox(
            height: height*.1,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage:AssetImage("assets/img.png"),
              ),
              title: Text("Krish Aggarwal",style: TextStyle(color: Colors.black,fontSize: 18),),
              subtitle: Text("Male,18 years,Blood Group: B+",style: TextStyle(color: Colors.grey,fontSize: 15),),
            ),
          ),
          
          
          
          
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Medical Conditions',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(height: height*.01),
                Text("None",style: TextStyle(fontSize: 17),),
                SizedBox(height: height*.02,),
                Text('Allergies',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(height: height*.01),
                Text("None",style: TextStyle(fontSize: 17),),
                SizedBox(height: height*.02,),
                Text('Medications',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(height: height*.01),
                Text("None",style: TextStyle(fontSize: 17),),
                SizedBox(height: height*.02,),
                Text('Emergency contacts',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(height: height*.02),
              ],
            ),
          ),
          SizedBox(
            height: height*.1,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/img_3.png"),
              ),
              title: Text("Dr.Raj Grover",style: TextStyle(color: Colors.black,fontSize: 18),),
              subtitle: Text("Cardiologist",style: TextStyle(color: Colors.grey,fontSize: 15),),
              trailing: Icon(Icons.phone_outlined,color: Colors.black,),
            ),
          ),
          SizedBox(
            height: height*.1,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/img_4.png"),
              ),
              title: Text("Dr.Mitali Sharma",style: TextStyle(color: Colors.black,fontSize: 18),),
              subtitle: Text("Cardiologist",style: TextStyle(color: Colors.grey,fontSize: 15),),
              trailing: Icon(Icons.phone_outlined,color: Colors.black,),
            ),
          ),
         Container(
           padding: EdgeInsets.symmetric(horizontal: 20),
           alignment: Alignment.centerLeft,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text('Share medical id',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
               SizedBox(height: height*.02),
               TextButton(onPressed: (){Get.to(NFCSharingPage());},
                   child: Text("NFC",style: TextStyle(color: Colors.black,fontSize: 17),)),
               SizedBox(height: height*.02),
               Text("QR Code",style: TextStyle(color: Colors.black,fontSize: 17),
               )
             ],
           ),
         )
        ],
      ),
    );
  }
}
