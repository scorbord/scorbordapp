class Contact < ActiveRecord::Base
	belongs_to :prospect

	enum relation: {
		Father: 1,
		Mother: 2,
		Sibling: 3,
		Aunt: 4,
		Uncle: 5,
		Grandparent: 6,
		Guardian: 7
	}

end
