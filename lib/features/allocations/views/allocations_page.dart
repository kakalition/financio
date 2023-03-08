import 'package:financio/commons/enums/allocations_filter.dart';
import 'package:financio/features/allocations/views/new_allocation_sheet.dart';
import 'package:financio/features/allocations/views/allocations_filter_sheet.dart';
import 'package:financio/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:financio/financio_proviers.dart';

class AllocationsPage extends ConsumerStatefulWidget {
  const AllocationsPage({super.key});

  @override
  AllocationsPageState createState() => AllocationsPageState();
}

class AllocationsPageState extends ConsumerState<AllocationsPage> {
  AllocationsFilter category = AllocationsFilter.nameAscending;
  void applyFilter(AllocationsFilter category) {
    setState(() {
      this.category = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    final allocations = ref.watch(allocationsStreamSorted(category));

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: Icon(
          FeatherIcons.plus,
          color: Theme.of(context).colorScheme.onTertiary,
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            useRootNavigator: true,
            context: context,
            builder: (context) => Wrap(children: const [NewAllocationSheet()]),
          );
        },
      ),
      bottomNavigationBar: WidgetUtils.createNavigationBar(context),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - 58,
          ),
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
                      "Alokasi",
                      style: GoogleFonts.poppins(
                          fontSize: 36, fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => AllocationsFilterSheet(
                          category: category,
                          applyFilter: applyFilter,
                        ),
                      ),
                      icon: const Icon(Icons.filter_alt_outlined),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                ...allocations.when(
                  data: (allocations) => allocations.toAllocationChildren(),
                  error: ((error, stackTrace) => [Container()]),
                  loading: (() => [const CircularProgressIndicator()]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
