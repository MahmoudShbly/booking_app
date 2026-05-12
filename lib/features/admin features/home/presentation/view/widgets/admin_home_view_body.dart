import 'package:flutter/material.dart';

import 'stats_cards.dart';
import 'primary_cards.dart';
import 'providers_list.dart';

class AdminHomeViewBody extends StatelessWidget {
  const AdminHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            UsersTypeCard(),
            SizedBox(height: 10),
            PrimaryCards(),
            SizedBox(height: 16),
            ProvidersList(),
            SizedBox(height: 96),
          ],
        ),
      ),
    );
  }
}
