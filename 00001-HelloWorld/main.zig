// improt the "std" library content.
const std = @import("std");

pub fn main() anyerror!void {
    std.debug.print("Hello, world!\n", .{});
}
