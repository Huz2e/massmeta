/datum/quirk/item_quirk/robust_enjoyer
	name = "Robust Enjoyer"
	desc = "You enjoy robust antics and get a mood boost from wearing your robust pin."
	icon = FA_ICON_FIST_RAISED
	value = 2
	mob_trait = TRAIT_ROBUST_ENJOYER
	gain_text = span_notice("You are a big enjoyer of robust combat.")
	lose_text = span_danger("Robust combat doesn't seem so great.")
	medical_record_text = "Patient reports being a big enjoyer of robust combat."
	mail_goodies = list(
		/obj/item/clothing/gloves/boxing,
		/obj/item/clothing/gloves/color/black,
		/obj/item/storage/belt/security,
		/obj/item/clothing/shoes/jackboots,
		/obj/item/reagent_containers/cup/glass/bottle/whiskey,
		/obj/item/reagent_containers/cup/glass/bottle/vodka,
		/obj/item/reagent_containers/condiment/pack/ketchup,
		/obj/item/clothing/shoes/sandal/alt,
	)

/datum/quirk/item_quirk/robust_enjoyer/add_unique(client/client_source)
	var/obj/item/pin_type = pick(/obj/item/clothing/accessory/robust_pin, /obj/item/clothing/accessory/robust_pin, /obj/item/clothing/accessory/robust_pin, /obj/item/clothing/accessory/robust_pin, /obj/item/clothing/accessory/robust_pin/gigarobust)
	give_item_to_holder(pin_type, list(LOCATION_BACKPACK = ITEM_SLOT_BACK, LOCATION_HANDS = ITEM_SLOT_HANDS))

/datum/quirk/item_quirk/robust_enjoyer/add(client/client_source)
	var/datum/atom_hud/fan = GLOB.huds[DATA_HUD_FAN]
	fan.show_to(quirk_holder)

/obj/item/clothing/accessory/robust_pin
	name = "\improper Robust Pin"
	desc = "A pin to show off your appreciation for robust combat!"
	icon = 'modular_meta/features/robust_enjoyer/icons/robust.dmi'
	worn_icon = 'modular_meta/features/robust_enjoyer/icons/robust_worn.dmi'
	icon_state = "robust1"

/obj/item/clothing/accessory/robust_pin/can_attach_accessory(obj/item/clothing/under/attach_to, mob/living/user)
	. = ..()
	if(!.)
		return FALSE
	if(!LAZYLEN(attach_to.attached_accessories))
		return TRUE
	if(locate(/obj/item/clothing/accessory/clown_enjoyer_pin) in attach_to.attached_accessories)
		if(user)
			attach_to.balloon_alert(user, "pathetic.")
		return FALSE
	if(locate(/obj/item/clothing/accessory/mime_fan_pin) in attach_to.attached_accessories)
		if(user)
			attach_to.balloon_alert(user, "pathetic.")
		return FALSE
	return TRUE

/obj/item/clothing/accessory/robust_pin/accessory_equipped(obj/item/clothing/under/clothes, mob/living/user)
	if(HAS_TRAIT(user, TRAIT_ROBUST_ENJOYER))
		user.add_mood_event("robust_pin", /datum/mood_event/robust_pin)
	if(ishuman(user))
		var/mob/living/carbon/human/human_equipper = user
		human_equipper.fan_hud_set_fandom()

/obj/item/clothing/accessory/robust_pin/accessory_dropped(obj/item/clothing/under/clothes, mob/living/user)
	user.clear_mood_event("robust_pin")
	if(ishuman(user))
		var/mob/living/carbon/human/human_equipper = user
		human_equipper.fan_hud_set_fandom()

/obj/item/clothing/accessory/robust_pin/gigarobust
	name = "\improper GigaRobust Pin"
	desc = "A pin for the ultimate robust enjoyer. Reach for the top, fall to the bottom."
	icon_state = "robust2"

/obj/item/clothing/accessory/robust_pin/gigarobust/accessory_equipped(obj/item/clothing/under/clothes, mob/living/user)
	if(HAS_TRAIT(user, TRAIT_ROBUST_ENJOYER))
		user.add_mood_event("gigarobust_pin", /datum/mood_event/gigarobust_pin)
	if(ishuman(user))
		var/mob/living/carbon/human/human_equipper = user
		human_equipper.fan_hud_set_fandom()

/obj/item/clothing/accessory/robust_pin/gigarobust/accessory_dropped(obj/item/clothing/under/clothes, mob/living/user)
	user.clear_mood_event("gigarobust_pin")
	if(ishuman(user))
		var/mob/living/carbon/human/human_equipper = user
		human_equipper.fan_hud_set_fandom()

/datum/mood_event/robust_pin
	description = span_nicegreen("I'm showing off my robust spirit!")
	mood_change = 3
	timeout = 3 MINUTES

/datum/mood_event/gigarobust_pin
	description = span_nicegreen("I'm the ultimate robust. I'm unstoppable.")
	mood_change = 5
	timeout = 3 MINUTES

/mob/living/carbon/human/fan_hud_set_fandom()
	. = ..()
	var/obj/item/clothing/under/undershirt = w_uniform
	if(!undershirt)
		return

	for(var/obj/item/clothing/accessory in undershirt.attached_accessories)
		if(istype(accessory, /obj/item/clothing/accessory/robust_pin/gigarobust))
			set_hud_image_state(FAN_HUD, "robustpin2")
			return

		if(istype(accessory, /obj/item/clothing/accessory/robust_pin))
			set_hud_image_state(FAN_HUD, "robustpin1")
			return

/datum/loadout_item/accessory/robust_pin
	name = "Robust Pin"
	item_path = /obj/item/clothing/accessory/robust_pin/loadout

/obj/item/clothing/accessory/robust_pin/loadout
	name = "Robust Pin"
	desc = "A pin to show off your appreciation for robust combat!"
