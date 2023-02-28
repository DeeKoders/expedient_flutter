class AllOrders {
  FilterOptions? filterOptions;
  List<Orders>? orders;

  AllOrders({this.filterOptions, this.orders});

  AllOrders.fromJson(Map<String, dynamic> json) {
    filterOptions = json['filterOptions'] != null
        ? FilterOptions.fromJson(json['filterOptions'])
        : null;
    if (json['data'] != null) {
      orders = <Orders>[];
      json['data'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (filterOptions != null) {
      data['filterOptions'] = filterOptions!.toJson();
    }
    if (orders != null) {
      data['data'] = orders!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class FilterOptions {
  List<Professions>? professions;
  List<Specialty>? specialties;
  List<Types>? types;

  FilterOptions({
    this.professions,
    this.specialties,
    this.types,
  });

  FilterOptions.fromJson(Map<String, dynamic> json) {
    if (json['professions'] != null) {
      professions = <Professions>[];
      json['professions'].forEach((v) {
        professions!.add(Professions.fromJson(v));
      });
    }
    if (json['specialties'] != null) {
      specialties = <Specialty>[];
      json['specialties'].forEach((v) {
        specialties!.add(Specialty.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (professions != null) {
      data['professions'] = professions!.map((v) => v.toJson()).toList();
    }
    if (specialties != null) {
      data['specialties'] = specialties!.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Professions {
  int? value;
  String? label;

  Professions({this.value, this.label});

  Professions.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['label'] = label;
    return data;
  }
}

class Types {
  String? value;
  String? label;

  Types({this.value, this.label});

  Types.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['label'] = label;
    return data;
  }
}

class Orders {
  String? jobDate;
  String? shiftStarting;
  String? shiftEnding;
  String? shiftStartDateTime;
  String? shiftEndDateTime;
  int? id;
  bool? onCall;
  bool? inchargeNurse;
  bool? backlog;
  String? type;
  String? status;
  OrderInfo? orderInfo;
  int? fkPayGroupId;
  int? fkClientId;
  int? fkChecklistId;
  int? fkProfessionId;
  int? fkSpecialtyId;
  int? fkShiftId;
  int? candidateAssigned;
  int? assignedBy;
  int? fkClientUserId;
  int? fkRateGroupId;
  int? createdAt;
  int? updatedAt;
  Client? client;
  TimeSheet? timeSheet;
  Candidate? candidate;
  Profession? profession;
  Specialty? specialty;
  String? floor;
  String? note;

  Orders(
      {this.jobDate,
      this.shiftStarting,
      this.shiftEnding,
      this.shiftStartDateTime,
      this.shiftEndDateTime,
      this.id,
      this.onCall,
      this.inchargeNurse,
      this.backlog,
      this.type,
      this.status,
      this.orderInfo,
      this.fkPayGroupId,
      this.fkClientId,
      this.fkChecklistId,
      this.fkProfessionId,
      this.fkSpecialtyId,
      this.fkShiftId,
      this.candidateAssigned,
      this.assignedBy,
      this.fkClientUserId,
      this.fkRateGroupId,
      this.createdAt,
      this.updatedAt,
      this.client,
      this.timeSheet,
      this.candidate,
      this.profession,
      this.specialty,
      this.floor,
      this.note});

  Orders.fromJson(Map<String, dynamic> json) {
    jobDate = json['jobDate'];
    shiftStarting = json['shiftStarting'];
    shiftEnding = json['shiftEnding'];
    shiftStartDateTime = json['shiftStartDateTime'];
    shiftEndDateTime = json['shiftEndDateTime'];
    id = json['id'];
    onCall = json['onCall'];
    inchargeNurse = json['incharge_nurse'];
    backlog = json['backlog'];
    type = json['type'];
    status = json['status'];
    orderInfo = json['orderInfo'] != null
        ? OrderInfo.fromJson(json['orderInfo'])
        : null;
    fkPayGroupId = json['fk_pay_group_id'];
    fkClientId = json['fk_client_id'];
    fkChecklistId = json['fk_checklist_id'];
    fkProfessionId = json['fk_profession_id'];
    fkSpecialtyId = json['fk_specialty_id'];
    fkShiftId = json['fk_shift_id'];
    candidateAssigned = json['candidate_assigned'];
    assignedBy = json['assigned_by'];
    fkClientUserId = json['fk_client_user_id'];
    fkRateGroupId = json['fk_rate_group_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
    timeSheet = json['timeSheet'] != null
        ? TimeSheet.fromJson(json['timeSheet'])
        : null;
    candidate = json['candidate'] != null
        ? Candidate.fromJson(json['candidate'])
        : null;
    profession = json['profession'] != null
        ? Profession.fromJson(json['profession'])
        : null;
    specialty = json['specialty'] != null
        ? Specialty.fromJson(json['specialty'])
        : null;
    floor = json['floor'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jobDate'] = jobDate;
    data['shiftStarting'] = shiftStarting;
    data['shiftEnding'] = shiftEnding;
    data['shiftStartDateTime'] = shiftStartDateTime;
    data['shiftEndDateTime'] = shiftEndDateTime;
    data['id'] = id;
    data['onCall'] = onCall;
    data['incharge_nurse'] = inchargeNurse;
    data['backlog'] = backlog;
    data['type'] = type;
    data['status'] = status;
    if (orderInfo != null) {
      data['orderInfo'] = orderInfo!.toJson();
    }
    data['fk_pay_group_id'] = fkPayGroupId;
    data['fk_client_id'] = fkClientId;
    data['fk_checklist_id'] = fkChecklistId;
    data['fk_profession_id'] = fkProfessionId;
    data['fk_specialty_id'] = fkSpecialtyId;
    data['fk_shift_id'] = fkShiftId;
    data['candidate_assigned'] = candidateAssigned;
    data['assigned_by'] = assignedBy;
    data['fk_client_user_id'] = fkClientUserId;
    data['fk_rate_group_id'] = fkRateGroupId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (client != null) {
      data['client'] = client!.toJson();
    }
    if (timeSheet != null) {
      data['timeSheet'] = timeSheet!.toJson();
    }
    if (candidate != null) {
      data['candidate'] = candidate!.toJson();
    }
    if (profession != null) {
      data['profession'] = profession!.toJson();
    }
    if (specialty != null) {
      data['specialty'] = specialty!.toJson();
    }
    data['floor'] = floor;
    data['note'] = note;
    return data;
  }
}

class OrderInfo {
  String? floor;
  String? note;

  OrderInfo({this.note, this.floor});

  OrderInfo.fromJson(Map<String, dynamic> json) {
    note = json['note'];
    floor = json['floor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['note'] = note;
    data['floor'] = floor;
    return data;
  }
}

class Client {
  String? name;
  String? address;
  String? city;
  String? state;
  String? zip;
  String? county;
  String? country;

  Client(
      {this.name,
      this.address,
      this.city,
      this.state,
      this.zip,
      this.county,
      this.country});

  Client.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    county = json['county'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['zip'] = zip;
    data['county'] = county;
    data['country'] = country;
    return data;
  }
}

class TimeSheet {
  int? id;
  String? regularHours;
  String? overTimeHours;
  String? doubleTimeHours;
  String? mealBreakHours;
  String? approvedRegularHours;
  String? approvedOverTimeHours;
  String? approvedDoubleTimeHours;
  String? approvedMealBreakHours;
  bool? inChargeNurse;
  bool? approvedInChargeNurse;
  String? timeSheetImage;
  String? status;
  int? approvedBy;
  bool? disputed;
  int? fkInvoiceId;

  TimeSheet({
    this.id,
    this.regularHours,
    this.overTimeHours,
    this.doubleTimeHours,
    this.mealBreakHours,
    this.approvedRegularHours,
    this.approvedOverTimeHours,
    this.approvedDoubleTimeHours,
    this.approvedMealBreakHours,
    this.inChargeNurse,
    this.approvedInChargeNurse,
    this.timeSheetImage,
    this.status,
    this.approvedBy,
    this.disputed,
    this.fkInvoiceId,
  });

  TimeSheet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    regularHours = json['regularHours'];
    overTimeHours = json['overTimeHours'];
    doubleTimeHours = json['doubleTimeHours'];
    mealBreakHours = json['mealBreakHours'];
    approvedRegularHours = json['approvedRegularHours'];
    approvedOverTimeHours = json['approvedOverTimeHours'];
    approvedDoubleTimeHours = json['approvedDoubleTimeHours'];
    approvedMealBreakHours = json['approvedMealBreakHours'];
    inChargeNurse = json['inChargeNurse'];
    approvedInChargeNurse = json['approvedInChargeNurse'];
    timeSheetImage = json['timeSheetImage'];
    status = json['status'];
    approvedBy = json['approvedBy'];

    disputed = json['disputed'];
    fkInvoiceId = json['fk_invoice_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['regularHours'] = regularHours;
    data['overTimeHours'] = overTimeHours;
    data['doubleTimeHours'] = doubleTimeHours;
    data['mealBreakHours'] = mealBreakHours;
    data['approvedRegularHours'] = approvedRegularHours;
    data['approvedOverTimeHours'] = approvedOverTimeHours;
    data['approvedDoubleTimeHours'] = approvedDoubleTimeHours;
    data['approvedMealBreakHours'] = approvedMealBreakHours;
    data['inChargeNurse'] = inChargeNurse;
    data['approvedInChargeNurse'] = approvedInChargeNurse;
    data['timeSheetImage'] = timeSheetImage;
    data['status'] = status;
    data['approvedBy'] = approvedBy;
    data['disputed'] = disputed;
    data['fk_invoice_id'] = fkInvoiceId;

    return data;
  }
}

class Candidate {
  int? id;
  String? firstName;
  String? lastName;

  Candidate({this.id, this.firstName, this.lastName});

  Candidate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    return data;
  }
}

class Profession {
  int? id;
  String? profession;

  Profession({this.id, this.profession});

  Profession.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profession = json['profession'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['profession'] = profession;
    return data;
  }
}

class Specialty {
  int? id;
  String? specialty;

  Specialty({this.id, this.specialty});

  Specialty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    specialty = json['specialty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['specialty'] = specialty;
    return data;
  }
}
