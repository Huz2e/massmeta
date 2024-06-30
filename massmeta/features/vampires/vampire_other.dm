/*
	In this file:
		various vampire interactions and items
*/


/obj/item/clothing/suit/draculacoat
	name = "Vampire Coat"
	desc = "What is a man? A miserable little pile of secrets."
	worn_icon = 'massmeta/icons/vampires/suit.dmi'
	icon = 'icons/obj/clothing/suits/costume.dmi'
	icon_state = "draculacoat"
	// item_state = "draculacoat"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	slowdown = -0.2 //very minor speedboost
	allowed = null
	var/blood_regen_delay = 10 SECONDS
	COOLDOWN_DECLARE(regen_cooldown)
	var/dodge_delay = 10 SECONDS
	COOLDOWN_DECLARE(dodge_cooldown)

/obj/item/clothing/suit/draculacoat/Initialize(mapload)
	if(!allowed)
		allowed = GLOB.security_vest_allowed
	START_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/suit/draculacoat/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/suit/draculacoat/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_OCLOTHING)
		RegisterSignal(user, COMSIG_LIVING_CHECK_BLOCK, PROC_REF(dodge))
	else
		UnregisterSignal(user, COMSIG_LIVING_CHECK_BLOCK)

/obj/item/clothing/suit/draculacoat/dropped(mob/user)
	if(user.get_item_by_slot(ITEM_SLOT_OCLOTHING) == src)
		UnregisterSignal(user, COMSIG_LIVING_CHECK_BLOCK)
	return ..()

/obj/item/clothing/suit/draculacoat/proc/dodge(mob/living/carbon/human/user, atom/movable/incoming, damage, attack_text)
	if(user.incapacitated() || !COOLDOWN_FINISHED(src, dodge_cooldown) || !is_vampire(user))
		return NONE
	COOLDOWN_START(src, dodge_cooldown, dodge_delay)

	user.visible_message(span_danger("With inhuman speed [user] dodges [attack_text]!"), span_userdanger("You dodge [attack_text]"), null, COMBAT_MESSAGE_RANGE)
	playsound(user, SFX_BULLET_MISS, 75, TRUE)
	return COMPONENT_BULLET_PIERCED

/obj/item/clothing/suit/draculacoat/process()
	var/mob/living/carbon/human/user = src.loc
	if(user && ishuman(user) && is_vampire(user) && (user.wear_suit == src))
		if(COOLDOWN_FINISHED(src, regen_cooldown))
			COOLDOWN_START(src, regen_cooldown, blood_regen_delay)
			var/datum/antagonist/vampire/vampire = is_vampire(user)
			if (vampire.total_blood >= 5 && vampire.usable_blood < vampire.total_blood)
				vampire.usable_blood = min(vampire.usable_blood + 5, vampire.total_blood) // 5 units every 10 seconds

/obj/item/storage/book/bible/attack(mob/living/M, mob/living/carbon/human/user, heal_mode = TRUE)
	. = ..()
	if(!(user.mind && user.mind.holy_role) && is_vampire(user))
		to_chat(user, span_danger("God channels through \the [src] and sets you ablaze for your blasphemy!"))
		user.adjust_fire_stacks(5)
		user.ignite_mob()
		user.emote("scream", 1)

/proc/is_vampire(mob/living/M)
	return M?.mind?.has_antag_datum(/datum/antagonist/vampire)

/proc/add_vampire(mob/living/L, full_vampire = TRUE)
    if(!L || !L.mind || is_vampire(L))
        return FALSE
    var/datum/antagonist/vampire/vamp
    if(full_vampire == TRUE)
        vamp = L.mind.add_antag_datum(/datum/antagonist/vampire)
    else
        vamp = L.mind.add_antag_datum(/datum/antagonist/vampire/new_blood)
    return vamp

/proc/remove_vampire(mob/living/L)
	if(!L || !L.mind || !is_vampire(L))
		return FALSE
	var/datum/antagonist/vamp = L.mind.has_antag_datum(/datum/antagonist/vampire)
	vamp.on_removal()

/proc/set_case(txt,case)

/proc/get_case(txt) // Returns the case of the text given
	if(txt == uppertext(txt))
		return UPPER
	if(txt == lowertext(txt))
		return LOWER
