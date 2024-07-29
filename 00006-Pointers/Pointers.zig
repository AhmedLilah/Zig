const std = @import("std");
const print = std.debug.print;

// this is a normal pointer to a single item: it is not null.
const Single = *bool;

// pointer to unknown number of items.
const Many = [*]bool;

// pointer that could be null.
const Null = ?*bool;

pub fn main() !void {
    var v = false;
    var ptr: *bool = &v;
    print("pointer: {}\n", .{ptr});

    ptr.* = true;
    print("value: {}\n", .{ptr.*});

    const const_ptr: *bool = &v;
    const_ptr.* = false;

    const cf = false;
    const ct = true;
    var ptr_to_const: *const bool = &cf;
    ptr_to_const = &ct;
}
