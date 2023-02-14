import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'About Us',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green[500],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              child: Column(
                children: [
                  const Text('\nTeam Details\n', style: TextStyle(color: Colors.green, fontSize: 20)),
                  Card(
                    color: Colors.green[400],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.account_box,
                          color: Colors.white,
                          size: 80,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('\n\nNAME : Abdul Mubeen', style: TextStyle(color: Colors.white)),
                            Text('ID : S160549', style: TextStyle(color: Colors.white)),
                            Text('Role : Developer', style: TextStyle(color: Colors.white)),
                            Text('Contact : S160549@rguktsklm.ac.in\n\n', style: TextStyle(color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.green[400],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.account_box,
                          color: Colors.white,
                          size: 80,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('\n\nNAME : Raja Kali', style: TextStyle(color: Colors.white)),
                            Text('ID : S160688', style: TextStyle(color: Colors.white)),
                            Text('Role : Developer', style: TextStyle(color: Colors.white)),
                            Text('Contact : S160688@rguktsklm.ac.in\n\n', style: TextStyle(color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.green[400],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.supervised_user_circle_rounded,
                          color: Colors.white,
                          size: 80,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('\n\nNAME : Rajesh Govada And His Team', style: TextStyle(color: Colors.white)),
                            Text('ID : S161343', style: TextStyle(color: Colors.white)),
                            Text('Role : theroy and content Providers', style: TextStyle(color: Colors.white)),
                            Text('Contact : S161343@rguktsklm.ac.in\n\n', style: TextStyle(color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              // color: Colors.black,
              height: 30,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const Text(
                'Design and Developed by Team @ZUI\n',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      );
}
