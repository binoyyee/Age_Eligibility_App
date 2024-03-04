import 'package:age_eligibility_app/providers/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: ChangeNotifierProvider<HomePageProvider>(
            create: (context) => HomePageProvider(),
            child: Consumer<HomePageProvider>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (provider.eligibilityMessage.toString()),
                      style: TextStyle(
                          color: (provider.isEligible == true
                              ? Colors.green
                              : Colors.red)),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Enter your age",
                      ),
                      onChanged: (value) {
                        provider.checkEligibility(int.parse(value));
                      },
                    ),
                  ],
                );
              },
            )),
      )),
    );
  }
}
