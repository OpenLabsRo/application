class MRZResult {
  final String? documentType;
  final String? countryCode;
  final String? surnames;
  final String? givenNames;
  final String? documentNumber;
  final String? nationalityCountryCode;
  final DateTime? birthDate;
  final String? sex;
  final DateTime? expiryDate;
  final String? personalNumber;
  final String? personalNumber2;

  MRZResult({
    this.documentType,
    this.countryCode,
    this.surnames,
    this.givenNames,
    this.documentNumber,
    this.nationalityCountryCode,
    this.birthDate,
    this.sex,
    this.expiryDate,
    this.personalNumber,
    this.personalNumber2,
  });
}
