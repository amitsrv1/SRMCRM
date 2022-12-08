// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

import 'dart:convert';

UserLoginModel userLoginModelFromJson(String str) => UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
    UserLoginModel({
        this.status,
        this.message,
        this.data,
    });

    int? status;
    String? message;
    Data? data;

    factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.status,
        this.userImage,
        this.appLanguage,
        this.appUser,
        this.tvUser,
        this.workingStatus,
        this.id,
        this.firstName,
        this.lastName,
        this.username,
        this.modules,
        this.mobile,
        this.privilage,
        this.branch,
        this.password,
        this.userDob,
        this.userJoiningDate,
        this.userResigningDate,
        this.userDesig,
        this.workingFrm,
        this.workingTo,
        this.userId,
        this.machineId,
        this.swipeCard,
        this.mob2,
        this.date,
        this.time,
        this.userIp,
        this.createdBy,
        this.socialMedia,
        this.bankDetails,
        this.leaveDetails,
        this.salaryDetails,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.address,
        this.bloodGp,
        this.email,
        this.email2,
        this.experience,
        this.landNo,
        this.maritalStatus,
        this.primaryStaff,
        this.quali,
        this.secondaryStaff,
        this.sex,
        this.upDate,
        this.upTime,
        this.updatedBy,
        this.userDocuments,
        this.tvVersion,
        this.allowAssign,
        this.token,
    });

    int? status;
    String? userImage;
    int? appLanguage;
    int? appUser;
    int? tvUser;
    String? workingStatus;
    String? id;
    String? firstName;
    String? lastName;
    String? username;
    Modules? modules;
    String? mobile;
    String? privilage;
    String? branch;
    String? password;
    DateTime? userDob;
    DateTime? userJoiningDate;
    String? userResigningDate;
    String? userDesig;
    String? workingFrm;
    String? workingTo;
    String? userId;
    String? machineId;
    String? swipeCard;
    String? mob2;
    DateTime? date;
    String? time;
    String? userIp;
    String? createdBy;
    List<dynamic>? socialMedia;
    List<dynamic>? bankDetails;
    List<dynamic>? leaveDetails;
    List<dynamic>? salaryDetails;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? address;
    String? bloodGp;
    String? email;
    String? email2;
    dynamic experience;
    dynamic landNo;
    String? maritalStatus;
    String? primaryStaff;
    String? quali;
    String? secondaryStaff;
    String? sex;
    DateTime? upDate;
    String? upTime;
    String? updatedBy;
    dynamic userDocuments;
    dynamic tvVersion;
    int? allowAssign;
    String? token;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        userImage: json["user_image"],
        appLanguage: json["app_language"],
        appUser: json["app_user"],
        tvUser: json["tv_user"],
        workingStatus: json["working_status"],
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        username: json["username"],
        modules: Modules.fromJson(json["modules"]),
        mobile: json["mobile"],
        privilage: json["privilage"],
        branch: json["branch"],
        password: json["password"],
        userDob: DateTime.parse(json["user_dob"]),
        userJoiningDate: DateTime.parse(json["user_joining_date"]),
        userResigningDate: json["user_resigning_date"],
        userDesig: json["user_desig"],
        workingFrm: json["working_frm"],
        workingTo: json["working_to"],
        userId: json["userId"],
        machineId: json["machine_id"],
        swipeCard: json["swipe_card"],
        mob2: json["mob_2"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        userIp: json["user_ip"],
        createdBy: json["created_by"],
        socialMedia: List<dynamic>.from(json["social_media"].map((x) => x)),
        bankDetails: List<dynamic>.from(json["bank_details"].map((x) => x)),
        leaveDetails: List<dynamic>.from(json["leave_details"].map((x) => x)),
        salaryDetails: List<dynamic>.from(json["salary_details"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        address: json["address"],
        bloodGp: json["blood_gp"],
        email: json["email"],
        email2: json["email_2"],
        experience: json["experience"],
        landNo: json["land_no"],
        maritalStatus: json["marital_status"],
        primaryStaff: json["primary_staff"],
        quali: json["quali"],
        secondaryStaff: json["secondary_staff"],
        sex: json["sex"],
        upDate: DateTime.parse(json["up_date"]),
        upTime: json["up_time"],
        updatedBy: json["updated_by"],
        userDocuments: json["user_documents"],
        tvVersion: json["tv_version"],
        allowAssign: json["allow_assign"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "user_image": userImage,
        "app_language": appLanguage,
        "app_user": appUser,
        "tv_user": tvUser,
        "working_status": workingStatus,
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "modules": modules!.toJson(),
        "mobile": mobile,
        "privilage": privilage,
        "branch": branch,
        "password": password,
        "user_dob": "${userDob?.year.toString().padLeft(4, '0')}-${userDob?.month.toString().padLeft(2, '0')}-${userDob?.day.toString().padLeft(2, '0')}",
        "user_joining_date": "${userJoiningDate?.year.toString().padLeft(4, '0')}-${userJoiningDate?.month.toString().padLeft(2, '0')}-${userJoiningDate?.day.toString().padLeft(2, '0')}",
        "user_resigning_date": userResigningDate,
        "user_desig": userDesig,
        "working_frm": workingFrm,
        "working_to": workingTo,
        "userId": userId,
        "machine_id": machineId,
        "swipe_card": swipeCard,
        "mob_2": mob2,
        "date": "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "time": time,
        "user_ip": userIp,
        "created_by": createdBy,
        "social_media": List<dynamic>.from(socialMedia!.map((x) => x)),
        "bank_details": List<dynamic>.from(bankDetails!.map((x) => x)),
        "leave_details": List<dynamic>.from(leaveDetails!.map((x) => x)),
        "salary_details": List<dynamic>.from(salaryDetails!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "address": address,
        "blood_gp": bloodGp,
        "email": email,
        "email_2": email2,
        "experience": experience,
        "land_no": landNo,
        "marital_status": maritalStatus,
        "primary_staff": primaryStaff,
        "quali": quali,
        "secondary_staff": secondaryStaff,
        "sex": sex,
        "up_date": "${upDate?.year.toString().padLeft(4, '0')}-${upDate?.month.toString().padLeft(2, '0')}-${upDate?.day.toString().padLeft(2, '0')}",
        "up_time": upTime,
        "updated_by": updatedBy,
        "user_documents": userDocuments,
        "tv_version": tvVersion,
        "allow_assign": allowAssign,
        "token": token,
    };
}

class Modules {
    Modules({
        this.id,
        this.moduleName,
        this.redirectUrl,
    });

    String? id;
    String? moduleName;
    String? redirectUrl;

    factory Modules.fromJson(Map<String, dynamic> json) => Modules(
        id: json["_id"],
        moduleName: json["moduleName"],
        redirectUrl: json["redirect_url"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "moduleName": moduleName,
        "redirect_url": redirectUrl,
    };
}
