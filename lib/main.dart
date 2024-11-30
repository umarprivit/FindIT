import 'package:classico/CategoriesScreen.dart';
import 'package:classico/ProfileScreen.dart';
import 'package:classico/cart.dart';
import 'package:classico/authentication/add_details_page.dart';
import 'package:classico/authentication/add_seller_details_page.dart';
import 'package:classico/authentication/change_password_page.dart';
import 'package:classico/authentication/forgot_password_page.dart';
import 'package:classico/authentication/login_page.dart';
import 'package:classico/authentication/register_page.dart';
import 'package:classico/checkout.dart';
import 'package:classico/homescreen.dart';
import 'package:classico/sellerscreen.dart';
import 'package:classico/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      routes: {
        "/login": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),
        "/forgotpassword": (context) => const ForgotPasswordPage(),
        "/changepassword": (context) => const ChangePasswordPage(),
        "/adddetails": (context) => const AddDetailsPage(),
        "/addsellerdetails": (context) => const AddSellerDetailsPage(),
        "/cart": (context) => const Card(),
        "/profile": (context) => const ProfileScreen(),
        "/checkout": (context) => const Checkout(),
      },
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _pages = [
    const HomeScreen(),
    SellerScreen(),
    CategoriesScreen(),
    Cart(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //elevation: 8,
        title: Center(
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Find',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' IT',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 32,
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '!',
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 32,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shops',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}
