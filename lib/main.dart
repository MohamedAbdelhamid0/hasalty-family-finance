import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ✅ removed banner
      title: 'My App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginPage(),
    );
  }
}

// ================= LOGIN PAGE =================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  void _login() {
    String email = emailController.text.trim();
    String password = passwordController.text;

    // ✅ Email must start with parent or child
    final emailRegex = RegExp(r'^(parent|child).*');

    if (!emailRegex.hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Username must start with 'parent' or 'child'")),
      );
      return;
    }

    // ✅ Password check
    if (password.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password must be at least 8 characters")),
      );
      return;
    }

    if (password.isNotEmpty && !password[0].toUpperCase().contains(password[0])) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password must begin with a capital letter")),
      );
      return;
    }

    // ✅ Passed all checks
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Login successful")),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logo.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.4),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 400,
                        child: TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.purpleAccent,
                            labelText: "Username",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),

                    Center(
                      child: Container(
                        width: 400,
                        child: TextField(
                          controller: passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blueAccent,
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                        ),
                      ),

                    ),
                    SizedBox(height: 25),

                    // ✅ Centered Login Button
                    Center(
                      child: SizedBox(
                        width: 180,
                        child: ElevatedButton(
                          onPressed: _login,
                          child: Text("Login"),
                        ),
                      ),
                    ),

                    SizedBox(height: 12),

                    // ✅ Centered Sign Up Button
                    Center(
                      child: SizedBox(
                        width: 180,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SignupScreen(),
                              ),
                            );
                          },
                          child: Text("Sign Up"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ================= SIGNUP PAGE =================

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}
class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  bool _obscureText = true;


  void _signup() {
    String email = emailController.text.trim();
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    // ✅ Email must start with parent or child
    final emailRegex = RegExp(r'^(parent|child).*');

    if (!emailRegex.hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Username must start with 'parent' or 'child'"),
        ),
      );
      return;
    }

    // ✅ Password length
    if (password.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password must be at least 8 characters"),
        ),
      );
      return;
    }

    if (password.isNotEmpty && !password[0].toUpperCase().contains(password[0])) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password must begin with a capital letter")),
      );
      return;
    }

    // ✅ Passwords must match
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Passwords do not match"),
        ),
      );
      return;
    }

    // ✅ Passed all checks
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Sign up successful")),
    );

    // Optional: go back to login
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logo.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.4),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Optional: Add a title/logo
                    Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30),

                    Center(
                      child: Container(
                        width: 400,
                        child: TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.purpleAccent,
                            labelText: "Username",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),

                    Center(
                      child: Container(
                        width: 400,
                        child: TextField(
                          controller: passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blueAccent,
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                        ),
                      ),

                    ),
                    SizedBox(height: 15),

                    Center(

                      child: Container(
                        width: 400,
                        child: TextField(

                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blueAccent,
                            labelText: "Confirm Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    // ✅ Sign Up Button with fixed width
                    Container(
                      width: 200, // Fixed width instead of full width
                      child: ElevatedButton(
                        onPressed: _signup,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // ✅ Optional: Already have an account? Login button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.blue[100],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  bool isDark = false;
  String selectedTab = "Weekly"; // Controls the view logic

  @override
  Widget build(BuildContext context) {
    // Dynamic data based on selected tab
    final String totalSpent = selectedTab == "Weekly"
        ? "\$142.50"
        : selectedTab == "Monthly"
        ? "\$610.00"
        : "\$7,320.00"; // yearly

    final String spendingMsg = selectedTab == "Weekly"
        ? "Spending is up 5% this week. Adham spent more on Gaming than usual."
        : selectedTab == "Monthly"
        ? "Spending is down 2% this month."
        : "Spending is up 12% this year. Adham spent more on Travel and Gadgets.";

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF8F9FA), // Light grey background like image
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          title: const Text("Adham's Analytics", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () => setState(() => isDark = !isDark),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              /// 1. Tabs Selection
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: ["Weekly", "Monthly", "Yearly"].map((tab) {
                    bool isSelected = selectedTab == tab;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedTab = tab),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: isSelected ? [const BoxShadow(color: Colors.black12, blurRadius: 4)] : [],
                          ),
                          child: Center(
                            child: Text(
                              tab,
                              style: TextStyle(
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                color: isSelected ? Colors.black : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 15),

              /// 2. Total Spent Card
              _buildSummaryCard(totalSpent, spendingMsg),

              const SizedBox(height: 15),

              /// 3. Spending Breakdown (Donut Chart)
              _buildBreakdownCard(),

              const SizedBox(height: 15),

              /// 4. Bottom Info Tiles
              Row(
                children: [
                  _buildStatusTile(
                    color: const Color(0xFFEEF3FF),
                    iconColor: Colors.blue,
                    icon: Icons.auto_awesome,
                    label: "SAVING STAR",
                    desc: "Adham saved 20% more than usual!",
                  ),
                  const SizedBox(width: 12),
                  _buildStatusTile(
                    color: const Color(0xFFFFF6ED),
                    iconColor: Colors.orange,
                    icon: Icons.warning_amber_rounded,
                    label: "LIMIT",
                    desc: "Gaming reached 90%",
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: isDark ? Colors.black : Colors.white,
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: 3,
            elevation: 12,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.task), label: "Tasks"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.credit_card),
                  label: "Cards"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart),
                  label: "Stats"),
            ],
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                  break;
                case 1:
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskScreen()),
                );
                  break;
                case 2:
                 Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CardsScreen()),
                );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnalyticsScreen()),
                  );
                  break;
              }
            }

        ),
      ),
    );
  }

  Widget _buildSummaryCard(String amount, String msg) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total Spent", style: TextStyle(color: Colors.grey, fontSize: 16)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(8)),
                child: const Text("↗ 5%", style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold)),
              )
            ],
          ),
          Text(amount, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(msg, style: const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildBreakdownCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Spending Breakdown", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 60,
                    sections: [
                      PieChartSectionData(color: const Color(0xFF00E5BC), value: 40, showTitle: false, radius: 25),
                      PieChartSectionData(color: const Color(0xFFFFC107), value: 30, showTitle: false, radius: 25),
                      PieChartSectionData(color: const Color(0xFF8B5CF6), value: 30, showTitle: false, radius: 25),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("TOP", style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
                      Text("Gaming", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
          ),
          _buildLegendItem(const Color(0xFF00E5BC), "Gaming", "\$57.00"),
          const SizedBox(height: 12),
          _buildLegendItem(const Color(0xFFFFC107), "Food & Drink", "\$42.75"),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String title, String amount) {
    return Row(
      children: [
        CircleAvatar(radius: 6, backgroundColor: color),
        const SizedBox(width: 10),
        Text(title, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
        const Spacer(),
        Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildStatusTile({required Color color, required IconData icon, required Color iconColor, required String label, required String desc}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(height: 8),
            Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: iconColor.withOpacity(0.7))),
            const SizedBox(height: 4),
            Text(desc, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, height: 1.2)),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Huss's Card",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Family Hub", style: TextStyle(fontSize: 12)),
            ],
          ),
          actions: [
            Switch(
              value: isDark,
              onChanged: (v) => setState(() => isDark = v),
            ),
          ],
        ),

        /// ✅ FIXED SCROLL AREA (no slivers anymore)
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// CARD BALANCE
              Container(
                padding: const EdgeInsets.all(20),
                height: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF27D7B6),
                      Color(0xFF1FC8A3),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Child's Current Balance",
                          style: TextStyle(color: Colors.white70),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius:
                            BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "ACTIVE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "\$124.50",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white24,
                          child: Icon(Icons.credit_card,
                              color: Colors.white),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("Manage Card"),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// ACTION BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _ActionItem(
                      icon: Icons.attach_money,
                      label: "Allowance",
                      color: Colors.teal),
                  _ActionItem(
                      icon: Icons.account_balance_wallet,
                      label: "Top Up",
                      color: Colors.cyan),
                  _ActionItem(
                      icon: Icons.ac_unit,
                      label: "Freeze",
                      color: Colors.red),
                ],
              ),

              const SizedBox(height: 20),

              /// WEEKLY SPENDING HEADER
              Row(
                children: const [
                  Text("Weekly Spending",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text("Details",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold)),
                ],
              ),

              const SizedBox(height: 20),

              /// BALANCE TEXT
              Row(
                children: const [
                  Text("\$45.20",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Text("-12% vs last week",
                      style:
                      TextStyle(color: Colors.red)),
                ],
              ),

              const SizedBox(height: 20),

              /// MINI BAR CHART
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _bar(60, Colors.teal.shade200),
                  _bar(40, Colors.teal),
                  _bar(75, Colors.teal.shade300),
                  _bar(30, Colors.teal.shade100),
                ],
              ),

              const SizedBox(height: 30),

              /// RECENT ACTIVITY
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Recent Activity",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Text("See All",
                      style:
                      TextStyle(color: Colors.teal)),
                ],
              ),

              const SizedBox(height: 12),

              _activityCard(
                icon: Icons.local_cafe,
                title: "Starbucks",
                subtitle: "Today, 4:20 PM",
                amount: "-\$5.50",
                amountColor: isDark? Colors.teal : Colors.red,
              ),

              const SizedBox(height: 10),

              _activityCard(
                icon: Icons.account_balance_wallet,
                title: "Allowance Transfer",
                subtitle: "Yesterday, 9:00 AM",
                amount: "+\$20.00",
                amountColor: Colors.green,
              ),

              const SizedBox(height: 20),

              /// GOAL PROGRESS
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const Text("Goal: Save for Sneakers"),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 0.75,
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                    const SizedBox(height: 6),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text("75%"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

        /// NAV BAR (unchanged)
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: isDark ? Colors.black : Colors.white,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 12,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.task), label: "Tasks"),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card),
                label: "Cards"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: "Stats"),
          ],
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                  break;
                case 1:
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskScreen()),
                );
                  break;
                case 2:
                 Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CardsScreen()),
                );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnalyticsScreen()),
                  );
                  break;
              }
            }

        ),
      ),
    );
  }
}


class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _ActionItem({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

/// Activity item widget
Widget _activityCard({
  required IconData icon,
  required String title,
  required String subtitle,
  required String amount,
  required Color amountColor,
}) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.purple.shade50,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.orange.shade100,
          child: Icon(icon, color: Colors.orange),
        ),
        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(color: Colors.purple,
                      fontWeight: FontWeight.bold)),
              Text(subtitle, style: const TextStyle(fontSize: 12,color: Colors.redAccent)),
            ],
          ),
        ),

        Text(
          amount,
          style: TextStyle(
              color: amountColor,
              fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}


/// Mini bar widget
Widget _bar(double height, Color color) {
  return Container(
    width: 40,
    height: height,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(12),
    ),
  );
}


class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(

        appBar: AppBar(
          elevation: 0,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Card Status",
                  style: TextStyle(fontWeight: FontWeight.bold,overflow:TextOverflow.ellipsis)),

            ],
          ),
          actions: [
            Switch(
              value: isDark,
              onChanged: (v) {
                setState(() => isDark = v);
              },
            ),
          ],


        ),

  body: SingleChildScrollView(

    padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

    /// CARD BALANCE
          Container(
            padding: const EdgeInsets.all(20),
            height: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF27D7B6),
                  Color(0xFF1FC8A3),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TOP ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "PREPAID CARD",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    Icon(Icons.credit_card, color: Colors.white),
                  ],
                ),

                const SizedBox(height: 20),

                /// CARD NAME
                const Text(
                  "Adventure Card",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                /// CARD NUMBER
                const Text(
                  "•••• •••• •••• 4582",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 15),

                /// BOTTOM INFO
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CARD HOLDER",
                          style: TextStyle(
                              color: Colors.white70, fontSize: 10),
                        ),
                        Text(
                          "Huss JUNIOR",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "EXPIRES",
                          style: TextStyle(
                              color: Colors.white70, fontSize: 10),
                        ),
                        Text(
                          "08/27",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// 1. Main Status Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Status",
                      style: TextStyle(color: Colors.teal, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const CircleAvatar(radius: 4, backgroundColor: Colors.tealAccent),
                        const SizedBox(width: 8),
                        const Text(
                          "Active",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1C1E),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                /// Freeze Button
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBEE), // Light red
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.ac_unit, size: 16, color: Colors.redAccent),
                      SizedBox(width: 6),
                      Text(
                        "Freeze",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// 2. Grid for Limit Remaining and Spent Today
          Row(
            children: [
              _buildSmallInfoCard("LIMIT REMAINING", "EGP 1,850"),
              const SizedBox(width: 12),
              _buildSmallInfoCard("SPENT TODAY", "EGP 150"),
            ],
          ),

          const SizedBox(height: 30),

          /// 3. Regulated & Secure Section
          const Text(
            "Regulated & Secure",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1C1E),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRegulatoryIcon("CBE", "LICENSED"),
              const SizedBox(width: 30),
              _buildRegulatoryIcon("FRA", "COMPLIANT"),
            ],
          ),


        ]
  ),
    ),


        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: isDark ? Colors.black : Colors.white,
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: 2,
            elevation: 12,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.task), label: "Tasks"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.credit_card),
                  label: "Cards"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart),
                  label: "Stats"),
            ],
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                  break;
                case 1:
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskScreen()),
                );
                  break;
                case 2:
                 Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CardsScreen()),
                );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnalyticsScreen()),
                  );
                  break;
              }
            }

        ),

      ),
    );
  }
}


Widget _buildSmallInfoCard(String title, String value) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.teal.shade50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1C1E),
            ),
          ),
        ],
      ),
    ),
  );
}

/// Helper for the bottom regulatory circles
Widget _buildRegulatoryIcon(String circleText, String labelText) {
  return Column(
    children: [
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            circleText,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        labelText,
        style: const TextStyle(fontSize: 8, color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    ],
  );


}


class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor:
        darkMode ? Colors.grey[900] : const Color(0xfff3f4f6),

        /// FLOATING BUTTON
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xff27D7B6),
          onPressed: () {},
          label: const Text("+ New Task"),
        ),

        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: darkMode ? Colors.black : Colors.white,
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: 1,
            elevation: 12,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.task), label: "Tasks"),
              BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Cards"),
              BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Stats"),
            ],
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                  break;
                case 1:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TaskScreen()));
                  break;
                case 2:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CardsScreen()));
                  break;
                case 3:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AnalyticsScreen()));
                  break;
              }
            }),

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// HEADER
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/child.avif"),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Adham’s Tasks",
                            style: TextStyle(fontWeight: FontWeight.bold,color:darkMode?Colors.white: Colors.black)),
                        Text("Parent Mode",
                            style: TextStyle(fontSize: 12, color:darkMode?Colors.redAccent: Colors.grey)),
                      ],
                    ),
                    const Spacer(),

                    /// DARK MODE SWITCH
                    Switch(
                      value: darkMode,
                      onChanged: (val) {
                        setState(() => darkMode = val);
                      },
                    )
                  ],
                ),

                const SizedBox(height: 20),

                /// SUMMARY CARDS
                Row(
                  children: [
                    _summaryCard("PENDING APPROVAL", "3", "•"),
                    const SizedBox(width: 12),
                    _summaryCard("WEEKLY TOTAL", "450 EGP", ""),
                  ],
                ),

                const SizedBox(height: 20),

                /// REAL TABS (Added)
                const TabBar(
                  indicatorColor: Color(0xff27D7B6),
                  labelColor: Color(0xff27D7B6),
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: "Approve"),
                    Tab(text: "Active"),
                    Tab(text: "History"),
                  ],
                ),

                const SizedBox(height: 10),

                /// TAB CONTENT (Added)
                Expanded(
                  child: TabBarView(
                    children: [

                      /// APPROVE TAB (your original content)
                      ListView(
                        children: [
                          const Text("Pending Approval",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),

                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: darkMode
                                  ? Colors.grey[800]
                                  : Colors.white,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: const [
                                          Text("Read 10 Pages",
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          Text("Reward: 10 EGP",
                                              style: TextStyle(
                                                  color:
                                                  Color(0xff27D7B6))),
                                        ],
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(12),
                                      child: Image.asset(
                                        "assets/book.jpg",
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        style:
                                        ElevatedButton.styleFrom(
                                          backgroundColor:
                                          const Color(0xff27D7B6),
                                        ),
                                        onPressed: () {},
                                        icon: const Icon(Icons.check),
                                        label:
                                        const Text("Approve"),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: OutlinedButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.close),
                                        label:
                                        const Text("Reject"),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),

                      /// ACTIVE TAB
                      Center(child: Text("No Active Tasks now",style: TextStyle(fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,color: darkMode?Colors.white:Colors.black))),

                      /// HISTORY TAB
                      Center(child: Text("Add Tasks to have History",style: TextStyle(fontWeight: FontWeight.bold,overflow:TextOverflow.ellipsis,color: darkMode?Colors.white:Colors.black))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  /// SUMMARY CARD WIDGET
  Widget _summaryCard(
      String title, String value, String dot) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: darkMode
              ? Colors.grey[800]
              : Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 11,
                    color: darkMode?Colors.white:Colors.grey)),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(value,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:darkMode?Colors.tealAccent:Colors.black,
                        fontSize: 18)),
                if (dot.isNotEmpty)
                  const Text(" •",
                      style: TextStyle(
                          color: Colors.orange)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
