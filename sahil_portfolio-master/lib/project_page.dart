import 'package:flutter/material.dart';
import 'my_colors.dart';
import 'project_widget.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.fromLTRB(50.0, 50.0, 60.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Projects',
            style: TextStyle(
                color: MyColors.clr2,
                fontWeight: FontWeight.bold,
                fontSize: 45.0),
          ),
          const SizedBox(height: 40.0),
          ProjectWidget(
            "▪Developed Slot Observation App.\n▪Implement Real Time Database for store the data .\n",
            "sha-256.png",
            "Flutter",
            "Slot Obeservation CHARUSAT",
            "",
            "##",
            "##",
          ),
          SizedBox(height: 40.0),
          ProjectWidget2(
            "▪Mobile app: Atlantic Ecommerce - Flutter & Dart.\n▪Database: Firestore & MongoDB - User & Listing Data .\n▪Backend: Golang - Complex Functionality.\n▪Admin Panel: ReactJS - User & Product Management.",
            "admin.png",
            "Flutter Dart MongoDB Golang ReactJS",
            "Atlantic Ecommerce App",
            "r",
            "##",
            "##",
          ),
          SizedBox(height: 40.0),
          // ProjectWidget(
          //   "▪Cloud Bucket: Simplified Go-GCS Interaction.\n▪Effortless: Upload, Retrieve, List, Delete.\n▪Efficient: Signed URL & Bulk Retrieval.",
          //   "goapi.png",
          //   "Golang GCP",
          //   "Cloud Bucket",
          //   "https://github.com/Sahil-4555/go-cloud-storage-api",
          //   "##",
          //   "##",
          // ),
          // SizedBox(height: 40.0),
          // ProjectWidget2(
          //   "▪Mobile app: Atlantic Ecommerce - Flutter & Dart.\n▪Database: Firestore & MongoDB - User & Listing Data .\n▪Backend: Golang - Complex Functionality.\n▪Admin Panel: ReactJS - User & Product Management.",
          //   "admin.png",
          //   "Flutter Dart MongoDB Golang ReactJS",
          //   "Atlantic Ecommerce App",
          //   "https://github.com/Sahil-4555/Atlantic_Ecommerce_App",
          //   "##",
          //   "##",
          // ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
