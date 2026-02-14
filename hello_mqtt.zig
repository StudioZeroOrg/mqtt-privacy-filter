const std = @import("std");
const net = std.net;

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    
    // Target: test.mosquitto.org (91.121.93.94) on port 1883
    const peer = try net.Address.parseIp4("91.121.93.94", 1883);
    
    var stream = try net.tcpConnectToAddress(peer);
    defer stream.close();

    try stdout.print("Connected to MQTT Broker: {any}\n", .{peer});

    // Minimal MQTT Connect Packet (Boilerplate for prototype)
    // [Fixed Header: 0x10 (Connect), Remaining Length: 12]
    // [Variable Header: "MQTT", Level 4, Clean Session, Keep Alive 60]
    // [Payload: Client ID "S0"]
    const connect_packet = [_]u8{ 
        0x10, 0x0c, 0x00, 0x04, 'M', 'Q', 'T', 'T', 
        0x04, 0x02, 0x00, 0x3c, 0x00, 0x02, 'S', '0' 
    };

    try stream.writeAll(&connect_packet);
    try stdout.print("Connect packet sent. Awaiting CONNACK...\n", .{});

    var buf: [4]u8 = undefined;
    const len = try stream.read(&buf);
    
    if (len >= 2 and buf[0] == 0x20) {
        try stdout.print("CONNACK Received! Session established.\n", .{});
    } else {
        try stdout.print("Failed to establish session.\n", .{});
    }
}
