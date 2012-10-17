shoesToday? 
===========

Acceptance criteria
-------------

Temp	Precipitation		Shoes
---------------------------------
`90+		false				Sandals`

`90+		true				Flip-Flops`

`80		false				Sandals`

`80		true				Flats`

`70		false				Open-toed`

`70		true				Tall(platform)`

`60		false				Patent leather`

`60		true				Tall(platform)`

`50		false				Sneaker`

`50		true				Boots`

`40		false				Flats`

`40		true				Cowboy boots`

`30		false				Boots`

`30		true				Galoshes`

`20		false				Boots`

`20		true				Water-proof boots`

`10		false				boots`

`10		true				Water-proof boots`

check['temps']['90']['false']['shoe'] => tennis shoes

[:temp => "", ]

shoe_combos = [
  {:temp => 90, :precipitation => false, :shoes => 'Sandals'},
  {:temp => 90, :precipitation => true, :shoes => 'Flip-Flops'}
]


def find_shoes(temp, precipitation)
  shoe_combos = [
  {:temp => 90, :precipitation => false, :shoes => 'Sandals'},
  {:temp => 90, :precipitation => true, :shoes => 'Flip-Flops'}
]
shoe_combos.each do |combo|
    if (combo[:temp] == temp && combo[:precipitation] = precipitation)
      return combo[:shoes]
    end
  end
end