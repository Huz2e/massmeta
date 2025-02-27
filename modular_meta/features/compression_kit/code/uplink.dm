/datum/uplink_item/comp_kit
	name = "Compression Kit"
	desc = "A modified version of a BSRPED that can be used to reduce the size of most items while retaining their original functions! \
			Does not work on storage items \
			Recharge using bluespace crystals." //Очень спорно перезаряжать их при помощи бс кристаллов, стоит заменить на тк
	cost = 10 //Оригинальная цена с бишки — 5 тк, что невероятно мало для столь полезной вещи, стоит подметить то что в основном необходим для стелс операций, поэтому стоимость должна быть низкой так как стелсопсам даётся всего 25 тк.
	item = /obj/item/compressionkit
	purchasable_from = (UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)
