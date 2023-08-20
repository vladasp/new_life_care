import 'dart:async';

import 'package:new_life_care/data/enums.dart';
import 'package:new_life_care/data/profile_model.dart';

abstract class IStorageRepository {
  Future<void> saveCareType(CareType type);
  Future<void> saveBirthday(int birthDay);
  FutureOr<ProfileModel?> get profile;
}

class StorageRepository implements IStorageRepository {
  ProfileModel _profile = ProfileModel.empty();
  @override
  FutureOr<ProfileModel?> get profile => _profile;

  @override
  Future<void> saveBirthday(int birthDay) async {
    _profile = _profile.copyWith(birthdayYear: birthDay);
  }

  @override
  Future<void> saveCareType(CareType type) async {
    _profile = _profile.copyWith(type: type);
  }
}
