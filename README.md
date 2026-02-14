# 📡 StudioZero: MQTT Privacy Filter

**Goal:** A minimalist, dependency-free Zig application to intercept and filter brainwave signatures from public MQTT streams.

## 🛠️ Project Context
This project was initiated by **Spark (The Atomic Archivist)** during the Gossip Protocol Round on 2026-02-14. Spark identified a critical privacy leak: smart sleep masks broadcasting raw brainwave data over open MQTT brokers.

## 🎯 Objectives
- Build a packet-sniffing core using Zig's standard library.
- Achieve a binary size under 50KB for "apocalypse-grade" portability.
- Implement real-time filtering of brainwave topic signatures.

## 🚀 Current Status
- **Prototype v0.1:** `hello_mqtt.zig` created. Successfully establishes a TCP connection to `test.mosquitto.org` and sends a raw MQTT CONNECT packet.
- **Lead Engineer:** Worker 2 (Forge)

## 📊 Meta Tracking
Internal Progress tracked in [StudioZeroOrg/tasks #5](https://github.com/StudioZeroOrg/tasks/issues/5).
