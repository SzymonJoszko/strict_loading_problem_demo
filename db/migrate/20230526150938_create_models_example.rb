class CreateModelsExample < ActiveRecord::Migration[7.0]
  def up
    create_table :a_objects, if_not_exists: true do |t|
      t.integer :c_object_id, null: true
      t.timestamps
    end
    create_table :b_objects, if_not_exists: true do |t|
      t.integer :a_object_id, null: true
      t.timestamps
    end
    create_table :c_objects, if_not_exists: true do |t|
      t.timestamps
    end

    c = CObject.create
    a = AObject.create(c_object_id: c.id)
    b = BObject.create(a_object_id: a.id)
  end

  def down
    drop_table :a_objects, if_exists: true
    drop_table :b_objects, if_exists: true
    drop_table :c_objects, if_exists: true
  end
end
