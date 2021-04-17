import 'dart:convert';
import 'dart:io';
import 'package:delivery_app_v0/Models/Profile.dart';
import 'package:delivery_app_v0/Models/User.dart';
import 'package:delivery_app_v0/Providers/LoginProvider.dart';
import 'package:delivery_app_v0/Screens/AppController.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../API/APIS.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:flutter/widgets.dart';
//
//




class ProfileProvider extends ChangeNotifier {
String vehicleval;
String countryval;
String stateval;

List<String> states=["Select a country first"];

String sex;

String val;

PickedFile selected;




Future<void> getUser(context,id) async{
    final prefs = await SharedPreferences.getInstance();
    //bool signed=await prefs.then((value) => value.getBool('logged')??false);

    //await prefs.setBool('logged', signed).then((bool success) {};
     
    
      
  String url=getUserApi+"$id/";
  //print(url);
 final userresponse=await http.get(getUserApi+"$id/");
  if (userresponse.statusCode == 200) {
      dynamic res=jsonDecode(userresponse.body);
      //print(res[0][0]);
      User user=User.fromJson(res[0][0]);
      Profile profile = Profile.fromJson(res[1]);
      user.profile=profile;
      String activeuser=jsonEncode(user);
      String activeprofile=jsonEncode(user.profile);
      String activeuserprofile=activeuser+"!"+activeprofile;
      print(activeuser+"!"+activeprofile);
      //print(user.isSuperuser);
       prefs.setString("logged", activeuserprofile).then((bool success) {
      //  print("logged");
      });
      
      
      //    prefs.setString("logged", "User").then((bool success) {
      //   print("logged");
      // });
      //prefs.
               // print("not admin");

        Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AppController(user: user),
      ),
      (route) => false,
    );  
    
      }
      notify();
  }



createprofile({context,age,city,phone,address,LoginProvider loginProvider}) async {
  
  
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
             String signed=await prefs.then((value) => value.getString('logged')??"");
               SharedPreferences pref =await SharedPreferences.getInstance();

    Map<String,dynamic> usermap=jsonDecode(signed);
print(age);
print(address);
print(sex);
print(countryval);
print(stateval);
print(vehicleval);
print(phone);
File file;
print(city);
if(selected!=null){
  file = File(selected.path);
}

 Map<String,String> prof={ "id_user":usermap["id"].toString(),
      "age":age,
      "sex":sex,
      //"id_user":"23",
      "phone":phone,
      "country":countryval,
      "governorate":stateval,
      "city":city,
      "address":address,
      "vehicle":vehicleval,
      "state":"free"};

  var request = http.MultipartRequest('POST', Uri.parse(profile));
  if(file!=null){
  request.files.add(
    await http.MultipartFile.fromPath(
      'photo',file.path
      
    )
  );}
  request.fields.addAll(prof);
  var res = await request.send();
  if(res.statusCode==201){
    pref.setBool("new", false).then((bool success) async {
      getUser(context, usermap["id"]);
      
     // LoginProvider loginProvider;
// Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(
//         builder: (BuildContext context) => AppController(),
//       ),
//       (route) => false,
//     );   
 } );
    print("added");
    
  }
  else{
    print("not added");
    print(res.statusCode);
  }
  
}





Future<void> createProfile({context,age,city,phone,address}) async{
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
             String signed=await prefs.then((value) => value.getString('logged')??"");
    Map<String,dynamic> usermap=jsonDecode(signed);
print(age);
print(address);

print(phone);

print(city);

 File file = File(selected.path);

final profileresponse = await http.post(
    profile,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String,dynamic>{
      "id_user":usermap["id"],
      "age":age,
      "sex":sex,
      "phone":phone,
      "country":countryval,
      "governorate":stateval,
      "city":city,
      "address":address,
      "photo":file,
      "vehicle":vehicleval,
      "state":"free"
    })
  );
    if (profileresponse.statusCode == 201) {
      print("profile created");
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => AppController(),), (route) => false);
    }
    else if (profileresponse.statusCode == 400) {
      print(profileresponse.body);
    }


}


Future<void> imageselect()async{
  ImagePicker picker=ImagePicker();
 selected=await picker.getImage(source: ImageSource.gallery);
 print("this is:"+selected.path);
 notify();

}

chooseSex(value){
  sex=value;
  notify();
}

whichStates(){
if(countryval==null){
  states=["Select a country first"];
}
else if(countryval=="Tunisia"){
  states=["Tunis", "Ariana", "Ben Arous", "Mannouba", "Bizerte", "Nabeul", "Beja", "Jendouba", "Zaghouan", "Siliana", "Le Kef", "Sousse", "Monastir", "Mahdia", "Kasserine", "Sidi Bouzid", "Kairouan", "Gafsa", "Sfax", "Gabès", "Medenine", "Tozeur", "Kebili", "Ttataouine"];
}
else if(countryval=="China"){
  states=["Anhui", "Fujian", "Guangdong", "Guizhou", "Hainan", "Hebei", "Henan", "Hubei", "Hunan", "Gansu", "Jiangxi", "Jiangsu", "Qinghai", "Shaanxi", "Shandong", "Shanxi", "Sichuan", "Yunnan", "Zhejiang", "Manchuria", "Heilongjiang", "Jilin", "Liaoning"];
}
else if(countryval=="Italy"){
  states=["Abruzzo",
"Basilicata",
"Calabria",
"Campania",
"Emilia-Romagna",
"Friuli-Venezia Giulia",
"Latium",
"Liguria",
"Lombardia",
"Marche",
"Molise",
"Piemonte",
"Puglia",
"Sardegna",
"Sicialia",
"Toscana",
"Trentino-Alto Adige","Umbria","Valle d'Aosta","Veneto"
];
}
notify();
}

changeState(value){
    stateval=value;
    notify();
  }
  changevehicle(value){
    vehicleval=value;
    notify();
  }
  changeCountry(value){
    countryval=value;
    notify();
  }


    void notify(){
    try{
      notifyListeners();
    }
    catch(e){
      print(e);
    }
  }
}