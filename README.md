# Tugas Individu 7 PBP (*counter_7*)
**Sayyid Hafidzurrahman Atstsaqofi (2106651925)**

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.      
*Stateless widget* merupakan *widget* statis atau tidak memiliki *state* atau kondisi tertentu sehingga tampilannya tidak dipengaruhi oleh *state* atau kondisi yang dimilikinya. Oleh karena itu, konfigurasi pada *stateless widget* harusnya sudah diinisiasi sejak awal. Tampilan dari *stateless widget* hanya bisa diubah melalui *parent*-nya.

Sedangkan, *stateful widget* merupakan kebalikan dari *stateless widget*, di mana *stateful widget* merupakan widget dinamis, dengan kata lain dapat memiliki *state* atau kondisi internal yang akan memengaruhi tampilannya. Oleh karena itu, widget ini dapat diperbaharui kapanpun dibutuhkan berdasarkan user actions atau ketika terjadinya perubahan data. Tampilan dari aplikasi akan bergantung pada *state* atau kondisi yang disimpan variabel tersebut. Sehingga, tampilan dari suatu *stateful widget* dapat berubah akibat *parent* ataupun dari dirinya sendiri.

Perbedaan antara *stateful widget* dan *stateless widget* adalah:

**Stateful Widget**
* Dapat berubah jika user berinteraksi dengan widget
* Contoh : _counter

**Stateless Widget**
* Tidak akan pernah berubah
* Contoh : Icon, IconButton, Text

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.   
* `FloatingActionButton` <br> *Widget* untuk membuat suatu tombol yang meng-*hover* di atas konten.
* `Text` <br> *Widget* untuk menampilkan teks.
* `Column` <br> *Widget* untuk menampilkan satu atau lebih widget dalam satu kolom.
* `Icon` : Memberi atribut icon ke sebuah element
* `Row` <br> *Widget* untuk menampilkan satu atau lebih *widget* dalam satu baris.
* `Expanded` <br> *Widget* untuk membuat *child* yang berada dalam satu *Flex container*  memakan tempat sebanyak mungkin sehingga tidak ada space yang terbuang (mencegah tampilan terlihat tidak simetris).
* `Spacer` <br> *Widget* untuk memberi gap semaksimal mungkin diantara *widget* yang berada dalam satu *Flex container* (seperti *row* atau *column*).
* `Visibility` <br> *Widget* untuk mengatur visibilitas sebuah elemen.

## Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.   
Fungsi dari `setState()` adalah untuk memberikan informasi ke system ketika *state* dari sebuah variable berubah. Perubahan pada *state* yang dimiliki suatu *widget* perlu dilakukan menggunakan `setState()` karena setelah blok kode dalam `setState()` yang mengubah *state* dijalankan, *framework* akan melakukan hal-hal yang diperlukan seperti misalnya me-*render* ulang bagian yang mengalamai perubahan state.

Fungsi `setState()` hanya dapat berdampak pada variable yang bukan merupakan `final` ataupun `const`. Contohnya dalam program ini yang terdampak oleh `setState()` adalah _counter, yang dimana ketika *framework* me-*render* ulang, text ganjil/genap pada aplikasi akan terdampak.

## Jelaskan perbedaan antara `const` dengan `final`.     
Variabel `const` dan `final` sama-sama variabel yang bersifat *immutable*. Namun variabel dengan modifier `const` akan ditentukan dan disimpan nilainya pada saat kompilasi program (dengan kata lain disetup sebelum runtime), sehingga nilai dari variabel tersebut sudah pasti dan TIDAK dapat diubah dari dalam program saat *runtime*. Sedangkan, variabel dengan modifier `final` nilainya dapat saja ditentukan dari dalam program saat *runtime*, namun hanya bisa disetup satu kali saja.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.  
### Membuat sebuah program Flutter baru dengan nama `counter_7`
Pertama-tama, buka command prompt dan ubah direktori ke folder dimana anda menaruh project flutter anda. Setelah itu, ketiklah *command* `flutter create counter_7` untuk menginisiasi sebuah flutter project.

### Mengubah tampilan program menjadi seperti pada gambar & mengimplementasikan logika pada program
Pertama, saya membuka bagian `lib\main.dart' pada aplikasi saya lalu mengubah judul pada aplikasi dengan mengubah variabel pada kode. Tampilan yang saya ubah adalah title di tab jika anda membuka aplikasi di web, dan juga title yang berada pada bagian atas aplikasi.
```dart
Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 7: Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Program Counter'),
    );
  }
}
```

Kemudian, saya mengubah teks pada program agar menyesuaikan dengan *state* `_counter`. Saya membuat sebuah fungsi untuk mengembalikan teks dan *style* warna yang sesuai. Fungsi ini memiliki dua kondisi yaitu ketika _counter bernilai genap atau ganjil. Setelah if else selesai, *widget* `Text` akan mengambil nilai dari fungsi tersebut untuk ditampilkan.
```dart
children: <Widget>[
    _counter % 2 == 0
        ? const Text(
            'GENAP',
            style: TextStyle(color: Colors.red),
            )
        : const Text(
            'GANJIL',
            style: TextStyle(color: Colors.blue),
            ),
    Text(
        '$_counter',
        style: Theme.of(context).textTheme.headline4,
    ),
],
```

Selanjutnya, saya membuat fungsi baru yang dapat mengatur *state* pada variabel `_counter`, sejenis dengan fungsi `_incrementCounter()`. Bedanya fungsi ini mengubah state _counter menjadi berkurang 1
```dart
void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
}
```

Kemudian, saya membuat satu  `floatingActionButton` yang serupa dengan tombol increment yang sudah ada, bedanya fungsi dan icon yang dipakai pada widget tersebut adalah `_decrementCounter` dan `Icons.remove`. 

Lalu saya menaruh kedua button pada widget `Row` agar kedua button berada pada satu baris, lalu saya juga memasukan masing-masing button ke dalam widget `Expanded` dan menaruh widget `spacer` untuk mengatur button agar bisa berposisi sepojok mungkin untuk tiap button. 

Lalu untuk mengimplementasi bonus, saya menggunakan widget `Visibility` lalu saya atur sedemikian rupa sehingga button untuk `decrement` hanya terlihat ketika `_counter` bernilai tidak sama dengan nol. Sehingga, jika nilai `_counter` nol, maka button `decrement` tidak akan terlihat atau dihilangkan. 
```dart
Row(
  children: <Widget>[
    Expanded(
      child: Visibility(
        visible: (_counter != 0),
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        child: FloatingActionButton(
          onPressed: _decrementCounter,
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
      )
    ),
    const Spacer(flex: 2),
    Expanded(child: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      )
    )
  ],
),
```
