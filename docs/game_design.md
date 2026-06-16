# PacketHero - Game Design

## Game Type

PacketHero is an adventure-based troubleshooting game.

The player explores environments, talks to characters, investigates network problems and solves them by applying networking concepts.

The game mixes:

* Story progression
* Troubleshooting missions
* Learning moments
* XP progression
* Unlockable powers
* Optional side quests

---

## Core Gameplay Loop

The core loop is:

1. A character reports a problem.
2. The player investigates the environment.
3. The player observes devices, cables and network behavior.
4. The player uses the currently unlocked OSI powers.
5. The player identifies the root cause.
6. The player applies a fix.
7. The player receives XP, rewards and/or a new concept.

Example:

Mother says the Internet is not working.

The player checks the computer, follows the cable, discovers the router and identifies a disconnected or damaged cable.

The player fixes the connection and unlocks the first understanding of physical networking.

---

## Progression

The player progresses through areas.

Main progression example:

* Home Network
* Grandfather's House
* Friend's House
* School Network
* Small Office
* Enterprise Network
* City Network
* Internet Backbone

Each area introduces new networking concepts.

Progression is controlled by XP and unlocked knowledge.

The player cannot access advanced topics too early.

Example:

Routing missions are locked until the player understands physical connections, switching and IP addressing.

---

## XP System

The player gains XP by completing:

* Main missions
* Side quests
* Troubleshooting challenges
* Review challenges
* Missions without using powers

XP unlocks:

* New areas
* New missions
* New powers
* New tools
* New concepts

---

## Main Quests

Main quests are required to progress through the story.

They introduce the essential networking concepts in a controlled order.

Example main quest flow:

1. Restore Internet at home.
2. Understand physical connections.
3. Discover local communication.
4. Understand IP addressing.
5. Solve the first routing problem.
6. Diagnose an application issue.

---

## Side Quests

Side quests are optional missions designed to reinforce learning.

They are not required to unlock the next major area, but they provide XP, practice and deeper understanding.

Examples:

* Grandfather cannot print.
* Friend thinks she has been hacked.
* Neighbor's Wi-Fi keeps disconnecting.
* School computers cannot reach the Internet.
* A smart TV works on Wi-Fi but not with a cable.

Side quests are used to anchor knowledge through realistic and memorable situations.

---

## Challenges

Challenges are short replayable activities.

Their purpose is to reinforce previously learned concepts.

Examples:

* Identify the broken cable.
* Find the duplicate IP address.
* Match the device to the correct layer.
* Diagnose why a website does not load.
* Solve a network issue without Packet Vision.

---

## OSI Powers

The hero's powers represent the OSI model.

Each power reveals a deeper layer of the network.

### Layer 1 - Physical Vision

Reveals:

* Cables
* Ports
* Physical connections
* Broken links

Used for:

* Disconnected cable
* Damaged cable
* Wrong port
* Powered-off device

### Layer 2 - Frame Vision

Reveals:

* Frames
* MAC addresses
* Local communication
* Switch behavior

Used for:

* Switching
* Local network communication
* MAC address learning
* Broadcast behavior

### Layer 3 - Packet Vision

Reveals:

* IP addresses
* Packets
* Default gateway
* Routes

Used for:

* IP conflicts
* Wrong subnet
* Wrong gateway
* Routing issues

### Layer 4 - Transport Vision

Reveals:

* TCP
* UDP
* Ports
* Connection attempts

Used for:

* Blocked ports
* Service unavailable
* Firewall-like issues
* TCP versus UDP understanding

### Layer 5 - Session Vision

Reveals:

* Sessions
* Active connections
* Login states
* Expired sessions

Used for:

* Session timeout
* Authentication flow
* Reconnection issues

### Layer 6 - Presentation Vision

Reveals:

* Encryption
* Encoding
* Compression
* Certificate-like issues

Used for:

* HTTPS understanding
* Broken encryption
* Data format problems

### Layer 7 - Application Vision

Reveals:

* Applications
* Services
* DNS names
* User-facing network behavior

Used for:

* DNS issues
* Web services
* Email
* Application troubleshooting

---

## Loss of Powers

At a key moment in the story, the hero temporarily loses his powers.

This creates a shift from guided learning to mastery.

Before the loss:

The player relies on visual powers to understand the network.

After the loss:

The player must use observation, tools and knowledge.

This validates that the player has truly learned the concepts.

---

## Player Tools

Possible tools unlocked over time:

* Cable tester
* Ping
* IP configuration viewer
* MAC table viewer
* Route viewer
* Port scanner
* DNS lookup
* Packet analyzer

Tools should be introduced gradually and only when the player understands why they are useful.

---

## First MVP Goal

The first playable MVP should include:

1. Main menu
2. Home Network area
3. First story mission
4. Physical Vision
5. One simple troubleshooting problem
6. XP reward
7. Basic progression screen

The first mission should teach that the Internet depends on physical connections.

The first problem should be simple:

A cable is disconnected, damaged or connected to the wrong port.

---

## Design Principle

PacketHero should never start with theory.

PacketHero starts with a problem.

The player becomes curious.

The game teaches the concept needed to solve it.

Then the player applies it.
