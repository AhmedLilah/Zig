const std = @import("std");

pub fn main() !void {
    var array = [_]i32{ 1, 2, 3, 4, 5 };

    for (array) |elem| {
        std.debug.print("by val: {}\n", .{elem});
    }

    for (&array) |*elem| {
        elem.* += 100;
        std.debug.print("by ref: {}\n", .{elem.*});
    }

    // array = {101, 102, 103, 104, 105}

    for (array, &array) |val, *ref| {
        _ = val;
        _ = ref;
    }

    for (0.., array) |i, elem| {
        std.debug.print("{}: {}\n", .{ i, elem });
    }

    for (array) |_| {}
}
