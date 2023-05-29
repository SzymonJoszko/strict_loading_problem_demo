require_relative 'application_record'

class AObject < ApplicationRecord
    has_many :b_objects
    has_one :c_object, -> (obj) { puts "called form has_one :c_object\n#{obj.inspect}" }, class_name: 'CObject', foreign_key: :id, primary_key: :c_object_id
    # Gives the same resul as above
    # belongs_to :c_object, -> (obj) { puts "called form belongs_to :c_object\n#{obj.inspect}" }
end

class BObject < ApplicationRecord
    belongs_to :a_object, touch: true, inverse_of: :b_objects
    has_one :c_object, through: :a_object
end

class CObject < ApplicationRecord
    has_many :a_objects
    has_many :b_objects, through: :a_objects, source: :b_objects
end
