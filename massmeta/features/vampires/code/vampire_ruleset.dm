//////////////////////////////////////////////
//                                          //
//                VAMPIRE                   //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/roundstart/vampire
	name = "Vampire"
	antag_flag = ROLE_VAMPIRE
	antag_datum = /datum/antagonist/vampire
	protected_roles = list("Head of Security", "Captain", "Head of Personnel", "Research Director", "Chief Engineer", "Chief Medical Officer", "Security Officer", "Chaplain", "Detective", "Warden", "Brig Physician")
	restricted_roles = list("Cyborg", "AI", "Synthetic")
	required_candidates = 3
	weight = 3
	cost = 8
	scaling_cost = 9
	requirements = list(80,70,60,50,50,45,30,30,25,20)
	antag_cap = list("denominator" = 24)
	minimum_players = 30
	var/autovamp_cooldown = (15 MINUTES)
	COOLDOWN_DECLARE(autovamp_cooldown_check)

/datum/dynamic_ruleset/roundstart/vampire/pre_execute(population)
	. = ..()
	COOLDOWN_START(src, autovamp_cooldown_check, autovamp_cooldown)
	var/num_vampires = get_antag_cap(population) * (scaled_times + 1)
	for (var/i = 1 to num_vampires)
		if(candidates.len <= 0)
			break
		var/mob/M = pick_n_take(candidates)
		assigned += M.mind
		M.mind.special_role = ROLE_VAMPIRE
		M.mind.restricted_roles = restricted_roles
	return TRUE

//////////////////////////////////////////////
//                                          //
//                VAMPIRE                   //
//				  MIDROUND                  //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/midround/autovamp
	name = "Vampire"
	antag_flag = ROLE_VAMPIRE
	antag_datum = /datum/antagonist/vampire
	midround_ruleset_style =  MIDROUND_RULESET_STYLE_LIGHT
	protected_roles = list("Head of Security", "Captain", "Head of Personnel", "Research Director", "Chief Engineer", "Chief Medical Officer", "Security Officer", "Chaplain", "Detective", "Warden")
	restricted_roles = list("Cyborg", "AI", "Synthetic")
	required_candidates = 1
	weight = 5
	cost = 15
	requirements = list(80,70,60,50,50,45,30,30,25,25)
	minimum_players = 15

/datum/dynamic_ruleset/midround/autovamp/acceptable(population = 0, threat = 0)
	var/max_vamp = round(living_players / 10) + 1
	if ((living_antags < max_vamp) && prob(SSdynamic.threat_level))//adding vampire if the antag population is getting low
		return ..()
	else
		return FALSE

/datum/dynamic_ruleset/midround/autovamp/proc/check_eligible(datum/mind/M)
	var/turf/T = get_turf(M.current)
	if(!considered_afk(M) && considered_alive(M) && is_station_level(T.z) && !M.antag_datums?.len && !HAS_TRAIT(M, TRAIT_MINDSHIELD))
		return TRUE
	return FALSE

/datum/dynamic_ruleset/midround/autovamp/ready(forced = FALSE)
	if (required_candidates > living_players.len)
		return FALSE
	return ..()

/datum/dynamic_ruleset/midround/autovamp/execute()
	var/mob/M = pick(living_players)
	assigned += M
	living_players -= M
	var/datum/antagonist/vampire/newVampire = new
	M.mind.add_antag_datum(newVampire)
	return TRUE
