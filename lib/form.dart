import 'package:counter_7/drawer.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/show_budget.dart';
import 'package:counter_7/models.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();

  // padding -> textformfield keperluan form
  String? _title = "";
  int? _nominalBudget;
  String _transactionType = "Pemasukan";
  DateTime selectedDate = DateTime.now();
  List<String> _jenis = ["Pengeluaran", "Pemasukan"];

  String? _jenisBudget;

  Future<void> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2120));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: const MyDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Judul",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      // hanya boleh memasukkan angka
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      labelText: "Nominal",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        int? newNominal = int.tryParse(value!);

                        if (!(newNominal == null)) {
                          _nominalBudget = newNominal;
                        }
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _nominalBudget = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      }

                      if (int.tryParse(value) == null) {
                        return 'Nominal harus berupa angka!';
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        labelText: "Pilih Jenis",
                        hintText: "Pilih Jenis",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    // value: _jenisPengeluaranBudget,
                    items: _jenis.map<DropdownMenuItem<String>>((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _jenisBudget = newValue!;
                      });
                    },
                    validator: (value) {
                      // value null <-> blm ada yg dipilih
                      if (value == null) {
                        return "Jenis tidak boleh kosong!";
                      }

                      return null;
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("${selectedDate.toLocal()}".split(" ")[0]),
                        const SizedBox(
                          height: 8.0,
                        ),
                        ElevatedButton(
                            onPressed: () => _selectedDate(context),
                            child: const Text("Select Date"))
                      ],
                    )),
                TextButton(
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      dataBudget.addBudget(
                          title: _title,
                          nominalBudget: _nominalBudget,
                          jenis: _jenisBudget,
                          date: selectedDate);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyFormPage()),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
