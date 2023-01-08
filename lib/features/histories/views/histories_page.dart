import 'package:financio/features/histories/providers/histories_providers.dart';
import 'package:financio/features/histories/views/histories_content.dart';
import 'package:financio/features/histories/views/histories_filter_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoriesPage extends ConsumerWidget {
  const HistoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final histories = ref.watch(rangedHistoriesStream);

    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Histories",
                  style: GoogleFonts.poppins(
                      fontSize: 36, fontWeight: FontWeight.w500),
                ),
                IconButton(
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useRootNavigator: true,
                    builder: (BuildContext context) =>
                        Wrap(children: const [HistoriesFilterSheet()]),
                  ),
                  icon: const Icon(Icons.filter_alt_outlined),
                )
              ],
            ),
            const SizedBox(height: 24),
            histories.when(
              data: ((data) => HistoriesContent(histories: data)),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
