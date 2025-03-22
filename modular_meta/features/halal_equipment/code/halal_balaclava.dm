/obj/item/clothing/mask/balaclava/halal_balaclava
	name = "halal balaclava"
	desc = "Allah protects! ماسميتا يوجه!"
	actions_types = list(/datum/action/item_action/praise_allah)
	icon = 'modular_meta/features/halal_equipment/icons/halal_balaclava.dmi'
	icon_state = "halal_balaclava"
	worn_icon = 'modular_meta/features/halal_equipment/icons/worn_halal_balaclava.dmi'
	worn_icon_state = "worn_halal_balaclava"
	COOLDOWN_DECLARE(praise_allah_cooldown)

/obj/item/clothing/mask/balaclava/halal_balaclava/verb/praise_allah()
	set category = "Object"
	set name = "PRAISE ALLAH"
	set src in usr


	if(!isliving(usr) || !can_use(usr))  // проверка, живой ли юзер маски и может ли вообще он юзать(не застанен ли)
		return

	if (!COOLDOWN_FINISHED(src, praise_allah_cooldown))
		to_chat(usr, span_warning("You must wait before praising Allah again!"))
		return

	// Запускаем кулдаун
	COOLDOWN_START(src, praise_allah_cooldown, 10 SECONDS) // 10 секунд кулдаун
	// Сообщение в IC-чат, через say, то есть чувак будет просто говорить это
	usr.say("INSHALLA!!!")
	// (Опционально) Можно добавить звук
	playsound(src, 'modular_meta/features/halal_equipment/sound/inshalla_allah_scream.ogg', 100, TRUE, 7)

/datum/action/item_action/praise_allah
	name = "Praise_allah!"



/obj/machinery/vending/clothing/Initialize(mapload)
	. = ..()
	contraband += list(/obj/item/clothing/mask/balaclava/halal_balaclava = 1,)
