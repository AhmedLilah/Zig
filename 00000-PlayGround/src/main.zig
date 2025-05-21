const std = @import("std");

fn isNumeric(comptime T: type) bool {
    return switch (@typeInfo(T)) {
        .i32, .f32, .int, .float, .comptime_int, .comptime_float => true,
        else => false,
    };
}

fn genericAdd(comptime T: type, A: T, B: T) !T {
    const allocator = std.heap.page_allocator;

    // if (isNumeric(T)) {
    if (T == i32) {
        return A + B;
    } else if (T == []const u8) {
        const result = try std.fmt.allocPrint(allocator, "{}{}", .{ A, B });
        return result;
    } else if (T == std.ArrayList(u8)) {
        var result = std.ArrayList(u8).init(allocator);
        try result.appendSlice(A.items);
        try result.appendSlice(B.items);
        return result;
    } else {
        @compileLog(T);
        @compileError("Unsupported type passed to genericAdd");
    }
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    try stdout.print("5 + 5 = {}\n", .{try genericAdd(i32, 5, 5)});
    try stdout.print("5.0 + 5.0 = {}\n", .{try genericAdd(f32, 5.0, 5.0)});

    const first = "Ahmed ";
    const second = "Sabry.";
    try stdout.print("Full name: {s}\n", .{try genericAdd([]const u8, first, second)});
}
