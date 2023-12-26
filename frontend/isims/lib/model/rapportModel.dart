
class RapportModel {

  String? id;
  String? rapportType;
  String? rapportContent;
  bool? seen;
  String? status;

  RapportModel({this.id,this.rapportContent,this.rapportType,this.seen,this.status});

  Map<String, dynamic> toJson() => {
    'id': id,
    "rapportType":rapportType,
    "rapportContent":rapportContent ,
    "seen":seen ,
    "status":status,
  };

  factory RapportModel.fromMap(Map<String, dynamic> map) {
    print(map['id']);
    print(map['rapportContent']);
    print(map['rapportType']);
    print(map['seen']);
    print(map['status']);
    return RapportModel(
      id: map['id'] as String ?? "",
      rapportContent: map['rapportContent'] as String ?? "",
      rapportType: map['rapportType'] as String ?? "",
      seen: map['seen'] as bool ?? false,
      status:  map['rapportStatus'] as String ?? "",
    );
  }
}