import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ui_kit/ui_kit.dart';

/// GoatCounter site code. Visits are recorded by the script in web/index.html (keep both in sync);
/// the full visit log (referrers, browsers, countries per day) lives at https://binhhoit.goatcounter.com.
const kGoatCounterCode = 'binhhoit';

/// Total visitors for the whole site, from GoatCounter's public counter API.
/// Returns null when the counter is unavailable (site not set up, network error, ...).
Future<String?> fetchTotalViews() async {
  try {
    final res = await http
        .get(Uri.parse('https://$kGoatCounterCode.goatcounter.com/counter/TOTAL.json'))
        .timeout(const Duration(seconds: 8));
    if (res.statusCode != 200) return null;
    final count = (jsonDecode(res.body) as Map<String, dynamic>)['count'];
    return count?.toString();
  } catch (_) {
    return null;
  }
}

/// Small, low-key view counter for the bottom-right corner. Renders nothing until a count is available.
class ViewCounter extends StatefulWidget {
  final Future<String?> Function() load;

  const ViewCounter({super.key, this.load = fetchTotalViews});

  @override
  State<ViewCounter> createState() => _ViewCounterState();
}

class _ViewCounterState extends State<ViewCounter> {
  late final Future<String?> _count = widget.load();

  @override
  Widget build(BuildContext context) => FutureBuilder<String?>(
        future: _count,
        builder: (context, snap) {
          final count = snap.data;
          if (count == null) return const SizedBox.shrink();
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: UIColor.white.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.visibility_outlined, size: 12, color: UIColor.textFaint),
              const SizedBox(width: 4),
              Text('$count views', style: AppTextStyle.small.copyWith(fontSize: 11, color: UIColor.textFaint)),
            ]),
          );
        },
      );
}
