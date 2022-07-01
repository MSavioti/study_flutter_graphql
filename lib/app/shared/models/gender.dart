class Gender {
  final String femalePercentage;
  final String malePercentage;

  Gender({
    required this.femalePercentage,
    required this.malePercentage,
  });

  factory Gender.fromJson(Map<String, dynamic> json) {
    return Gender(
        femalePercentage: json['male'], malePercentage: json['female']);
  }
}
