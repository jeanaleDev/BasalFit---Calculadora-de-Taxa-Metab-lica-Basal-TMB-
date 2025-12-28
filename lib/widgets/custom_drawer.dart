import 'package:flutter/material.dart';
import 'package:projeto_app_tmb/pages/login_page.dart';
import 'package:projeto_app_tmb/widgets/theme_data.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: AppTheme.surfaceColor),
              currentAccountPicture: CircleAvatar(
                backgroundColor: AppTheme.primaryColor,
                child: Text(
                  "BasalFit",
                  style: TextStyle(color: AppTheme.textColor),
                ),
              ),
              accountName: Text("maria"),
              accountEmail: Text("maria@maria"),
            ),
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              width: double.infinity,
              child: Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 8),
                  Text("Sair", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: Text("BasalFit"),
                    content: Text("Deseja realmente sair?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Não",
                          style: TextStyle(color: AppTheme.surfaceColor),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => LoginPage()),
                          );
                        },
                        child: Text(
                          "Sim",
                          style: TextStyle(color: AppTheme.surfaceColor),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
