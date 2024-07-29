const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, World!\n", .{});
    try stdout.print("{s} {s}\n", .{ "I'm", "here." });
}
