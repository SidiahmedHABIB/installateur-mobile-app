class InstallationReport {
  final InstallationInfo info;
  final Technical technical;
  final CompanyReport companyReport;
  final List<BoxInstalled> box;

  const InstallationReport({
    required this.info,
    required this.technical,
    required this.companyReport,
    required this.box,
  });
}

class InstallationInfo {
  final String description;
  final DateTime date;

  const InstallationInfo({
    required this.description,
    required this.date,
  });
}

class BoxInstalled {
  final String name;
  final DateTime date;
  final String entity;
  final String matricul;
  final String value;
  final String sNumber;

  const BoxInstalled({
    required this.name,
    required this.date,
    required this.entity,
    required this.matricul,
    required this.value,
    required this.sNumber,
  });
}

class Technical {
  final String name;
  final String address;
  final String phone;

  const Technical({
    required this.name,
    required this.address,
    required this.phone,
  });
}

class CompanyReport {
  final String name;
  final String address;

  const CompanyReport({
    required this.name,
    required this.address,
  });
}
