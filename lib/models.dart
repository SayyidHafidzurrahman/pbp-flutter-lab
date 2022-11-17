class dataBudget {
  static List<dataBudget> budgets = [];
  String title;
  int nominalBudget;
  String jenis;
  DateTime date;

  dataBudget({
    required this.title,
    required this.nominalBudget,
    required this.jenis,
    required this.date,
  });

  static void addBudget({
    required title,
    required nominalBudget,
    required jenis,
    required date,
  }) {
    budgets.add(dataBudget(
      title: title,
      nominalBudget: nominalBudget,
      jenis: jenis,
      date: date,
    ));
  }
}

