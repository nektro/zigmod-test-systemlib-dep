const std = @import("std");

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit();
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}

const c = @cImport({
    @cInclude("zlib.h");
});

test "basic header functionality" {
    try std.testing.expect(c.Z_OK == 0);
}

test "basic extern functionality" {
    const version = std.mem.sliceTo(c.zlibVersion(), 0);
    try std.testing.expect(std.mem.count(u8, version, ".") == 2);
}
