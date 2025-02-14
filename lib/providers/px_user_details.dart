import 'package:balanced_meal/models/user_details_model.dart';
import 'package:flutter/material.dart';

class PxUserDetails extends ChangeNotifier {
  static UserDetails _detailsModel = UserDetails.initial();
  UserDetails get detailsModel => _detailsModel;

  void updateDetailsModel({
    int? height,
    int? weight,
    int? age,
    Gender? gender,
  }) {
    _detailsModel = _detailsModel.copyWith(
      height: height ?? _detailsModel.height,
      weight: weight ?? _detailsModel.weight,
      age: age ?? _detailsModel.age,
      gender: gender ?? _detailsModel.gender,
    );
    notifyListeners();
  }
}
