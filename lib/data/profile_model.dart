import 'package:new_life_care/data/enums.dart';

class ProfileModel {
  ProfileModel({required this.type, this.birthdayYear});

  factory ProfileModel.empty() {
    return ProfileModel(type: CareType.unspecified);
  }

  ProfileModel copyWith({CareType? type, int? birthdayYear}) {
    return ProfileModel(
        type: type ?? this.type,
        birthdayYear: birthdayYear ?? this.birthdayYear);
  }

  final CareType type;
  final int? birthdayYear;
}
