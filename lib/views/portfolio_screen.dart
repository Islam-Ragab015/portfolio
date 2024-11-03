import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/social_icon.dart';
import '../widgets/custom_divider.dart';
import '../constants.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Islam Elsherif - Portfolio'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    'https://user-images.githubusercontent.com/5713670/87202985-820dcb80-c2b6-11ea-9f56-7ec461c497c3.gif'),
              ),
              const SizedBox(height: 16),
              const Text(
                "I'm Islam Elsherif",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Software Engineer | Mobile App Developer | Intern @ DEPI",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const CustomDivider(),
              const SizedBox(height: 20),
              const Text(
                "Connect with Me",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIcon(
                      iconPath: 'assets/icons/github.svg', url: githubUrl),
                  SizedBox(width: 10),
                  SocialIcon(
                      iconPath: 'assets/icons/LinkedIn.svg', url: linkedinUrl),
                  SizedBox(width: 10),
                  SocialIcon(
                      iconPath: 'assets/icons/upwork.svg', url: upworkUrl),
                  SizedBox(width: 10),
                  SocialIcon(
                      iconPath: 'assets/icons/Facebook.svg', url: facebookUrl),
                ],
              ),
              const SizedBox(height: 20),
              const CustomDivider(),
              const SizedBox(height: 20),
              const Text(
                "📄 My Resume",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "🌟 Interested in my journey? Download my resume!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Column(
                children: [
                  ResumeDownloadButton(
                    url:
                        'https://drive.usercontent.google.com/download?id=11R4PcXQYOCtYlV2NJ1x5JvzvySmIWEx7&export=download',
                    label: "📥 Download as PDF",
                  ),
                  ResumeDownloadButton(
                    url:
                        'https://drive.usercontent.google.com/download?id=17P1qE9crhEuv9c2qv7L2j-zZExX6u4lc&export=download',
                    label: "📥 Download as DOCX",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "View my resume:",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Link to Google Drive for resume
                  LinkWidget(
                      url:
                          'https://drive.google.com/drive/folders/11ATSzyw-cuNiW1_TzcsJfl9aqcMPCQvP?usp=sharing'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResumeDownloadButton extends StatelessWidget {
  final String url;
  final String label;

  const ResumeDownloadButton(
      {super.key, required this.url, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Text(
        label,
        style: const TextStyle(color: Colors.blue),
      ),
    );
  }
}

class LinkWidget extends StatelessWidget {
  final String url;

  const LinkWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[800],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: const Text(
          "View My Resume",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
