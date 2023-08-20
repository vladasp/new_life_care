import 'package:new_life_care/data/profile_model.dart';

abstract class ResultState {
  ResultState(this.model);

  final ProfileModel model;
}

class InitState extends ResultState {
  InitState(super.model);
}

class NavigateBackState extends ResultState {
  NavigateBackState(super.profile);
}
