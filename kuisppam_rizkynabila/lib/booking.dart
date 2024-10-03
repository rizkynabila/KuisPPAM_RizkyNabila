import 'package:flutter/material.dart';
import 'package:kuisppam_rizkynabila/payment.dart'; // Pastikan import halaman Payment

class BookingProduk extends StatefulWidget {
  const BookingProduk({super.key});

  @override
  State<BookingProduk> createState() => _BookingProdukState();
}

class _BookingProdukState extends State<BookingProduk> {
  final _formKey = GlobalKey<FormState>();
  String? namaLengkap;
  String? email;
  String? totalKamar;
  String? totalMalam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking Room',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/gambarhotel.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Blue Lagoon',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp 500.000,00/Night',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Booking Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Nama Lengkap *',
                    ),
                    onSaved: (String? value) {
                      namaLengkap = value;
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama harus diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Email *',
                    ),
                    onSaved: (String? value) {
                      email = value;
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Email harus diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.hotel),
                      labelText: 'Jumlah Kamar *',
                    ),
                    onSaved: (String? value) {
                      totalKamar = value;
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Jumlah kamar harus diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.nights_stay),
                      labelText: 'Jumlah Malam *',
                    ),
                    onSaved: (String? value) {
                      totalMalam = value;
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Jumlah malam harus diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Payment(
                                namaLengkap: namaLengkap!,
                                email: email!,
                                totalKamar: totalKamar!,
                                totalMalam: totalMalam!,
                                namaHotel: 'Blue Lagoon',
                                hargaHotel: 'Rp 500.000,00/Night',
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Payment',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
