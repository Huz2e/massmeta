/obj/item/clothing/suit/space/hardsuit
	name = "hardsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has radiation shielding."
	icon = 'modular_meta/features/hardsuits_qol/icons/suits.dmi'
	icon_state = "hardsuit-engineering"
	lefthand_file = 'modular_meta/features/hardsuits_qol/icons/clothing_lefthand.dmi'
	righthand_file = 'modular_meta/features/hardsuits_qol/icons/clothing_righthand.dmi'
	worn_icon = 'modular_meta/features/hardsuits_qol/icons/suit.dmi'
	inhand_icon_state  = "eng_hardsuit"
	max_integrity = 300
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	armor_type = /datum/armor/hardsuit
	allowed = list(
		/obj/item/flashlight,
		/obj/item/tank/internals,
		/obj/item/t_scanner,
		/obj/item/construction/rcd,
		/obj/item/pipe_dispenser,
		/obj/item/tank/jetpack, // We don't want to make our jetpack system only for hardsuits
		)
	siemens_coefficient = 0
	actions_types = list(
		/datum/action/item_action/toggle_helmet,
		/datum/action/item_action/toggle_spacesuit
		)
	supports_variations_flags = NONE

	var/obj/item/clothing/head/helmet/space/hardsuit/helmet
	var/hardsuit_helmet_type = /obj/item/clothing/head/helmet/space/hardsuit
	/// There are various type of hardsuit with their icons and other things.
	var/hardsuit_type
	/// Whether the helmet is on.
	var/helmet_on = FALSE

/obj/item/clothing/suit/space/hardsuit/Initialize(mapload)
	. = ..()
	MakeHelmet()

/obj/item/clothing/suit/space/hardsuit/Destroy()
	if(!QDELETED(helmet))
		QDEL_NULL(helmet)
	return ..()

/obj/item/clothing/suit/space/hardsuit/proc/MakeHelmet()
	if(!hardsuit_helmet_type)
		return
	if(!helmet)
		var/obj/item/clothing/head/helmet/space/hardsuit/hardsuit = new hardsuit_helmet_type(src)
		hardsuit.suit = src
		helmet = hardsuit

/obj/item/clothing/suit/space/hardsuit/proc/RemoveHelmet(mob/living/carbon/human/user)
	if(!helmet)
		return
	helmet_on = FALSE
	if(ishuman(helmet.loc))
		if(helmet.on)
			helmet.attack_self(user)
		user.transferItemToLoc(helmet, src, TRUE)
		user.update_worn_oversuit()
		to_chat(user, span_notice("The helmet on the hardsuit disengages."))
		playsound(src.loc, 'sound/vehicles/mecha/mechmove03.ogg', 50, TRUE)
	else
		helmet.forceMove(src)

/obj/item/clothing/suit/space/hardsuit/proc/ToggleHelmet(mob/living/carbon/human/user)
	if(!istype(src.loc) || !hardsuit_helmet_type)
		return
	if(!helmet)
		to_chat(user, span_warning("The helmet's lightbulb seems to be damaged! You'll need a replacement bulb."))
		return
	if(!helmet_on)
		if(user.wear_suit != src)
			to_chat(user, span_warning("You must be wearing [src] to engage the helmet!"))
			return
		if(user.head)
			to_chat(user, span_warning("You're already wearing something on your head!"))
			return
		else if(user.equip_to_slot_if_possible(helmet, ITEM_SLOT_HEAD, 0, 0, 1))
			to_chat(user, span_notice("You engage the helmet on the hardsuit."))
			helmet_on = TRUE
			user.update_worn_oversuit()
			playsound(src.loc, 'sound/vehicles/mecha/mechmove03.ogg', 50, TRUE)
	else
		RemoveHelmet(user)

/obj/item/clothing/suit/space/hardsuit/ui_action_click(mob/living/carbon/human/user, actiontype)
	if(istype(actiontype, /datum/action/item_action/toggle_helmet))
		ToggleHelmet(user)
		return
	. = ..()

/obj/item/clothing/suit/space/hardsuit/attack_self(mob/user)
	user.changeNext_move(CLICK_CD_MELEE)
	..()

/obj/item/clothing/suit/space/hardsuit/examine(mob/user)
	. = ..()
	if(!helmet && hardsuit_helmet_type)
		. += span_notice("The helmet on [src] seems to be malfunctioning. Its light bulb needs to be replaced.")

/obj/item/clothing/suit/space/hardsuit/attackby(obj/item/item, mob/user, params)
	if(istype(item, /obj/item/light) && hardsuit_helmet_type)
		if(src == user.get_item_by_slot(ITEM_SLOT_OCLOTHING))
			to_chat(user, span_warning("You cannot replace the bulb in the helmet of [src] while wearing it."))
			return
		if(helmet)
			to_chat(user, span_warning("The helmet of [src] does not require a new bulb."))
			return
		var/obj/item/light/bulb = item
		if(bulb.status)
			to_chat(user, span_warning("This bulb is too damaged to use as a replacement!"))
			return
		if(do_after(user, 5 SECONDS, src))
			qdel(item)
			helmet = new hardsuit_helmet_type(src)
			to_chat(user, span_notice("You have successfully repaired [src]'s helmet."))
			new /obj/item/light/bulb/broken(drop_location())
	return ..()

/obj/item/clothing/suit/space/hardsuit/equipped(mob/user, slot)
	..()
	if(helmet && slot != ITEM_SLOT_OCLOTHING)
		RemoveHelmet()

/obj/item/clothing/suit/space/hardsuit/dropped(mob/user)
	..()
	RemoveHelmet()

/obj/item/clothing/suit/space/hardsuit/item_action_slot_check(slot)
	if(slot == ITEM_SLOT_OCLOTHING) //we only give the mob the ability to toggle the helmet if he's wearing the hardsuit.
		return 1

/// Burn the person inside the hard suit just a little, the suit got really hot for a moment
/obj/item/clothing/suit/space/emp_act(severity)
	. = ..()
	var/mob/living/carbon/human/user = src.loc
	if(istype(user))
		user.apply_damage(5, BURN, spread_damage = TRUE)
		to_chat(user, span_warning("You feel \the [src] heat up from the EMP burning you slightly."))
		if (prob(10))
			user.emote("scream")
