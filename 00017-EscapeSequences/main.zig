const std = @import("std");

pub fn main() !void {
    const cProgram =
        \\#include <stdio.h>
        \\
        \\void main(void) {
        \\      printf("Hello,World!");
        \\}
    ;

    const stdout = std.io.getStdOut().writer();
    try stdout.print("cProgram:\n{s}\ntab\t doublequotes:\"\" \' \rhi", .{cProgram});
}
