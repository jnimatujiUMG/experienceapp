import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/interests_provider.dart';
import '../widgets/interest_item.dart';
import '../widgets/progress_bar.dart';

class InterestsPage extends ConsumerWidget {
  const InterestsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final interests =
        ref.watch(interestsProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 10),

              const ProgressBar(),

              const SizedBox(height: 40),

              const Text(
                'Personalise your\nexperience',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 18),

              Text(
                'Choose your interests.',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 30),

              Expanded(
                child: ListView.builder(
                  itemCount: interests.length,
                  itemBuilder: (context, index) {

                    final item = interests[index];

                    return InterestItem(
                      item: item,
                      onTap: () {
                        ref
                            .read(
                              interestsProvider.notifier,
                            )
                            .toggleSelection(index);
                      },
                    );
                  },
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}