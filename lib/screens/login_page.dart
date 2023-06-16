import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String username;
  late String password;

  void loginFirebase(String username, String password) async {
    var auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  labelText: 'Kullanıcı Adı',
                  labelStyle: TextStyle(color: Colors.purple),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Kullanıcı Adınızı Giriniz';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  username = value!;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  labelText: 'Şifre',
                  labelStyle: TextStyle(color: Colors.purple),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Şifrenizi Giriniz';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    child: Text('Üye Ol'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UyelikSayfasi()));
                    },
                  ),
                  MaterialButton(
                    child: Text('Şifremi Unuttum'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SifreSifirlamaSayfasi()));
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                ),
                child: Text('Giriş Yap'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print('Kullanıcı adı: $username');
                    print('Şifre: $password');
                    if (username == "feyza nur kaya" && password == "feyza") {
                      print("Giriş Başarılı");
                      Navigator.pushReplacementNamed(context, '/homepage');
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Hata"),
                            content:
                                Text("Kullanıcı Adınız veya Şifreniz Hatalı"),
                          );
                        },
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UyelikSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Üyelik Sayfası',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ad',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Adınızı girin',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Soyad',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Soyadınızı girin',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'E-posta',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'E-posta adresinizi girin',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(height: 16),
            Text(
              'Adres',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Adresinizi girin',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              child: Text(
                'Üye Ol',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SifreSifirlamaSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Şifre Sıfırlama Sayfası',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'E-posta',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'E-posta adresinizi girin',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              child: Text(
                'Şifremi Sıfırla',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
