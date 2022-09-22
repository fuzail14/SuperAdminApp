// To parse this JSON data, do
//
//     final viewSubAdminModel = viewSubAdminModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';



class ViewSubAdminModel {
    ViewSubAdminModel({
        required this.id,
        required this.superadminid,
        required this.societyid,
        required this.subadminid,
        
        required this.firstname,
        required this.lastname,
        required this.cnic,
        required this.address,
        required this.mobileno,
        required this.password,
        required this.roleid,
        required this.rolename,
        required this.image,
    });

    int id;
    int superadminid;
    int societyid;
    int subadminid;
    
    String firstname;
    String lastname;
    String cnic;
    String address;
    String mobileno;
    String password;
    int roleid;
    String rolename;
    String image;


}
