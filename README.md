# Tugas Individu 7 PBP (*counter_7*)
**Sayyid Hafidzurrahman Atstsaqofi (2106651925)**

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.      
*Stateless widget* merupakan *widget* statis atau tidak memiliki *state* atau kondisi tertentu sehingga tampilannya tidak dipengaruhi oleh *state* atau kondisi yang dimilikinya. Oleh karena itu, konfigurasi pada *stateless widget* harusnya sudah diinisiasi sejak awal. Tampilan dari *stateless widget* hanya bisa diubah melalui *parent*-nya.

Sedangkan, *stateful widget* merupakan kebalikan dari *stateless widget*, di mana *stateful widget* merupakan widget dinamis, dengan kata lain dapat memiliki *state* atau kondisi internal yang akan memengaruhi tampilannya. Oleh karena itu, *widget* ini dapat diperbaharui kapanpun dibutuhkan berdasarkan *user actions* atau ketika terjadinya perubahan data. Tampilan dari aplikasi akan bergantung pada *state* atau kondisi yang disimpan variabel tersebut. Sehingga, tampilan dari suatu *stateful widget* dapat berubah akibat *parent* ataupun dari dirinya sendiri.

Perbedaan antara *stateful widget* dan *stateless widget* adalah:

**Stateful Widget**
* Dapat berubah jika user berinteraksi dengan *widget*
* Contoh : _counter

**Stateless Widget**
* Tidak akan pernah berubah
* Contoh : Icon, IconButton, Text

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.   
* `FloatingActionButton` <br> *Widget* untuk membuat suatu tombol yang meng-*hover* di atas konten.
* `Text` <br> *Widget* untuk menampilkan teks.
* `Column` <br> *Widget* untuk menampilkan satu atau lebih *widget* dalam satu kolom.
* `Icon` <br> Memberi atribut *icon* ke sebuah elemen
* `Row` <br> *Widget* untuk menampilkan satu atau lebih *widget* dalam satu baris.
* `Expanded` <br> *Widget* untuk membuat *child* yang berada dalam satu *Flex container*  memakan tempat sebanyak mungkin sehingga tidak ada *space* yang terbuang (mencegah tampilan terlihat tidak simetris).
* `Spacer` <br> *Widget* untuk memberi *gap* semaksimal mungkin diantara *widget* yang berada dalam satu *Flex container* (seperti *row* atau *column*).
* `Visibility` <br> *Widget* untuk mengatur visibilitas sebuah elemen.

## Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.   
Fungsi dari `setState()` adalah untuk memberikan informasi ke sistem ketika *state* dari sebuah variabel berubah. Perubahan pada *state* yang dimiliki suatu *widget* perlu dilakukan menggunakan `setState()` karena setelah blok kode dalam `setState()` yang mengubah *state* dijalankan, *framework* akan melakukan hal-hal yang diperlukan seperti misalnya me-*render* ulang bagian yang mengalamai perubahan *state*.

Fungsi `setState()` hanya dapat berdampak pada variabel yang bukan merupakan `final` ataupun `const`. Contohnya dalam program ini yang terdampak oleh `setState()` adalah _counter, yang dimana ketika *framework* me-*render* ulang, *text* ganjil/genap pada aplikasi akan terdampak.

## Jelaskan perbedaan antara `const` dengan `final`.     
Variabel `const` dan `final` sama-sama variabel yang bersifat *immutable*. Namun variabel dengan *modifier* `const` akan ditentukan dan disimpan nilainya pada saat kompilasi program (dengan kata lain di-*setup* sebelum *runtime*), sehingga nilai dari variabel tersebut sudah pasti dan TIDAK dapat diubah dari dalam program saat *runtime*. Sedangkan, variabel dengan *modifier* `final` nilainya dapat saja ditentukan dari dalam program saat *runtime*, namun hanya bisa di-*setup* satu kali saja.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.  
### Membuat sebuah program Flutter baru dengan nama `counter_7`
Pertama-tama, buka command prompt dan ubah direktori ke folder dimana anda menaruh **project flutter** anda. Setelah itu, ketiklah *command* `flutter create counter_7` untuk menginisiasi sebuah **flutter project**.

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

<hr>

# Tugas Individu 8 PBP (*Budget*)
**Hugo Sulaiman Setiawan (2106707315)**

## Jelaskan perbedaan `Navigator.push` dan `Navigator.pushReplacement`.
`Navigator.push` dan  `Navigator.pushReplacement` sama-sama mem-*push* sebuah *route* baru ke `Navigator` (yang pada dasarnya mirip dengan operasi *push* pada *Stack*). Namun, `Navigator.pushReplacement` akan menghapus *route* sebelumnya setelah *route* yang baru telah selesai *loading* dan sudah digunakan. Sehingga, *route* baru yang dipush dengan `Navigator.pushReplacement` akan menggantikan *route* lama yang sudah ada pada `Navigator`.

## Sebutkan *widget* apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
Selain *widget* yang sudah digunakan pada [tugas sebelumnya](#tugas-individu-7-pbp-counter_7), berikut adalah beberapa *widget* yang baru digunakan pada pembuatan proyek kali ini:

- `ListView` <br>
*Widget* untuk menampilkan beberapa *widget* secara linear searah (tepatnya pada arah *scrolling*) yang bisa di-*scroll*.
- `SingleChildScrollView` <br>
*Widget* yang memiliki fungsi yang mirip dengan `ListView`, yaitu untuk menampilkan beberapa *widget* secara linear searah (tepatnya pada arah *scrolling*) yang bisa di-*scroll*. Namun, sesuai namanya (**SingleChild**) hanya dapat menerima satu elemen sebagai *child*. Biasanya *widget* ini dikombinasikan dengan widget seperti misalnya *Column* untuk menampilkan beberapa widget, yang dapat berbeda-beda ukurannya. 
- `Card` <br>
*Widget* untuk membuat sebuah *card* yang dapat digunakan untuk menampilkan *widget*-*widget* lain.
- `Drawer` <br>
*Widget* untuk membuat sebuah *drawer* yang dapat ditampilkan dari sisi *scaffold*; biasanya digunakan untuk menampung *navigation links*.
- `Form` <br>
*Widget* yang dapat digunakan untuk menjadi *parent* terhadap `FormField` seperti misalnya:
  - `TextFormField` <br>
  *Widget* yang digunakan untuk menerima input *text* dari pengguna.
  - `DropdownButtonFormField` <br>
  *Widget* yang digunakan untuk membuat suatu *dropdown box* yang berfungsi sebagai input dari pengguna. *Item* untuk *dropdown box* dibuat dengan *widget* `DropdownMenuItem`. 
- `Consumer<T>` <br>
*Widget* yang digunakan untuk menerima data yang ada pada `Provider<T>`, tepatnya `Provider<BudgetModel>` dan dipass kepada *builder*, agar nilai-nilai yang disediakan pada *provider* dapat digunakan dalam pembuatan *widget*. (tepatnya untuk membuat *card* dengan isian *budget* pada halaman **Data Budget**).

## Sebutkan jenis-jenis event yang ada pada Flutter.
Berikut adalah beberapa dari *event* yang ada pada Flutter:
- `onPressed` <br>
- `onChanged` <br>
- `onSaved` <br>
- `onTap` <br>

## Jelaskan bagaimana cara kerja `Navigator` dalam "mengganti" halaman dari aplikasi Flutter.
Cara kerja `Navigator` dalam menampilkan halaman (dalam terminologi Flutter, bahasa yang tepat untuk term ini adalah *routes*) dapat diandaikan bekerja seperti struktur data *Stack*. 

Ketika perintah `Navigator.push` diberikan, maka *route* yang hendak di-*push* akan masuk ke atas *stack* `Navigator`. `Navigator` pun akan menampilkan *route* yang ada pada *top of stack*. Jika sebuah *route* baru di-*push* setelah itu, maka *route* baru itulah yang akan ada pada *top of stack* dan akan ditampilkan. *Route* yang sebelumnya ditampilkan akan berada di belakang *route* yang baru saja di-*push*.

Jika hendak menutup halaman/*route* yang ada pada *top of stack*, maka dapat menggunakan perintah `Navigator.pop`. *Route* yang akan mengeluarkan *route* yang sedang berada pada *top of stack*. Kemudian, *route* yang ada pada belakang *route* yang di-*pop* akan berada di *top of stack*, sehingga *route* tersebutlah yang akan ditampilkan ke pengguna.

Perandaian lain untuk cara kerja `Navigator` adalah sebagai berikut: andaikan `Navigator` adalah suatu tumpukan kertas, dan masing-masing kertas merupakan suatu halaman/*route*. Tentu, kertas/*route* yang terlihat oleh pengguna adalah kertas/*route* yang ada pada atas tumpukan kertas. Jika hendak menampilkan kertas/*route* lain, kita akan menaruh kertas/*route* tersebut pada paling atas tumpukan (`Navigator.push`). Kertas/*route* akan menutup kertas/*route* yang sebelumnya terlihat.

 Sebaliknya, jika kita hendak menutup kertas/*route* yang sedang terlihat, maka kita akan "membuang" kertas pada paling atas tumpukan, dan kemudian akan terlihat kertas/*route* yang ada pada sebelum kertas/*route* yang baru saja di-"buang".

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
### Menambahkan *drawer* serta menambahkan tiga tombol navigasi
Untuk memudahkan *development* (serta untuk memenuhi sebagian poin bonus), *drawer* serta tombol navigasi diimplementasikan dalam file terpisah, `drawer.dart`, di mana sebuah *widget* `MyDrawer` didefinisikan, yang mencakup sebuah *drawer* serta tombol-tombol navigasi sesuai ketentuan soal. 

### Menambahkan halaman *form*
Halaman *form* dibuat pada file `form.dart`. Halaman *form* ini mengandung elemen-elemen input berupa `TextFormField` dan `DropdownButtonFormField` yang dibungkus dalam `Form`. Selain itu, diperlukan *validator* untuk memvalidasi input yang diberikan oleh user sesuai dengan ketentuan (misalnya, input untuk nominal harus berupa angka). Hasil dari input pengguna akan disimpan dalam variabel, yang terkandung dalam *state* dari halaman form tersebut.

### Menyimpan *budget*
Ketika tombol pada halaman *form* ditekan, maka isian form akan divalidasi, kemudian akan disimpan dengan menggunakan `BudgetModel extends ChangeNotifier`, yang dalam internalnya menyimpan `Budget`-`Budget` dengan menggunakan `List<Budget>`, yang kemudian dapat diakses dengan `UnmodifiableListView<Budget>`. Data akan disimpan oleh instance `ChangeNotifierProvider` untuk `BudgetModel` yang ada pada `main` dengan:
```dart
Provider.of<BudgetModel>(context, listen: false).add(newBudget);
```

### Menambahkan halaman data *budget*
Halaman data *budget* dibuat pada file `show_budget.dart`. Bodi pada halaman ini pada dasarnya akan dibangun dengan menggunakan `Consumer<BudgetModel>`, yang *builder*-nya akan membuat suatu `ListView` yang mengandung `Card`-`Card` yang masing-masingnya menampilkan data dari satu *instance* `Budget` yang ada pada `BudgetModel`.

<hr>