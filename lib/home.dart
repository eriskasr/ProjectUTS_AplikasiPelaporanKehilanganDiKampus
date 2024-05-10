import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_uts/main.dart';
import 'package:image_picker/image_picker.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class Post {
  final String imageUrl;
  final String username;
  final String caption;
  final String location;

  Post({
    required this.imageUrl,
    required this.username,
    required this.caption,
    required this.location,
  });
}

class _homepageState extends State<homepage> {
  final List<Post> _posts = [
    Post(
      imageUrl: "asset_media/gambar/android.jpeg",
      username: "marichashella",
      caption: "Ditemukan handphone samsung warna purple diatas meja tengah",
      location: "Ruangan lab komputer 2",
    ),
    Post(
      imageUrl: "asset_media/gambar/dompet.jpg",
      username: "Chilla",
      caption:
          "Dicari dompet hilang, yang di dalamnya terdapat ktp atas nama Chilla, beserta kartu mahasiswa, dan beserta sejumlah uang tunai.",
      location: "Parkiran lapangan belakang",
    ),
    Post(
      imageUrl: "asset_media/gambar/sepatu.jpeg",
      username: "alkomangari",
      caption: "Dicari sepatu warna brown ukuran 29 hilang saat di mushola.",
      location: "Mushola kampus fikom",
    ),
    // Add more posts with different image URLs
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Ma-Link Feed',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Navigate to profile page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Post header
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18.0,
                        backgroundImage:
                            AssetImage('asset_media/gambar/icon/acc.jpeg'),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        _posts[index].username,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                // Post image
                Image.network(_posts[index].imageUrl),
                // Post caption
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 8.0, right: 10.0, bottom: 8.0),
                  child: Text(
                    _posts[index].caption,
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    "Lokasi: " + _posts[index].location,
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
                // Post actions
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 8.0, right: 10.0, bottom: 10.0),
                  child: Row(
                    children: [
                      ChecklistButton(),
                      SizedBox(width: 12.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CommentPage()),
                          );
                        },
                        child:
                            Icon(Icons.chat_bubble_outline, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BuatLaporanPage()),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class ChecklistButton extends StatefulWidget {
  @override
  _ChecklistButtonState createState() => _ChecklistButtonState();
}

class _ChecklistButtonState extends State<ChecklistButton> {
  bool isChecked = false;
  Color buttonColor = Colors.white;
  Color textColor = Colors.blue;
  String buttonText = 'Dicari';

  void _handleTap() {
    setState(() {
      isChecked = !isChecked;
      if (isChecked) {
        buttonColor = Colors.blue;
        textColor = Colors.white;
        buttonText = 'Ditemukan';
      } else {
        buttonColor = Colors.white;
        textColor = Colors.blue;
        buttonText = 'Dicari';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// Comment class
class Comment {
  final String user;
  final String comment;

  Comment({required this.user, required this.comment});
}

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final List<Comment> _comments = [
    Comment(user: "User2", comment: "Aku tadi lihat di kantin geprek Bu Darmi"),
    Comment(user: "User1", comment: "Tolong bantu cari ya gaesss"),
    //...
  ];

  final TextEditingController _commentController = TextEditingController();
  static const String _currentUser = "User2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Komentar',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: _CommentList(comments: _comments)),
          Divider(),
          _CommentInput(controller: _commentController, onPost: _handlePost),
        ],
      ),
    );
  }

  void _handlePost() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        _comments.insert(
            0, Comment(user: _currentUser, comment: _commentController.text));
        _commentController.clear();
      });
    }
  }
}

// CommentList widget
class _CommentList extends StatelessWidget {
  final List<Comment> comments;

  _CommentList({required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListView(
      reverse: true,
      children:
          comments.map((comment) => _CommentItem(comment: comment)).toList(),
    );
  }
}

// CommentItem widget
class _CommentItem extends StatelessWidget {
  final Comment comment;

  _CommentItem({required this.comment});

  @override
  Widget build(BuildContext context) {
    final isMyComment = comment.user == _CommentPageState._currentUser;
    return Align(
      alignment: isMyComment ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isMyComment ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.user,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              comment.comment,
              style:
                  TextStyle(color: isMyComment ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

// CommentInput widget
class _CommentInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPost;

  _CommentInput({required this.controller, required this.onPost});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/user_profile.jpg'),
      ),
      title: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Tambahkan komentar...',
        ),
      ),
      trailing: TextButton(
        onPressed: onPost,
        child: Text(
          'Kirim',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}

class BuatLaporanPage extends StatefulWidget {
  @override
  _BuatLaporanPageState createState() => _BuatLaporanPageState();
}

class _BuatLaporanPageState extends State<BuatLaporanPage> {
  final _formKey = GlobalKey<FormState>();

  String _keterangan = '';
  String _lokasiTerakhir = '';
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Upload the report
      _formKey.currentState!.save();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buat Laporan',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Keterangan Kehilangan',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan keterangan kehilangan',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon isi keterangan kehilangan';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _keterangan = value!;
                  },
                  maxLines: 3,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Lokasi Terakhir',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan lokasi terakhir',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon isi lokasi terakhir';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _lokasiTerakhir = value!;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: Icon(
                    Icons.image,
                    color: Colors.blue,
                  ),
                  label: Text(
                    'Pilih Gambar',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.32, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
                if (_image != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Image.file(
                      _image!,
                      height: 200,
                    ),
                  ),
                SizedBox(height: 25.0),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text(
                      'Unggah',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.32, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final List<Post> _posts = [
    Post(
      imageUrl: "asset_media/gambar/charger.jpg",
      username: "Eriska Setyaningtyas R",
      caption: "Ditemukan charger laptop merek asus di ruangan lab komputer 2",
      location: "Ruangan lab komputer 1",
    ),
    Post(
      imageUrl: "asset_media/gambar/mouse.jpeg",
      username: "Eriska Setyaningtyas R",
      caption:
          "Dicari mouse gaming hilang warna pink seperti pada gambar diatas",
      location: "Ruang Kelas 12",
    ),
    Post(
      imageUrl: "asset_media/gambar/handphone.jpg",
      username: "Eriska Setyaningtyas R",
      caption:
          "Ditemukan handphone iphone 13 pro max di area kantin bu tarni sudah dalam keadaan mati.",
      location: "Perpustakaan",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Informasi Akun',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.black), // Icon for logout
            onPressed: () {
              // Navigate back to MyHomePage (or perform logout action)
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
                (route) => false, // Remove all routes on the stack
              );
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          // Profile header
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.white,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage:
                      AssetImage('asset_media/gambar/icon/acc.jpeg'),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Eriska Setyaningtyas R',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '220103056',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          // Post list
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _posts.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.only(
                    left: 12.0, top: 8.0, right: 12.0, bottom: 8.0),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Post image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(_posts[index].imageUrl),
                    ),
                    // Post header
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 10.0, right: 8.0, bottom: 8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20.0,
                            backgroundImage:
                                AssetImage('asset_media/gambar/icon/acc.jpeg'),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            _posts[index].username,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    // Post caption
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 0, right: 8.0, bottom: 8.0),
                      child: Text(
                        _posts[index].caption,
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 0, right: 8.0, bottom: 8.0),
                      child: Text(
                        "Lokasi: " + _posts[index].location,
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                    // Post actions
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 8.0, right: 8.0, bottom: 10.0),
                      child: Row(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                // Add your action here
                              },
                              child: ChecklistButton(),
                            ),
                          ),
                          SizedBox(width: 12.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CommentPage()),
                              );
                            },
                            child: Icon(Icons.chat_bubble_outline,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BuatLaporanPage()),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
