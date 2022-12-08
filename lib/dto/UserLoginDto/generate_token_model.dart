// To parse this JSON data, do
//
//     final generateTokenModel = generateTokenModelFromJson(jsonString);

import 'dart:convert';

GenerateTokenModel generateTokenModelFromJson(String str) => GenerateTokenModel.fromJson(json.decode(str));

String generateTokenModelToJson(GenerateTokenModel data) => json.encode(data.toJson());

class GenerateTokenModel {
    GenerateTokenModel({
        this.success,
        this.message,
        this.token,
    });

    bool? success;
    String? message;
    String? token;

    factory GenerateTokenModel.fromJson(Map<String, dynamic> json) => GenerateTokenModel(
        success: json["success"],
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "token": token,
    };
}
