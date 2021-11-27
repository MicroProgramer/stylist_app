import 'package:json_annotation/json_annotation.dart';

part 'registered_user.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisteredUser {
  String user_id, name, email, phone, password, image_url, country_code;
  double latitude, longitude;
  String notification_token;

  RegisteredUser(
      this.user_id,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.image_url,
      this.country_code,
      this.latitude,
      this.longitude,
      this.notification_token);

  // RegisteredUser(
  //     this._id,
  //     this._name,
  //     this._email,
  //     this._phone,
  //     this._password,
  //     this._pic_url,
  //     this._country_code,
  //     this._latitude,
  //     this._longitude,
  //     this._notification_token,
  //     this._userType,
  //     this._avgRating);
  //
  // get email => _email;
  //
  // set email(value) {
  //   _email = value;
  // }
  //
  // get name => _name;
  //
  // set name(value) {
  //   _name = value;
  // }
  //
  // String get id => _id;
  //
  // set id(String value) {
  //   _id = value;
  // }
  //
  // get phone => _phone;
  //
  // set phone(value) {
  //   _phone = value;
  // }
  //
  // get password => _password;
  //
  // set password(value) {
  //   _password = value;
  // }
  //
  // get pic_url => _pic_url;
  //
  // set pic_url(value) {
  //   _pic_url = value;
  // }
  //
  // get country_code => _country_code;
  //
  // set country_code(value) {
  //   _country_code = value;
  // }
  //
  // double get latitude => _latitude;
  //
  // set latitude(double value) {
  //   _latitude = value;
  // }
  //
  // get longitude => _longitude;
  //
  // set longitude(value) {
  //   _longitude = value;
  // }
  //
  // get notification_token => _notification_token;
  //
  // set notification_token(value) {
  //   _notification_token = value;
  // }
  //
  //
  // String get userType => _userType;
  //
  // set userType(String value) {
  //   _userType = value;
  // }
  //
  //
  // double get avgRating => _avgRating;
  //
  // set avgRating(double value) {
  //   _avgRating = value;
  // }
  //
  //
  //
  //
  // Map<String, dynamic> toMap() {
  //   return {
  //     "id": _id,
  //     "name": _name,
  //     "email": _email,
  //     "phone": _phone,
  //     "password": _password,
  //     "pic_url": _pic_url,
  //     "country_code": _country_code,
  //     "notification_token": _notification_token,
  //     "latitude": _latitude,
  //     "longitude": _longitude,
  //   };
  // }
  //
  // factory RegisteredUser.fromJson(Map<String, dynamic>? data) {
  //   return RegisteredUser(
  //     data!["id"] as String,
  //     data["name"] as String,
  //     data["email"] as String,
  //     data["phone"] as String,
  //     data["password"] as String,
  //     data["pic_url"] as String,
  //     data["country_code"] as String,
  //     data["notification_token"] as String,
  //     data["latitude"] as double,
  //     data["longitude"] as double,
  //   );
  // }

  factory RegisteredUser.fromJson(Map<String, dynamic>? json) =>
      _$RegisteredUserFromJson(json!);

  Map<String, dynamic> toJson() => _$RegisteredUserToJson(this);
}