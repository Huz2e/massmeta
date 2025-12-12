//Initialize all butts spawn proc(if it can be) here.

//clown butt
/datum/job/clown/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	var/obj/item/organ/internal/butt/butt = spawned.get_organ_slot(ORGAN_SLOT_BUTT)
	if(butt)
		butt.Remove(spawned, 1)
		QDEL_NULL(butt)
		butt = new/obj/item/organ/internal/butt/clown
		butt.Insert(spawned)

//heal butt
/mob/living/carbon/regenerate_organs(remove_hazardous = FALSE)
	. = ..()
	var/obj/item/organ/internal/butt/butt = get_organ_slot(ORGAN_SLOT_BUTT)
	if(!butt)
		butt = new()
		butt.Insert(src)
		butt.set_organ_damage(0)
