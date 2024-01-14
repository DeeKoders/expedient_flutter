import 'package:meta/meta.dart';
import 'dart:convert';

class AllOrders {
  int totalItems;
  List<Datum> data;

  AllOrders({
    required this.totalItems,
    required this.data,
  });

  factory AllOrders.fromRawJson(String str) =>
      AllOrders.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllOrders.fromJson(Map<String, dynamic> json) => AllOrders(
        totalItems: json["totalItems"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String jobDate;
  String shiftStarting;
  String shiftEnding;
  String shiftStartDateTime;
  String shiftEndDateTime;
  int id;
  bool onCall;
  bool inchargeNurse;
  bool defaultHoliday;
  bool callBack;
  bool backlog;
  String type;
  String status;
  OrderInfo orderInfo;
  dynamic fkPayGroupId;
  int fkClientId;
  int fkChecklistId;
  dynamic fkLongTermOrder;
  int fkProfessionId;
  int fkSpecialtyId;
  int fkShiftId;
  int candidateAssigned;
  int assignedBy;
  dynamic fkClientUserId;
  int fkRateGroupId;
  int createdAt;
  int updatedAt;
  Profession profession;
  Client client;
  Candidate candidate;
  Specialty specialty;
  TimeSheet timeSheet;

  Datum({
    required this.jobDate,
    required this.shiftStarting,
    required this.shiftEnding,
    required this.shiftStartDateTime,
    required this.shiftEndDateTime,
    required this.id,
    required this.onCall,
    required this.inchargeNurse,
    required this.defaultHoliday,
    required this.callBack,
    required this.backlog,
    required this.type,
    required this.status,
    required this.orderInfo,
    required this.fkPayGroupId,
    required this.fkClientId,
    required this.fkChecklistId,
    required this.fkLongTermOrder,
    required this.fkProfessionId,
    required this.fkSpecialtyId,
    required this.fkShiftId,
    required this.candidateAssigned,
    required this.assignedBy,
    required this.fkClientUserId,
    required this.fkRateGroupId,
    required this.createdAt,
    required this.updatedAt,
    required this.profession,
    required this.client,
    required this.candidate,
    required this.specialty,
    required this.timeSheet,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        jobDate: json["jobDate"],
        shiftStarting: json["shiftStarting"],
        shiftEnding: json["shiftEnding"],
        shiftStartDateTime: json["shiftStartDateTime"],
        shiftEndDateTime: json["shiftEndDateTime"],
        id: json["id"],
        onCall: json["onCall"],
        inchargeNurse: json["incharge_nurse"],
        defaultHoliday: json["default_holiday"],
        callBack: json["call_back"],
        backlog: json["backlog"],
        type: json["type"],
        status: json["status"],
        orderInfo: OrderInfo.fromJson(json["orderInfo"]),
        fkPayGroupId: json["fk_pay_group_id"],
        fkClientId: json["fk_client_id"],
        fkChecklistId: json["fk_checklist_id"],
        fkLongTermOrder: json["fk_long_term_order"],
        fkProfessionId: json["fk_profession_id"],
        fkSpecialtyId: json["fk_specialty_id"],
        fkShiftId: json["fk_shift_id"],
        candidateAssigned: json["candidate_assigned"],
        assignedBy: json["assigned_by"],
        fkClientUserId: json["fk_client_user_id"],
        fkRateGroupId: json["fk_rate_group_id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        profession: Profession.fromJson(json["profession"]),
        client: Client.fromJson(json["client"]),
        candidate: Candidate.fromJson(json["candidate"]),
        specialty: Specialty.fromJson(json["specialty"]),
        timeSheet: TimeSheet.fromJson(json["timeSheet"]),
      );

  Map<String, dynamic> toJson() => {
        "jobDate": jobDate,
        "shiftStarting": shiftStarting,
        "shiftEnding": shiftEnding,
        "shiftStartDateTime": shiftStartDateTime,
        "shiftEndDateTime": shiftEndDateTime,
        "id": id,
        "onCall": onCall,
        "incharge_nurse": inchargeNurse,
        "default_holiday": defaultHoliday,
        "call_back": callBack,
        "backlog": backlog,
        "type": type,
        "status": status,
        "orderInfo": orderInfo.toJson(),
        "fk_pay_group_id": fkPayGroupId,
        "fk_client_id": fkClientId,
        "fk_checklist_id": fkChecklistId,
        "fk_long_term_order": fkLongTermOrder,
        "fk_profession_id": fkProfessionId,
        "fk_specialty_id": fkSpecialtyId,
        "fk_shift_id": fkShiftId,
        "candidate_assigned": candidateAssigned,
        "assigned_by": assignedBy,
        "fk_client_user_id": fkClientUserId,
        "fk_rate_group_id": fkRateGroupId,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "profession": profession.toJson(),
        "client": client.toJson(),
        "candidate": candidate.toJson(),
        "specialty": specialty.toJson(),
        "timeSheet": timeSheet.toJson(),
      };
}

class Candidate {
  int id;
  String firstName;
  String lastName;

  Candidate({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory Candidate.fromRawJson(String str) =>
      Candidate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
      };
}

class Client {
  String name;
  String address;
  String city;
  String state;
  String zip;
  String county;
  String country;

  Client({
    required this.name,
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
    required this.county,
    required this.country,
  });

  factory Client.fromRawJson(String str) => Client.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        name: json["name"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        county: json["county"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "city": city,
        "state": state,
        "zip": zip,
        "county": county,
        "country": country,
      };
}

class OrderInfo {
  String note;
  String floor;

  OrderInfo({
    required this.note,
    required this.floor,
  });

  factory OrderInfo.fromRawJson(String str) =>
      OrderInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderInfo.fromJson(Map<String, dynamic> json) => OrderInfo(
        note: json["note"],
        floor: json["floor"],
      );

  Map<String, dynamic> toJson() => {
        "note": note,
        "floor": floor,
      };
}

class Profession {
  int id;
  String name;
  String profession;

  Profession({
    required this.id,
    required this.name,
    required this.profession,
  });

  factory Profession.fromRawJson(String str) =>
      Profession.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Profession.fromJson(Map<String, dynamic> json) => Profession(
        id: json["id"],
        name: json["name"],
        profession: json["profession"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profession": profession,
      };
}

class Specialty {
  int id;
  String name;
  String specialty;

  Specialty({
    required this.id,
    required this.name,
    required this.specialty,
  });

  factory Specialty.fromRawJson(String str) =>
      Specialty.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
        id: json["id"],
        name: json["name"],
        specialty: json["specialty"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "specialty": specialty,
      };
}

class TimeSheet {
  int id;
  String regularHours;
  dynamic onCallHours;
  dynamic callbackHours;
  dynamic approvedCallbackHours;
  String overTimeHours;
  dynamic doubleTimeHours;
  dynamic mealBreakHours;
  String approvedRegularHours;
  dynamic approvedOnCallHours;
  dynamic approvedChargeNurseHours;
  dynamic chargeNurseHours;
  String approvedOverTimeHours;
  dynamic approvedDoubleTimeHours;
  dynamic approvedMealBreakHours;
  bool inChargeNurse;
  bool approvedInChargeNurse;
  bool defaultHoliday;
  bool restBreak;
  bool mealBreak;
  bool approvedMealBreak;
  bool approvedRestBreak;
  bool approvedDefaultHoliday;
  String timeSheetImage;
  String status;
  dynamic approvedBy;
  int approvedByAdmin;
  bool disputed;
  dynamic fkInvoiceId;
  List<dynamic> disputes;

  TimeSheet({
    required this.id,
    required this.regularHours,
    required this.onCallHours,
    required this.callbackHours,
    required this.approvedCallbackHours,
    required this.overTimeHours,
    required this.doubleTimeHours,
    required this.mealBreakHours,
    required this.approvedRegularHours,
    required this.approvedOnCallHours,
    required this.approvedChargeNurseHours,
    required this.chargeNurseHours,
    required this.approvedOverTimeHours,
    required this.approvedDoubleTimeHours,
    required this.approvedMealBreakHours,
    required this.inChargeNurse,
    required this.approvedInChargeNurse,
    required this.defaultHoliday,
    required this.restBreak,
    required this.mealBreak,
    required this.approvedMealBreak,
    required this.approvedRestBreak,
    required this.approvedDefaultHoliday,
    required this.timeSheetImage,
    required this.status,
    required this.approvedBy,
    required this.approvedByAdmin,
    required this.disputed,
    required this.fkInvoiceId,
    required this.disputes,
  });

  factory TimeSheet.fromRawJson(String str) =>
      TimeSheet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TimeSheet.fromJson(Map<String, dynamic> json) => TimeSheet(
        id: json["id"],
        regularHours: json["regularHours"],
        onCallHours: json["on_call_hours"],
        callbackHours: json["callback_hours"],
        approvedCallbackHours: json["approved_callback_hours"],
        overTimeHours: json["overTimeHours"],
        doubleTimeHours: json["doubleTimeHours"],
        mealBreakHours: json["mealBreakHours"],
        approvedRegularHours: json["approvedRegularHours"],
        approvedOnCallHours: json["approved_on_call_hours"],
        approvedChargeNurseHours: json["approved_charge_nurse_hours"],
        chargeNurseHours: json["charge_nurse_hours"],
        approvedOverTimeHours: json["approvedOverTimeHours"],
        approvedDoubleTimeHours: json["approvedDoubleTimeHours"],
        approvedMealBreakHours: json["approvedMealBreakHours"],
        inChargeNurse: json["inChargeNurse"],
        approvedInChargeNurse: json["approvedInChargeNurse"],
        defaultHoliday: json["default_holiday"],
        restBreak: json["rest_break"],
        mealBreak: json["meal_break"],
        approvedMealBreak: json["approved_meal_break"],
        approvedRestBreak: json["approved_rest_break"],
        approvedDefaultHoliday: json["approved_default_holiday"],
        timeSheetImage: json["timeSheetImage"],
        status: json["status"],
        approvedBy: json["approvedBy"],
        approvedByAdmin: json["approvedByAdmin"],
        disputed: json["disputed"],
        fkInvoiceId: json["fk_invoice_id"],
        disputes: List<dynamic>.from(json["disputes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "regularHours": regularHours,
        "on_call_hours": onCallHours,
        "callback_hours": callbackHours,
        "approved_callback_hours": approvedCallbackHours,
        "overTimeHours": overTimeHours,
        "doubleTimeHours": doubleTimeHours,
        "mealBreakHours": mealBreakHours,
        "approvedRegularHours": approvedRegularHours,
        "approved_on_call_hours": approvedOnCallHours,
        "approved_charge_nurse_hours": approvedChargeNurseHours,
        "charge_nurse_hours": chargeNurseHours,
        "approvedOverTimeHours": approvedOverTimeHours,
        "approvedDoubleTimeHours": approvedDoubleTimeHours,
        "approvedMealBreakHours": approvedMealBreakHours,
        "inChargeNurse": inChargeNurse,
        "approvedInChargeNurse": approvedInChargeNurse,
        "default_holiday": defaultHoliday,
        "rest_break": restBreak,
        "meal_break": mealBreak,
        "approved_meal_break": approvedMealBreak,
        "approved_rest_break": approvedRestBreak,
        "approved_default_holiday": approvedDefaultHoliday,
        "timeSheetImage": timeSheetImage,
        "status": status,
        "approvedBy": approvedBy,
        "approvedByAdmin": approvedByAdmin,
        "disputed": disputed,
        "fk_invoice_id": fkInvoiceId,
        "disputes": List<dynamic>.from(disputes.map((x) => x)),
      };
}
