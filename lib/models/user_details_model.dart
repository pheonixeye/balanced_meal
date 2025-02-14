// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

enum Gender {
  Male,
  Female;
}

class UserDetails extends Equatable {
  final int height;
  final int weight;
  final int age;
  final Gender? gender;

  const UserDetails({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  });

  @override
  List<Object?> get props => [
        height,
        weight,
        age,
        gender,
      ];

  double _calories() {
    return switch (gender) {
      Gender.Male =>
        ((666.47) + (13.75 * weight) + (5 * height) - (6.75 * age)),
      Gender.Female =>
        ((655.1) + (9.56 * weight) + (1.85 * height) - (4.67 * age)),
      _ => 0,
    };
  }

  int get calories => _calories().toInt();

  factory UserDetails.initial() {
    return UserDetails(
      height: 0,
      weight: 0,
      age: 0,
      gender: null,
    );
  }

  UserDetails copyWith({
    int? height,
    int? weight,
    int? age,
    Gender? gender,
  }) {
    return UserDetails(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      gender: gender ?? this.gender,
    );
  }

  bool _isModelValid() {
    return (height != 0 && weight != 0 && age != 0 && gender != null);
  }

  bool get isModelValid => _isModelValid();
}
