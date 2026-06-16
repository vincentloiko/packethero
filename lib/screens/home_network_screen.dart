import 'package:flutter/material.dart';

class HomeNetworkScreen extends StatefulWidget {
  const HomeNetworkScreen({super.key});

  @override
  State<HomeNetworkScreen> createState() => _HomeNetworkScreenState();
}

class _HomeNetworkScreenState extends State<HomeNetworkScreen> {
  bool cableConnectedToPc = false;
  bool cableConnectedToRouter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Network'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 100,
            top: 150,
            child: _deviceCard(context, '💻', 'PC'),
          ),
          Positioned(
            left: 500,
            top: 250,
            child: _deviceCard(context, '📡', 'Router'),
          ),
          Positioned(
            left: 250,
            top: 400,
            child: _deviceCard(context, '🔗', 'Cable'),
          ),
          Positioned(
            left: 350,
            top: 220,
            child: _heroCard(),
          ),
        ],
      ),
    );
  }

  Widget _deviceCard(BuildContext context, String icon, String title) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return StatefulBuilder(
              builder: (dialogContext, setDialogState) {
                return AlertDialog(
                  title: Text(_getDeviceTitle(title)),
                  content: Text(_getDeviceDescription(title)),
                  actions: [
                    if (title == 'Cable')
                      TextButton(
                        onPressed: () {
                          setState(() {
                            cableConnectedToPc = !cableConnectedToPc;
                          });
                          setDialogState(() {});
                        },
                        child: Text(
                          cableConnectedToPc
                              ? 'Disconnect from PC'
                              : 'Connect to PC',
                        ),
                      ),
                    if (title == 'Cable')
                      TextButton(
                        onPressed: () {
                          setState(() {
                            cableConnectedToRouter =
                                !cableConnectedToRouter;
                          });
                          setDialogState(() {});
                        },
                        child: Text(
                          cableConnectedToRouter
                              ? 'Disconnect from Router'
                              : 'Connect to Router',
                        ),
                      ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(dialogContext);
                      },
                      child: const Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                icon,
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 8),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  String _getDeviceTitle(String device) {
    switch (device) {
      case 'PC':
        return 'Mom\'s PC';

      case 'Router':
        return 'Home Router';

      case 'Cable':
        return 'Ethernet Cable';

      default:
        return device;
    }
  }

  String _getDeviceDescription(String device) {
    switch (device) {
      case 'PC':
        return '''
Family desktop computer.

Status: Powered On
Internet: ${cableConnectedToPc && cableConnectedToRouter ? 'Connected' : 'No'}
''';

      case 'Router':
        return '''
Wireless router used by the family.

Status: Powered On
''';

      case 'Cable':
        return '''
Network cable connecting the PC to the router.

PC side: ${cableConnectedToPc ? 'Connected' : 'Disconnected'}
Router side: ${cableConnectedToRouter ? 'Connected' : 'Disconnected'}
''';

      default:
        return 'Unknown device';
    }
  }

  Widget _heroCard() {
    return Card(
      color: Colors.blue.shade50,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '👦',
              style: TextStyle(fontSize: 44),
            ),
            SizedBox(height: 8),
            Text('Hero'),
          ],
        ),
      ),
    );
  }
}