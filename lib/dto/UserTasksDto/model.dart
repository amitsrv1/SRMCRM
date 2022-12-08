// To parse this JSON data, do
//
//     final userTaksModel = userTaksModelFromJson(jsonString);

import 'dart:convert';

UserTaksModel userTaksModelFromJson(String str) => UserTaksModel.fromJson(json.decode(str));

//String userTaksModelToJson(UserTaksModel data) => json.encode(data.toJson());



class UserTaksModel {
    UserTaksModel({
         this.status,
         this.data,
         this.stage,
         this.startedTask,
    });

     int? status;
     List<Datum>? data;
     int? stage;
     dynamic startedTask;

    factory UserTaksModel.fromJson(Map<String, dynamic> json){ 
        return UserTaksModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        stage: json["stage"],
        startedTask: json["startedTask"],
    );
    }

}

class Datum {
    Datum({
         this.id,
         this.projectId,
         this.taskId,
         this.taskSubcategoryId,
         this.assignEffortHr,
         this.taskFlowId,
         this.flowName,
         this.datumTaskName,
         this.projectName,
         this.taskName,
         this.checklist,
         this.assignTime,
         this.assignCompletePercentage,
         this.completedChecklist,
         this.checklistArr,
         this.assignStartdate,
         this.assignEnddate,
         this.staffId,
         this.staffName,
         this.expand,
         this.action,
         this.assignStartStop,
         this.dueDays,
         this.dueStatus,
         this.isClickable,
         this.comments,
    });

   String? id;
   String? projectId;
   String? taskId;
   String? taskSubcategoryId;
     String? assignEffortHr;
     String? taskFlowId;
     String? flowName;
     String? datumTaskName;
     String? projectName;
     String? taskName;
     List<Checklist>? checklist;
     dynamic assignTime;
     int? assignCompletePercentage;
     List<dynamic>? completedChecklist;
     List<dynamic>? checklistArr;
     String? assignStartdate;
     String? assignEnddate;
     String? staffId;
     String? staffName;
     String? expand;
     String? action;
     int? assignStartStop;
     int? dueDays;
     String? dueStatus;
     bool? isClickable;
     List<dynamic>? comments;

    factory Datum.fromJson(Map<String, dynamic> json){ 
        return Datum(
        id: json["_id"],
        projectId: json["project_id"],
        taskId: json["task_id"],
        taskSubcategoryId: json["task_subcategory_id"],
        assignEffortHr: json["assign_effort_hr"],
        taskFlowId: json["task_flow_id"],
        flowName: json["flow_name"],
        datumTaskName: json["task_name"],
        projectName: json["project_name"],
        taskName: json["taskName"],
        checklist: json["checklist"] == null ? [] : List<Checklist>.from(json["checklist"]!.map((x) => Checklist.fromJson(x))),
        assignTime: json["assign_time"],
        assignCompletePercentage: json["assign_complete_percentage"],
        completedChecklist: json["completed_checklist"] == null ? [] : List<dynamic>.from(json["completed_checklist"]!.map((x) => x)),
        checklistArr: json["checklist_arr"] == null ? [] : List<dynamic>.from(json["checklist_arr"]!.map((x) => x)),
        assignStartdate: json["assign_startdate"],
        assignEnddate: json["assign_enddate"],
        staffId: json["staff_id"],
        staffName: json["staff_name"],
        expand: json["expand"],
        action: json["action"],
        assignStartStop: json["assign_start_stop"],
        dueDays: json["due_days"],
        dueStatus: json["due_status"],
        isClickable: json["isClickable"],
        comments: json["comments"] == null ? [] : List<dynamic>.from(json["comments"]!.map((x) => x)),
    );
    }

}

class Checklist {
    Checklist({
         this.id,
         this.checklistName,
         this.flowChecklist,
         this.weightage,
         this.isChecked,
         this.selectedWeightage,
    });

    String? id;
    String? checklistName;
    String? flowChecklist;
    int? weightage;
    bool? isChecked;
    int? selectedWeightage;

    factory Checklist.fromJson(Map<String, dynamic> json){ 
        return Checklist(
        id: json["_id"],
        checklistName: json["checklist_name"],
        flowChecklist: json["flow_checklist"],
        weightage: json["weightage"],
        isChecked: json["isChecked"],
        selectedWeightage: json["selectedWeightage"],
    );
    }

}
