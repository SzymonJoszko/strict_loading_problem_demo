# Problem example with strict loading and reload method

```
Loading development environment (Rails 7.0.5)
irb(main):001:0> b = BObject.find(1)
  BObject Load (9.0ms)  SELECT "b_objects".* FROM "b_objects" WHERE "b_objects"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
=> #<BObject:0x00007f3fe9d52750 id: 1, a_object_id: 1, created_at: Mon, 29 May 2023 14:02:05.815042000 UTC +00:00, updated_at: Mon, 29 May 2023 14:02:05.815042000 UTC +00:00>

irb(main):002:0> b.reload
  BObject Load (6.1ms)  SELECT "b_objects".* FROM "b_objects" WHERE "b_objects"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
=> #<BObject:0x00007f3fe9d52750 id: 1, a_object_id: 1, created_at: Mon, 29 May 2023 14:02:05.815042000 UTC +00:00, updated_at: Mon, 29 May 2023 14:02:05.815042000 UTC +00:00>

irb(main):003:0> b.c_object
`BObject` is marked for strict_loading. The CObject association named `:c_object` cannot be lazily loaded.
called form has_one :c_object
#<BObject id: 1, a_object_id: 1, created_at: "2023-05-29 14:02:05.815042000 +0000", updated_at: "2023-05-29 14:02:05.815042000 +0000">
  CObject Load (11.0ms)  SELECT "c_objects".* FROM "c_objects" INNER JOIN "a_objects" ON "c_objects"."id" = "a_objects"."c_object_id" WHERE "a_objects"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
=> #<CObject:0x00007f3fe9ee57c0 id: 1, created_at: Mon, 29 May 2023 14:02:05.725182000 UTC +00:00, updated_at: Mon, 29 May 2023 14:02:05.725182000 UTC +00:00>

irb(main):004:0> b.reload
  BObject Load (6.2ms)  SELECT "b_objects".* FROM "b_objects" WHERE "b_objects"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
called form has_one :c_object
nil
  AObject Load (9.8ms)  SELECT "a_objects".* FROM "a_objects" WHERE "a_objects"."id" = ?  [["id", 1]]
called form has_one :c_object
#<AObject id: 1, c_object_id: 1, created_at: "2023-05-29 14:02:05.791851000 +0000", updated_at: "2023-05-29 14:02:05.791851000 +0000">
  CObject Load (9.6ms)  SELECT "c_objects".* FROM "c_objects" WHERE "c_objects"."id" = ?  [["id", 1]]
=> #<BObject:0x00007f3fe9d52750 id: 1, a_object_id: 1, created_at: Mon, 29 May 2023 14:02:05.815042000 UTC +00:00, updated_at: Mon, 29 May 2023 14:02:05.815042000 UTC +00:00>

irb(main):005:0> b = BObject.find(1)
  BObject Load (7.9ms)  SELECT "b_objects".* FROM "b_objects" WHERE "b_objects"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
=> #<BObject:0x00007f3fe9f829a8 id: 1, a_object_id: 1, created_at: Mon, 29 May 2023 14:02:05.815042000 UTC +00:00, updated_at: Mon, 29 May 2023 14:02:05.815042000 UTC +00:00>

irb(main):006:0> b.reload
  BObject Load (5.6ms)  SELECT "b_objects".* FROM "b_objects" WHERE "b_objects"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
=> #<BObject:0x00007f3fe9f829a8 id: 1, a_object_id: 1, created_at: Mon, 29 May 2023 14:02:05.815042000 UTC +00:00, updated_at: Mon, 29 May 2023 14:02:05.815042000 UTC +00:00>
irb(main):007:0>
```


