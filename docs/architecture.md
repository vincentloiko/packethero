# PacketHero - Technical Architecture

## Objective

Keep the Flutter project clean, modular and easy to extend.

PacketHero must not be built entirely inside `main.dart`.

The project should be structured so that future AI agents, developers or an orchestrator can work on separate parts without breaking everything.

---

## Target Folder Structure

```text
lib/
├── main.dart
├── app/
│   └── packethero_app.dart
├── screens/
│   ├── main_menu_screen.dart
│   ├── home_network_screen.dart
│   └── xp_screen.dart
├── widgets/
│   ├── menu_button.dart
│   ├── dialogue_box.dart
│   ├── device_label.dart
│   └── interaction_panel.dart
├── models/
│   ├── player.dart
│   ├── network_device.dart
│   ├── network_cable.dart
│   ├── mission.dart
│   └── osi_power.dart
├── game/
│   ├── player/
│   │   └── player_controller.dart
│   ├── world/
│   │   └── home_network_world.dart
│   ├── devices/
│   │   └── device_interaction_service.dart
│   ├── powers/
│   │   └── osi_power_service.dart
│   └── missions/
│       └── mission_service.dart
└── data/
    ├── missions_data.dart
    └── devices_data.dart
```

---

## File Responsibilities

### main.dart

Application entry point only.

Responsibilities:

* Call `runApp`
* Load `PacketHeroApp`

No UI logic should live here.

---

### app/packethero_app.dart

Main application widget.

Responsibilities:

* Configure `MaterialApp`
* Define app title
* Configure theme
* Set initial screen

---

### screens/

Contains full screens.

Examples:

* Main menu
* Home Network
* XP screen
* Mission result screen

Screens can use widgets, models and services, but should not contain complex business logic.

---

### widgets/

Contains reusable UI elements.

Examples:

* Dialogue boxes
* Interaction panels
* Device labels
* Menu buttons
* XP indicators

Widgets should be reusable and simple.

---

### models/

Contains data structures.

Examples:

* Player
* NetworkDevice
* NetworkCable
* Mission
* OsiPower

Models should describe what exists in the game, not how the UI looks.

---

### game/

Contains gameplay logic.

Examples:

* Player movement
* Device interaction
* Mission validation
* Power unlocks
* World state

This folder contains the heart of the game logic.

---

### data/

Contains temporary static game data.

Examples:

* Mission definitions
* Device definitions
* Dialogue text
* Initial world setup

Later, this could be replaced by JSON files, a database or a content editor.

---

## MVP 0.1 Technical Scope

The first playable prototype should include only:

* Main menu
* Home Network screen
* A movable player placeholder
* Mother's PC
* Router
* Cable
* Simple interaction panel
* Physical Vision unlock
* First mission completion
* XP reward

No advanced systems should be added yet.

Avoid adding:

* Account system
* Cloud save
* Inventory
* Complex animations
* Full OSI system
* Multiple areas
* Full dialogue engine

---

## Development Principle

Build one complete playable loop before adding complexity.

A simple but complete loop is better than many unfinished systems.

First objective:

```text
Start game
→ enter Home Network
→ move near router
→ interact
→ unlock Physical Vision
→ identify cable issue
→ fix it
→ gain XP
```

---

## Future Orchestrator Usage

The orchestrator should assign tasks by folder and responsibility.

Example:

* Flutter UI agent works on `screens/` and `widgets/`
* Game logic agent works on `game/`
* Data/content agent works on `data/`
* Model agent works on `models/`
* QA agent tests the playable loop

No agent should rewrite the full project without updating this architecture document.
