import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(context.mounted);
    print(context.widget);
    return ListView(
      children: [
        Container(
          height: 140,
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/dashboard_drawer.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12)),
          child: Text(
            'Maximize Performance',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
        )
      ],
    );
  }
}
