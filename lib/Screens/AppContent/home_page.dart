import 'package:flutter/material.dart';
import 'package:graduation_project/Screens/AppContent/Diagnosis_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 3; // الصفحة الحالية (افتراضيًا الصفحة الرئيسية)

  // تعريف الصفحات لكل زر
  final List<Widget> _pages = [
    const SettingsPage(),  // صفحة الإعدادات
    const MenuPage(),      // صفحة القائمة
    const ChatBotPage(),   // صفحة شات بوت
    const HomeContent(), // الصفحة الرئيسية
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          leading: IconButton(
            iconSize: 40,
            icon: const Icon(Icons.notifications_none_outlined, color: Colors.black),
            onPressed: () {}, // الإجراء عند الضغط
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "!..مرحبا بيك ",
                style: TextStyle(
                  fontFamily: "Alexandria",
                  color: Colors.blue,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                radius: 24,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'ChatBot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
        ],
        currentIndex: _currentIndex,
        iconSize: 39,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped, // التبديل بين الصفحات
      ),
    );
  }
}

// صفحة المحتوى الرئيسية
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return DiagnosisPage();
              }));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              padding: const EdgeInsets.symmetric(horizontal: 63, vertical: 27),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey.shade400),
              ),
            ),
            child: const Text(
              'تشخيص',
              style: TextStyle(
                fontFamily: "Alexandria",
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              // الإجراء عند الضغط على الزر الثاني
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 28),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey.shade400),
              ),
            ),
            child: const Text(
              'دعم ونصائح',
              style: TextStyle(
                fontFamily: "Alexandria",
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// صفحة الإعدادات
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings Page', style: TextStyle(fontSize: 24)),
    );
  }
}

// صفحة القائمة
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Menu Page', style: TextStyle(fontSize: 24)),
    );
  }
}

// صفحة شات بوت
class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  _ChatBotPageState createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final List<String> _messages = []; // قائمة الرسائل
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70 ,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: SizedBox(
          height: 70,
          width: 70,
          child: Image.asset("Photos/gradLogo1.png"), // استبدل بمسار الصورة الخاص بك
        ),
      ),
      body: Container(
        color: Colors.white, // تغيير خلفية الصفحة إلى الأبيض
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _messages[_messages.length - 1 - index],
                      style: const TextStyle(fontSize: 16),
                    ),
                    leading: const Icon(Icons.person, color: Colors.blue),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'أرسل رسالة....',
                        hintStyle: TextStyle(fontFamily: "Alexandria",),
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20), // جعل الحواف دائرية
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.blue),
                    onPressed: _sendMessage,
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
