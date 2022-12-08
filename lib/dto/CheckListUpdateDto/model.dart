// To parse this JSON data, do
//
//     final updateCheckListModel = updateCheckListModelFromJson(jsonString);

import 'dart:convert';

UpdateCheckListModel updateCheckListModelFromJson(String str) => UpdateCheckListModel.fromJson(json.decode(str));

String updateCheckListModelToJson(UpdateCheckListModel data) => json.encode(data.toJson());

class UpdateCheckListModel {
    UpdateCheckListModel({
        this.status,
        this.data,
    });

    int? status;
    Data? data;

    factory UpdateCheckListModel.fromJson(Map<String, dynamic> json) => UpdateCheckListModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.n,
        this.electionId,
        this.opTime,
        this.nModified,
        this.ok,
        this.clusterTime,
        this.operationTime,
    });

    int? n;
    String? electionId;
    OpTime? opTime;
    int? nModified;
    int? ok;
    ClusterTime? clusterTime;
    String? operationTime;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        n: json["n"],
        electionId: json["electionId"],
        opTime: OpTime.fromJson(json["opTime"]),
        nModified: json["nModified"],
        ok: json["ok"],
        clusterTime: ClusterTime.fromJson(json["\u0024clusterTime"]),
        operationTime: json["operationTime"],
    );

    Map<String, dynamic> toJson() => {
        "n": n,
        "electionId": electionId,
        "opTime": opTime!.toJson(),
        "nModified": nModified,
        "ok": ok,
        "\u0024clusterTime": clusterTime!.toJson(),
        "operationTime": operationTime,
    };
}

class ClusterTime {
    ClusterTime({
        this.clusterTime,
        this.signature,
    });

    String? clusterTime;
    Signature? signature;

    factory ClusterTime.fromJson(Map<String, dynamic> json) => ClusterTime(
        clusterTime: json["clusterTime"],
        signature: Signature.fromJson(json["signature"]),
    );

    Map<String, dynamic> toJson() => {
        "clusterTime": clusterTime,
        "signature": signature!.toJson(),
    };
}

class Signature {
    Signature({
        this.hash,
        this.keyId,
    });

    String? hash;
    String? keyId;

    factory Signature.fromJson(Map<String, dynamic> json) => Signature(
        hash: json["hash"],
        keyId: json["keyId"],
    );

    Map<String, dynamic> toJson() => {
        "hash": hash,
        "keyId": keyId,
    };
}

class OpTime {
    OpTime({
        this.ts,
        this.t,
    });

    String? ts;
    int? t;

    factory OpTime.fromJson(Map<String, dynamic> json) => OpTime(
        ts: json["ts"],
        t: json["t"],
    );

    Map<String, dynamic> toJson() => {
        "ts": ts,
        "t": t,
    };
}
