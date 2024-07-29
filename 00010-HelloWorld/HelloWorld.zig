const std = @import("std");

pub fn main() !void {
    const stdOut = std.io.getStdOut().writer();
    try stdOut.print("Hello, world!\n", .{});
    std.debug.print("I'm Here", .{});
}
