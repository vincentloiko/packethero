import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeNetworkScreen extends StatefulWidget {
  const HomeNetworkScreen({super.key});

  @override
  State<HomeNetworkScreen> createState() => _HomeNetworkScreenState();
}

class _HomeNetworkScreenState extends State<HomeNetworkScreen> {
  bool missionAccepted = false;

  bool cableConnectedToPc = false;
  bool cableConnectedToRouter = false;

  bool inspectedPc = false;
  bool inspectedRouter = false;
  bool inspectedCable = false;

  bool internetVerified = false;
  bool missionCompleted = false;

  final FocusNode _focusNode = FocusNode();

double heroLeft = 520;
double heroTop = 500;

void _moveHero(LogicalKeyboardKey key) {
  const double step = 20;

  setState(() {
    if (key == LogicalKeyboardKey.arrowUp || key == LogicalKeyboardKey.keyW) {
      heroTop -= step;
    }

    if (key == LogicalKeyboardKey.arrowDown || key == LogicalKeyboardKey.keyS) {
      heroTop += step;
    }

    if (key == LogicalKeyboardKey.arrowLeft || key == LogicalKeyboardKey.keyA) {
      heroLeft -= step;
    }

    if (key == LogicalKeyboardKey.arrowRight || key == LogicalKeyboardKey.keyD) {
      heroLeft += step;
    }
  });
}

  void _checkMissionCompletion() {
    if (inspectedPc &&
        inspectedRouter &&
        inspectedCable &&
        cableConnectedToPc &&
        cableConnectedToRouter &&
        internetVerified) {
      missionCompleted = true;
    }
  }

  void _showMomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Mom'),
          content: const Text(
            'The Internet does not work anymore.\n\n'
            'Can you take a look in the bedroom?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  missionAccepted = true;
                });
                Navigator.pop(dialogContext);
              },
              child: const Text('Accept Mission'),
            ),
          ],
        );
      },
    );
  }

  void _showDoorDialog(BuildContext context) {
    if (!missionAccepted) {
      showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('Door'),
            content: const Text(
              'You should talk to Mom before going to the bedroom.',
            ),
            actions: [
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
      return;
    }

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Bedroom'),
          content: const Text(
            'The bedroom is now accessible.\n\n'
            'Inspect the network devices and restore Internet access.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Enter'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Network'),
      ),
      body: KeyboardListener(
  focusNode: _focusNode,
  autofocus: true,
  onKeyEvent: (event) {
    if (event is KeyDownEvent) {
      _moveHero(event.logicalKey);
    }
  },
  child: Stack(
    children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.brown.shade100,
                      border: Border.all(color: Colors.brown, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'BEDROOM',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      border: Border.all(color: Colors.orange, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'LIVING ROOM',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            left: 20,
            top: 20,
            child: Card(
              color: missionCompleted
                  ? Colors.green.shade100
                  : Colors.yellow.shade100,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      missionCompleted
                          ? 'MISSION COMPLETE'
                          : missionAccepted
                              ? 'Current Mission'
                              : 'No Mission',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      missionAccepted
                          ? 'Restore Internet access'
                          : 'Talk to Mom',
                    ),
                    if (missionCompleted) ...[
                      const SizedBox(height: 8),
                      const Text('✓ Completed'),
                    ],
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            left: 120,
            top: 100,
            child: _deviceCard(context, '💻', 'PC'),
          ),
          Positioned(
            left: 520,
            top: 130,
            child: _deviceCard(context, '📡', 'Router'),
          ),
          Positioned(
            left: 320,
            top: 230,
            child: _deviceCard(context, '🔗', 'Cable'),
          ),

          Positioned(
            left: 420,
            top: 330,
            child: _doorCard(context),
          ),

          Positioned(
            left: 120,
            top: 500,
            child: _momCard(context),
          ),
                   Positioned(
            left: heroLeft,
            top: heroTop,
            child: _heroCard(),
          ),
        ],
      ),
    ),
  );
}

  Widget _momCard(BuildContext context) {
    return InkWell(
      onTap: () => _showMomDialog(context),
      child: Card(
        color: Colors.pink.shade50,
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('👩', style: TextStyle(fontSize: 44)),
              SizedBox(height: 8),
              Text('Mom'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _doorCard(BuildContext context) {
    return InkWell(
      onTap: () => _showDoorDialog(context),
      child: Card(
        color: missionAccepted ? Colors.green.shade50 : Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                missionAccepted ? '🚪' : '🔒',
                style: const TextStyle(fontSize: 44),
              ),
              const SizedBox(height: 8),
              Text(missionAccepted ? 'Door' : 'Locked Door'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _deviceCard(BuildContext context, String icon, String title) {
    return InkWell(
      onTap: missionAccepted
          ? () {
              setState(() {
                if (title == 'PC') {
                  inspectedPc = true;

                  if (cableConnectedToPc && cableConnectedToRouter) {
                    internetVerified = true;
                  }
                }

                if (title == 'Router') {
                  inspectedRouter = true;
                }

                if (title == 'Cable') {
                  inspectedCable = true;
                }

                _checkMissionCompletion();
              });

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
                                  _checkMissionCompletion();
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
                                  _checkMissionCompletion();
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
            }
          : null,
      child: Card(
        color: missionAccepted ? null : Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(icon, style: const TextStyle(fontSize: 40)),
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
            Text('👦', style: TextStyle(fontSize: 44)),
            SizedBox(height: 8),
            Text('Hero'),
          ],
        ),
      ),
    );
  }
}