class Contact < ActiveRecord::Base
	belongs_to :prospect

	enum relation: {
		'Father' => 1,
		'Mother' => 2,
		'Step Father' => 3,
		'Step Mother' => 4,
		'Aunt' => 5,
		'Uncle' => 6,
		'Grandparent' => 7,
		'Guardian' => 8
	}

	enum salutation: {
		'Mr.' => 1,
		'Mrs.' => 2,
		'Ms.' => 3
	}

end
