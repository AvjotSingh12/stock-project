import 'package:flutter/material.dart';
import 'package:stocksproject/screen/page.dart';

class CustomNavBarScreen extends StatefulWidget {
  @override
  _CustomNavBarScreenState createState() => _CustomNavBarScreenState();
}

class _CustomNavBarScreenState extends State<CustomNavBarScreen> {
  int _selectedIndex = 0;
  List<String> _currentList = ['Initial Item'];

  final List<String> _listA = ['Item A1', 'Item A2', 'Item A3'];
  final List<String> _listB = ['Item B1', 'Item B2', 'Item B3'];
  final List<String> _listC = ['Item C1', 'Item C2', 'Item C3'];

  final List<Widget> _pages = [
    Center(child: Text('Home Page', style: TextStyle(fontSize: 25))),
    Center(child: Text('Search Page', style: TextStyle(fontSize: 25))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 25))),
    TopGainersPage(), 
    TopLosersPage(), 
  ];

  void _updateList(List<String> newList) {
    setState(() {
      _currentList = newList;
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _selectedFunction = "None";

  void _function1() {
    setState(() {
      _selectedFunction = "Function 1";
    });
  }

  void _function2() {
    setState(() {
      _selectedFunction = "Function 2";
    });
  }

  void _function3() {
    setState(() {
      _selectedFunction = "Function 3";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1b1c30),
      body: SafeArea(
        child: Column(
          children: [
            // Main content
            Container(
              height: 150,
              width: 390,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0XFFf77954),
                    Color(0XFF9f4df6),
                    Color(0XFF7b7ef9),
                    Color(0XFF639efa),
                  ],
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/stock.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Horizontal scrolling buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                      onTap: () => {_updateList(_listA)},
                      child: Button(
                        isselect: true,
                        txt: "Top Trading",
                        c: Colors.white,
                      )),
                  InkWell(
                      onTap: () => {_updateList(_listA)},
                      child: Button(
                        isselect: true,
                        txt: "Top Gainers",
                        c: Colors.green,
                      )),
                  InkWell(
                      onTap: () => {_updateList(_listB)},
                      child: Button(
                        isselect: true,
                        txt: "Top Losers",
                        c: Colors.red,
                      )),
                  Button(isselect: true, txt: "Top Trending"),
                ],
              ),
            ),

            // List View for current items
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 490, // Adjust the height as needed
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 59, 74, 100),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView.builder(
                  itemCount: _currentList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        _currentList[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),

            // Custom Bottom Navigation Bar with cut-out effect
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Background bar with cut-out
                ClipPath(
                  clipper: NavBarClipper(_selectedIndex),
                  child: Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 61, 63, 94),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(0, 3), // Shadow effect
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => _onTabTapped(0),
                          child: _buildNavItem(
                            icon: Icons.home,
                            isSelected: _selectedIndex == 0,
                            label: 'Home',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _onTabTapped(1),
                          child: _buildNavItem(
                            icon: Icons.search,
                            isSelected: _selectedIndex == 1,
                            label: 'Coach',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _onTabTapped(2),
                          child: _buildNavItem(
                            icon: Icons.stadium,
                            isSelected: _selectedIndex == 2,
                            label: 'Play',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _onTabTapped(3),
                          child: _buildNavItem(
                            icon: Icons.cases,
                            isSelected: _selectedIndex == 3,
                            label: 'Portfolio',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Floating Circle for selected item
                Positioned(
                  bottom: 40, // Position the circle above the cut-out
                  left: _selectedIndex * MediaQuery.of(context).size.width / 4 +
                      MediaQuery.of(context).size.width / 8 -
                      25, // Position the circle
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [
                          Color(0XFFf77954),
                          Color(0XFF9f4df6),
                          Color(0XFF7b7ef9),
                          Color(0XFF639efa),
                        ],
                      ),
                    ),
                    child: Icon(
                      _getSelectedIcon(),
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getSelectedIcon() {
    switch (_selectedIndex) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.search;
      case 2:
        return Icons.person;
      case 3:
      default:
        return Icons.dashboard;
    }
  }

  Widget _buildNavItem({
    required IconData icon,
    required bool isSelected,
    required String label,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 24,
          color: isSelected
              ? Colors.transparent
              : Colors.white, // Hide icon if selected
        ),
        SizedBox(height: 2), // Space between icon and label
        Text(
          label,
          style: TextStyle(
            color: isSelected
                ? Colors.transparent
                : Colors.white, // Hide label if selected
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  final bool isselect;
  final String txt;
  final Color c;

  const Button({
    this.c = Colors.white,
    this.isselect = false,
    this.txt = "",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isselect)
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: 40,
          width: 130,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                txt,
                style: TextStyle(color: c),
              ),
            ),
          ),
        ),
      );
    else
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0XFFf77954),
                    Color(0XFF9f4df6),
                    Color(0XFF7b7ef9),
                    Color(0XFF639efa),
                  ])),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                txt,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      );
  }
}

class NavBarClipper extends CustomClipper<Path> {
  final int selectedIndex;

  NavBarClipper(this.selectedIndex);

  @override
  Path getClip(Size size) {
    final double itemWidth = size.width / 4;
    final double centerX = selectedIndex * itemWidth + itemWidth / 2;
    final double cutoutRadius = 40; // Increased radius for deeper cutout
    final double curveHeight = 80;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(centerX - cutoutRadius, 0)
      ..quadraticBezierTo(centerX, curveHeight, centerX + cutoutRadius, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
