import 'package:flutter/material.dart';

void main() => runApp(const NovelApp());

const kCarbon = Color(0xFF141414);
const kCarbonLight = Color(0xFF1E1E1E);
const kRed = Color(0xFFE53935);

class NovelApp extends StatelessWidget {
  const NovelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Novel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kCarbon,
        colorScheme: const ColorScheme.dark(
          primary: kRed,
          secondary: kRed,
          surface: kCarbonLight,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: kCarbonLight,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class Novel {
  final String title, author, desc;
  final int chapters;
  const Novel(this.title, this.author, this.desc, this.chapters);
}

const novels = <Novel>[
  Novel('سایه‌ی اژدها', 'آرش کمانگیر', 'داستانی تاریک در دنیای جنگ و خون...', 120),
  Novel('شب بی‌ستاره', 'مریم شب', 'رمانی عاشقانه با پایان نامعلوم...', 85),
  Novel('کربن سیاه', 'دیجی ریدر', 'در آینده‌ای دیستوپیایی...', 210),
  Novel('آخرین نبرد', 'کاوه تیرانداز', 'حماسه‌ای برای نجات آخرین شهر...', 156),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('NovelApp', style: TextStyle(fontWeight: FontWeight.bold)),
          bottom: const TabBar(
            indicatorColor: kRed,
            tabs: [Tab(text: 'همه'), Tab(text: 'در حال خواندن'), Tab(text: 'علاقه‌مندی')],
          ),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
          ],
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: novels.length,
              itemBuilder: (context, i) {
                final n = novels[i];
                return Card(
                  color: kCarbonLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: const BorderSide(color: Color(0xFF2A2A2A)),
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 56, height: 72,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [kRed, Colors.black]),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.menu_book, color: Colors.white),
                    ),
                    title: Text(n.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('\${n.author} • \${n.chapters} فصل',
                        style: const TextStyle(color: Colors.grey)),
                    trailing: const Icon(Icons.chevron_right, color: kRed),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ReaderPage(novel: n))),
                  ),
                );
              },
            ),
            const Center(child: Text('هنوز چیزی نمی‌خوانید', style: TextStyle(color: Colors.grey))),
            const Center(child: Text('لیست علاقه‌مندی خالی است', style: TextStyle(color: Colors.grey))),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kRed,
          child: const Icon(Icons.auto_stories),
          onPressed: () {},
        ),
      ),
    );
  }
}

class ReaderPage extends StatefulWidget {
  final Novel novel;
  const ReaderPage({super.key, required this.novel});
  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  double _fontSize = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.novel.title),
        actions: [
          IconButton(icon: const Icon(Icons.text_decrease), onPressed: () => setState(() => _fontSize -= 2)),
          IconButton(icon: const Icon(Icons.text_increase), onPressed: () => setState(() => _fontSize += 2)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            widget.novel.desc * 3 +
                ' اینجا متن فصل اول قرار می‌گیرد. می‌توانید محتوای واقعی رمان را اینجا بارگذاری کنید.',
            style: TextStyle(fontSize: _fontSize, height: 1.9, color: Colors.white70),
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}
