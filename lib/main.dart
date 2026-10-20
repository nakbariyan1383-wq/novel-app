
import 'package:flutter/material.dart';

void main() => runApp(const NovelApp());

// ---------------------------------------------------------------------------
// Theme & constants
// ---------------------------------------------------------------------------
const Color kCarbon = Color(0xFF121416);
const Color kCarbonLight = Color(0xFF1E2226);
const Color kCarbonCard = Color(0xFF23272C);
const Color kRed = Color(0xFFE53935);
const Color kRedDark = Color(0xFFB71C1C);
const Color kTextDim = Color(0xFF9AA0A6);

ThemeData buildTheme() {
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: kRed,
      secondary: kRed,
      surface: kCarbonLight,
      background: kCarbon,
      error: kRed,
    ),
    scaffoldBackgroundColor: kCarbon,
    appBarTheme: const AppBarTheme(
      backgroundColor: kCarbonLight,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kRed,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: kCarbonCard,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: kRed, width: 1.5),
      ),
      labelStyle: const TextStyle(color: kTextDim),
      prefixIconColor: kTextDim,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kCarbonLight,
      selectedItemColor: kRed,
      unselectedItemColor: kTextDim,
      type: BottomNavigationBarType.fixed,
    ),
    cardTheme: CardTheme(
      color: kCarbonCard,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: kRedDark,
      labelStyle: const TextStyle(color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
  return base;
}

// ---------------------------------------------------------------------------
// Mock data models
// ---------------------------------------------------------------------------
class Novel {
  final String title;
  final String author;
  final String coverHex;
  final double rating;
  final int chapters;
  final String price;
  final String category;
  final String synopsis;

  const Novel({
    required this.title,
    required this.author,
    required this.coverHex,
    required this.rating,
    required this.chapters,
    required this.price,
    required this.category,
    required this.synopsis,
  });

  Color get cover => Color(int.parse('FF$coverHex', radix: 16));
}

class Chapter {
  final int number;
  final String title;
  final bool paid;
  const Chapter(this.number, this.title, {this.paid = false});
}

class Ticket {
  final String subject;
  final String status;
  final String date;
  const Ticket(this.subject, this.status, this.date);
}

// ---------------------------------------------------------------------------
// Mock repository
// ---------------------------------------------------------------------------
class MockData {
  static const completed = [
    Novel(title: 'شب‌های خونین ولف', author: 'آرمان صدر', coverHex: 'B71C1C', rating: 4.8, chapters: 240, price: 'رایگان', category: 'اکشن', synopsis: 'در شهری که شب هرگز تمام نمی‌شود، یک شکارچی جایزه‌بگیر با گذشته‌ای خونین باید آخرین نبردش را بجوید.'),
    Novel(title: 'بازگشت به بلاک‌سیتی', author: 'نیلوفر رضایی', coverHex: '00695C', rating: 4.6, chapters: 180, price: '۴۵,۰۰۰ تومان', category: 'ماجراجویی', synopsis: 'جهانی پیکسلی و وارفته؛ قهرمان ما برای نجات سرور اصلی وارد بازی می‌شود.'),
    Novel(title: 'قلعه سایه‌ها', author: 'سامان کاویانی', coverHex: '4A148C', rating: 4.7, chapters: 310, price: '۸۰,۰۰۰ تومان', category: 'فانتزی تاریک', synopsis: 'قلعه‌ای که هر شب نقشه‌اش عوض می‌شود و پادشاهش رازی مرگبار دارد.'),
    Novel(title: 'مسیر اسپیدران', author: 'هومن فرخی', coverHex: 'AD1457', rating: 4.4, chapters: 150, price: '۳۰,۰۰۰ تومان', category: 'مسابقه‌ای', synopsis: 'دنیای مسابقات غیرقانونی زیرزمینی و راننده‌ای که چیزی برای از دست دادن ندارد.'),
  ];

  static const online = [
    Novel(title: 'ضربه نهایی: فصل دوم', author: 'آرمان صدر', coverHex: 'E53935', rating: 4.9, chapters: 96, price: '۱۰۰۰ سکه / فصل', category: 'اکشن', synopsis: 'ادامه ماجرای شب‌های خونین؛ هر هفته سه فصل جدید منتشر می‌شود.'),
    Novel(title: 'دنیای بعد از کرش', author: 'مریم آذرپاد', coverHex: '0277BD', rating: 4.5, chapters: 64, price: '۵۰۰ سکه / فصل', category: 'علمی‌تخیلی', synopsis: 'بعد از فروپاشی سرور مادر، بازیکنان در دنیایی واقعی گرفتار می‌شوند.'),
    Novel(title: 'افسانه دراگون‌اسلایر', author: 'پویا نکویی', coverHex: '2E7D32', rating: 4.6, chapters: 88, price: '۸۰۰ سکه / فصل', category: 'فانتزی', synopsis: 'شکارچی اژدها با اژدهایی هم‌پیمان می‌شود تا پادشاهی دروغین را سرنگون کند.'),
  ];

  static const presale = [
    Novel(title: 'کرونوس: صفر مطلق', author: 'سامان کاویانی', coverHex: 'FF8F00', rating: 0, chapters: 0, price: 'پیش‌فروش: ۹۹,۰۰۰ تومان', category: 'علمی‌تخیلی', synopsis: 'کنترل زمان به دست کسی می‌افتد که نباید؛ نسخه کامل به‌زودی منتشر می‌شود.',),
    Novel(title: 'پروژه نئون‌شیطان', author: 'نیلوفر رضایی', coverHex: '512DA8', rating: 0, chapters: 0, price: 'پیش‌فروش: ۷۵,۰۰۰ تومان', category: 'سایبرپانک', synopsis: 'در کلان‌شهری نئونی، یک هکر باید خاطرات گم‌شده خود را بخرد.',),
  ];

  static const chapters = [
    Chapter(101, 'تنگنای نهایی', paid: true),
    Chapter(100, 'پیمان شکسته'),
    Chapter(99, 'شکار در مه'),
    Chapter(98, 'قلب آهنین', paid: true),
    Chapter(97, 'آستانه مرگ'),
    Chapter(96, 'بازی دو نفره'),
  ];

  static const sampleText = List.filled(
    6,
    'پاراگراف نمونه: سردتر از همیشه بود؛ صدای باد میان آجرهای کهنه می‌پیچید و او می‌دانست که این شب با شب‌های دیگر فرق دارد. دست به قبضه‌اش برد و نفس عمیقی کشید. دورتر، نئون‌های بازار دوشاخه سوسو می‌زدند و انگار شهر نیز منتظر آغاز نبرد بود.',
  ).join('\n\n');

  static const tickets = [
    Ticket('خطا در خرید فصل ۹۸', 'پاسخ داده شده', '۱۴۰۳/۰۳/۱۲'),
    Ticket('درخواست استرداد سکه', 'در بررسی', '۱۴۰۳/۰۳/۱۰'),
    Ticket('پیشنهاد حالت شب خودکار', 'بسته شده', '۱۴۰۳/۰۲/۲۸'),
  ];
}

// ---------------------------------------------------------------------------
// Root widget
// ---------------------------------------------------------------------------
class NovelApp extends StatelessWidget {
  const NovelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'رومان‌ورس',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/login': (_) => const LoginScreen(),
        '/home': (_) => const HomeScreen(),
        '/support': (_) => const TicketListScreen(),
        '/profile': (_) => const ProfileScreen(),
        '/upgrade': (_) => const UpgradeScreen(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/novel':
            return MaterialPageRoute(
              builder: (_) => NovelDetailsScreen(novel: settings.arguments as Novel),
            );
          case '/onlineNovel':
            return MaterialPageRoute(
              builder: (_) => OnlineChaptersScreen(novel: settings.arguments as Novel),
            );
          case '/reader':
            final args = settings.arguments as Map;
            return MaterialPageRoute(
              builder: (_) => ReaderScreen(
                novel: args['novel'] as Novel,
                chapter: args['chapter'] as Chapter?,
              ),
            );
        }
        return null;
      },
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child!,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Splash
// ---------------------------------------------------------------------------
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..forward();
  late final Animation<double> _fade =
      CurvedAnimation(parent: _c, curve: Curves.easeIn);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2400), () {
      if (mounted) Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kCarbon, kRedDark, kCarbon],
          ),
        ),
        child: FadeTransition(
          opacity: _fade,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 108,
                  height: 108,
                  decoration: BoxDecoration(
                    color: kRed,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: const [
                      BoxShadow(color: kRed, blurRadius: 40, spreadRadius: 2),
                    ],
                  ),
                  child: const Icon(Icons.menu_book_rounded,
                      size: 56, color: Colors.white),
                ),
                const SizedBox(height: 24),
                const Text('رومان‌ورس',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.black,
                        color: Colors.white)),
                const SizedBox(height: 8),
                const Text('جهان رمان‌های گیمینگ',
                    style: TextStyle(color: kTextDim)),
                const SizedBox(height: 32),
                const SizedBox(
                  width: 28,
                  height: 28,
                  child: CircularProgressIndicator(
                      strokeWidth: 3, color: kRed),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Login
// ---------------------------------------------------------------------------
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ورود به حساب')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.sports_esports_rounded,
                  size: 64, color: kRed),
              const SizedBox(height: 8),
              const Text('خوش برگشتی!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              const TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'شماره موبایل',
                  prefixIcon: Icon(Icons.phone_android_rounded),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'رمز عبور',
                  prefixIcon: Icon(Icons.lock_rounded),
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('فراموشی رمز؟',
                      style: TextStyle(color: kTextDim)),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                child: const Text('ورود'),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('حساب نداری؟', style: TextStyle(color: kTextDim)),
                  TextButton(
                    onPressed: () {},
                    child: const Text('ثبت‌نام', style: TextStyle(color: kRed)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Home with 3 tabs
// ---------------------------------------------------------------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('رومان‌ورس',
              style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              icon: const Icon(Icons.search_rounded),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            indicatorColor: kRed,
            labelColor: Colors.white,
            unselectedLabelColor: kTextDim,
            tabs: [
              Tab(text: 'رمان‌های تکمیل‌شده'),
              Tab(text: 'رمان‌های آنلاین'),
              Tab(text: 'پیش‌فروش'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CompletedTab(),
            OnlineTab(),
            PresaleTab(),
          ],
        ),
        bottomNavigationBar: const AppBottomNav(currentIndex: 0),
      ),
    );
  }
}

class CompletedTab extends StatelessWidget {
  const CompletedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (final n in MockData.completed)
          NovelCard(novel: n, onTap: () => Navigator.pushNamed(context, '/novel', arguments: n)),
      ],
    );
  }
}

class OnlineTab extends StatelessWidget {
  const OnlineTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (final n in MockData.online)
          NovelCard(
            novel: n,
            badge: 'آنلاین',
            onTap: () => Navigator.pushNamed(context, '/onlineNovel', arguments: n),
          ),
      ],
    );
  }
}

class PresaleTab extends StatelessWidget {
  const PresaleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (final n in MockData.presale)
          NovelCard(
            novel: n,
            badge: 'پیش‌فروش',
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('پرداخت پیش‌فروش در نسخه نهایی فعال می‌شود')),
            ),
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Novel card
// ---------------------------------------------------------------------------
class NovelCard extends StatelessWidget {
  final Novel novel;
  final String? badge;
  final VoidCallback onTap;
  const NovelCard({super.key, required this.novel, this.badge, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                width: 96,
                height: 128,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [novel.cover, novel.cover.withOpacity(0.55)],
                  ),
                ),
                child: const Icon(Icons.auto_stories_rounded,
                    color: Colors.white70, size: 36),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(novel.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                          if (badge != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: kRed,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(badge!,
                                  style: const TextStyle(
                                      fontSize: 11, color: Colors.white)),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(novel.author,
                          style: const TextStyle(color: kTextDim, fontSize: 13)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star_rounded,
                              color: Colors.amber, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            novel.rating > 0 ? novel.rating.toString() : 'جدید',
                            style: const TextStyle(fontSize: 13),
                          ),
                          const SizedBox(width: 12),
                          if (novel.chapters > 0)
                            Text('${novel.chapters} فصل',
                                style:
                                    const TextStyle(fontSize: 13, color: kTextDim)),
                          const Spacer(),
                          Text(novel.price,
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: kRed,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Novel details
// ---------------------------------------------------------------------------
class NovelDetailsScreen extends StatelessWidget {
  final Novel novel;
  const NovelDetailsScreen({super.key, required this.novel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(novel.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: LinearGradient(
                    colors: [novel.cover, novel.cover.withOpacity(0.5)],
                  ),
                ),
                child: const Icon(Icons.auto_stories_rounded,
                    color: Colors.white70, size: 44),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(novel.title,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text('نویسنده: ${novel.author}',
                        style: const TextStyle(color: kTextDim)),
                    const SizedBox(height: 8),
                    Chip(label: Text(novel.category)),
                    if (novel.chapters > 0)
                      Text('${novel.chapters} فصل • امتیاز ${novel.rating}',
                          style: const TextStyle(color: kTextDim)),
                    const SizedBox(height: 8),
                    Text(novel.price,
                        style: const TextStyle(
                            color: kRed,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('خلاصه داستان',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(novel.synopsis,
              style: const TextStyle(height: 1.8, color: kTextDim)),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushNamed(context, '/onlineNovel',
                arguments: novel),
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('شروع خواندن'),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Online chapters list
// ---------------------------------------------------------------------------
class OnlineChaptersScreen extends StatelessWidget {
  final Novel novel;
  const OnlineChaptersScreen({super.key, required this.novel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('فصل‌های ${novel.title}')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: MockData.chapters.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, i) {
          final ch = MockData.chapters[i];
          return Card(
            child: ListTile(
              onTap: () {
                if (ch.paid) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'فصل ${ch.number} پولی است — خرید در نسخه نهایی فعال می‌شود')));
                } else {
                  Navigator.pushNamed(context, '/reader',
                      arguments: {'novel': novel, 'chapter': ch});
                }
              },
              leading: CircleAvatar(
                backgroundColor: ch.paid ? kRedDark : kRed,
                child: Icon(
                  ch.paid ? Icons.lock_rounded : Icons.menu_book_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: Text('فصل ${ch.number}: ${ch.title}'),
              trailing: Text(
                ch.paid ? 'پولی' : 'رایگان',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: ch.paid ? kRed : Colors.greenAccent,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Reader
// ---------------------------------------------------------------------------
class ReaderScreen extends StatefulWidget {
  final Novel novel;
  final Chapter? chapter;
  const ReaderScreen({super.key, required this.novel, this.chapter});

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  double _fontSize = 18;
  bool _nightMode = false;

  @override
  Widget build(BuildContext context) {
    final bg = _nightMode ? Colors.black : kCarbonLight;
    final fg = _nightMode ? Colors.grey.shade300 : Colors.grey.shade200;
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        title: Text(widget.chapter != null
            ? 'فصل ${widget.chapter!.number}: ${widget.chapter!.title}'
            : widget.novel.title),
        actions: [
          IconButton(
            icon: Icon(_nightMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
            tooltip: 'حالت شب',
            onPressed: () => setState(() => _nightMode = !_nightMode),
          ),
          IconButton(
            icon: const Icon(Icons.text_increase_rounded),
            tooltip: 'افزایش فونت',
            onPressed: () => setState(() => _fontSize = (_fontSize + 2).clamp(12, 32)),
          ),
          IconButton(
            icon: const Icon(Icons.text_decrease_rounded),
            tooltip: 'کاهش فونت',
            onPressed: () => setState(() => _fontSize = (_fontSize - 2).clamp(12, 32)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.novel.title,
              style: TextStyle(
                  color: kRed, fontSize: _fontSize + 6, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              MockData.sampleText,
              style: TextStyle(color: fg, fontSize: _fontSize, height: 2),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Bottom navigation
// ---------------------------------------------------------------------------
class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  const AppBottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (i) {
        switch (i) {
          case 0:
            Navigator.pushNamed(context, '/profile');
            break;
          case 1:
            Navigator.pushNamed(context, '/support');
            break;
          case 2:
            Navigator.pushNamed(context, '/upgrade');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'نمایه'),
        BottomNavigationBarItem(
            icon: Icon(Icons.support_agent_rounded), label: 'پشتیبانی'),
        BottomNavigationBarItem(
            icon: Icon(Icons.workspace_premium_rounded), label: 'ارتقای حساب'),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Ticket list
// ---------------------------------------------------------------------------
class TicketListScreen extends StatelessWidget {
  const TicketListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تیکت‌های پشتیبانی')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kRed,
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ارسال تیکت جدید در نسخه نهایی فعال می‌شود')),
        ),
        child: const Icon(Icons.add_rounded, color: Colors.white),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: MockData.tickets.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, i) {
          final t = MockData.tickets[i];
          return Card(
            child: ListTile(
              title: Text(t.subject),
              subtitle: Text(t.date, style: const TextStyle(color: kTextDim)),
              trailing: Chip(label: Text(t.status, style: const TextStyle(fontSize: 12))),
            ),
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Profile
// ---------------------------------------------------------------------------
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('نمایه کاربری')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: kRedDark,
            child: Icon(Icons.person_rounded, size: 44, color: Colors.white),
          ),
          const SizedBox(height: 12),
          const Center(
              child: Text('گیمر_۲۴۷',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          const Center(child: Text('۱٬۲۵۰ سکه', style: TextStyle(color: kRed))),
          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(Icons.menu_book_rounded, color: kRed),
            title: const Text('کتابخانه من'),
            trailing: const Icon(Icons.chevron_left),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.download_rounded, color: kRed),
            title: const Text('دانلودها'),
            trailing: const Icon(Icons.chevron_left),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_rounded, color: kRed),
            title: const Text('تنظیمات'),
            trailing: const Icon(Icons.chevron_left),
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
    );
  }
}

// ---------------------------------------------------------------------------
// Upgrade
// ---------------------------------------------------------------------------
class UpgradeScreen extends StatelessWidget {
  const UpgradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ارتقای حساب')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('اشتراک ویژه رمان‌ورس',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          for (final plan in [
            {'name': 'ماهانه', 'price': '۹۹,۰۰۰ تومان'},
            {'name': 'شش‌ماهه', 'price': '۴۹۹,۰۰۰ تومان'},
            {'name': 'سالانه', 'price': '۸۹۹,۰۰۰ تومان'},
          ])
            Card(
              child: ListTile(
                leading: const Icon(Icons.workspace_premium_rounded, color: kRed),
                title: Text(plan['name']!),
                subtitle: const Text('دسترسی نامحدود به فصل‌های پولی'),
                trailing: Text(plan['price']!,
                    style: const TextStyle(color: kRed, fontWeight: FontWeight.bold)),
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('پرداخت در نسخه نهایی فعال می‌شود')),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 2),
    );
  }
}
