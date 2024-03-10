class UserModel {
  UserModel({
    required this.id,
    required this.description,
    required this.emailid,
    required this.mobilenumber,
    required this.name,
    required this.walletamount,
  });
  late final String id;
  late final String description;
  late final String emailid;
  late final String mobilenumber;
  late final String name;
  late final String walletamount;
  
  UserModel.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    description = json['description'];
    emailid = json['emailid'];
    mobilenumber = json['mobilenumber'];
    name = json['name'];
    walletamount = json['walletamount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['description'] = description;
    _data['emailid'] = emailid;
    _data['mobilenumber'] = mobilenumber;
    _data['name'] = name;
    _data['walletamount'] = walletamount;
    return _data;
  }
}