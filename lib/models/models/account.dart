import 'package:flutter/material.dart';
import 'package:market_application/models/grafik.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String username = 'Feyza Nur Kaya';
  String email = 'technomarketimfeyzakaya@gmail.com';
  String address = 'Başakşehir, İstanbul';
  String profileImageURL = 'assets/images/Ekran_goruntusu.png';

  Future<void> saveProfileImage(File imageFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final profileImagesDirectory =
        Directory('${directory.path}/profile_images');
    if (!(await profileImagesDirectory.exists())) {
      await profileImagesDirectory.create(recursive: true);
    }
    final imagePath = '${profileImagesDirectory.path}/profile_image.jpg';
    await imageFile.copy(imagePath);
    print('Profil fotoğrafı kaydedildi: $imagePath');
  }

  void handleEditProfile(BuildContext context) async {
    final updatedData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfilePage()),
    );

    if (updatedData != null) {
      setState(() {
        username = updatedData['name'];
        email = updatedData['email'];
        address = updatedData['address'];
        profileImageURL = updatedData['profileImage'] ?? profileImageURL;
      });
    }
  }

  void handleLogout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void handleAnalysis(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Grafik()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hesap',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(profileImageURL),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Kullanıcı Bilgileri:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Kullanıcı Adı: $username',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'E-posta: $email',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Adres Bilgileri:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Adres: $address',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => handleEditProfile(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            textStyle: const TextStyle(fontSize: 18),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            fixedSize: const Size(200, 50),
                          ),
                          child: const Text('Profili Düzenle'),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () => handleAnalysis(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            textStyle: const TextStyle(fontSize: 18),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            fixedSize: const Size(200, 50),
                          ),
                          child: const Text('Analiz'),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () => handleLogout(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            textStyle: const TextStyle(fontSize: 18),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            fixedSize: const Size(200, 50),
                          ),
                          child: const Text('Çıkış Yap'),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String? _pickedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _pickedImage = pickedImage?.path;
    });
  }

  Future<void> _showImageSelectionDialog() async {
    final imageSource = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Profil Fotoğrafı Seç'),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Kamera',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
              onPressed: () => Navigator.pop(context, ImageSource.camera),
            ),
            TextButton(
              child: const Text(
                'Galeri',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        );
      },
    );

    if (imageSource != null) {
      final picker = ImagePicker();
      final pickedImage = await picker.getImage(source: imageSource);

      setState(() {
        _pickedImage = pickedImage?.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profili Düzenle',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Adınız Soyadınız:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Adınızı ve soyadınızı girin',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'E-posta:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'E-postanızı girin',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Adres:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                hintText: 'Adresinizi girin',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _showImageSelectionDialog,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              child: const Text('Profil Fotoğrafını Seç'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String email = emailController.text;
                String address = addressController.text;

                Navigator.pop(context, {
                  'name': name,
                  'email': email,
                  'address': address,
                  'profileImage': _pickedImage,
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              child: const Text('Kaydet'),
            ),
            if (_pickedImage != null)
              Image.network(
                _pickedImage!,
                width: 200,
                height: 200,
              ),
          ],
        ),
      ),
    );
  }
}
