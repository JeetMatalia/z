import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Zignuts Technolab",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.white, size: 38),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon:
            const Icon(Icons.notifications_none_sharp, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  'My Course',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 120,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildContainerWithText(
                          "new 100 vvat", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "100RS course", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "FDR + NDR", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "new 100 vvat", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "100RS course", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "FDR + NDR", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "new 100 vvat", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "100RS course", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "FDR + NDR", Colors.blue.withOpacity(0.7)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  'Group',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 120,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildContainerWithText(
                          "11-14 Group course", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "Group course", Colors.blue.withOpacity(0.7)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  'Private',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 120,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildContainerWithText(
                          "Full Day Time", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "Split Time", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "New Course", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "Split Time", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "Full Day Time", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "Split Time", Colors.blue.withOpacity(0.7)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  'Feature Course',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 120,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildContainerWithText(
                          "Full Day Time", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "Split Time", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "New Course", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "Split Time", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "Full Day Time", Colors.blue.withOpacity(0.7)),
                      _buildContainerWithText(
                          "Split Time", Colors.blue.withOpacity(0.7)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContainerWithText(String text, Color color) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow:
                TextOverflow.ellipsis, // Handling overflow with ellipsis
              ),
            ),
          ),
        ],
      ),
    );
  }
}