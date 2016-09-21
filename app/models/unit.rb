class Unit < ActiveRecord::Base
	belongs_to :parent_unit, class_name: 'Unit', foreign_key: 'parent_unit_id'
	has_many :children_units, class_name: 'Unit', foreign_key: 'parent_unit_id'
	belongs_to :coach_position, class_name: 'Position', foreign_key: 'coach_position_id'
	has_many :positions

	def all_positions(positions_array = [])
		positions_array << self.positions
		child_units = Unit.where(parent_unit_id: self.id)
		child_units.each do |cu|
			positions_array << cu.positions
			Unit.where(parent_unit_id: cu.id).each do |u|
				u.all_positions(positions_array)
			end
		end
		positions_array.flatten
	end
end

