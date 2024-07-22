//ORIGINAL FILE: code/modules/research/techweb/nodes/atmos_nodes.dm
/datum/techweb_node/plasma_control
	required_experiments = list()
	discount_experiments = list(/datum/experiment/ordnance/gaseous/plasma = TECHWEB_TIER_2_POINTS)

//ORIGINAL FILE: code/modules/research/techweb/nodes/atmos_nodes.dm
/datum/techweb_node/fusion
	required_experiments = list()
	discount_experiments = list(
        /datum/experiment/ordnance/gaseous/bz = TECHWEB_TIER_2_POINTS,
        /datum/experiment/ordnance/gaseous/nitrous_oxide = TECHWEB_TIER_3_POINTS,
    )

//ORIGINAL FILE: code/modules/research/techweb/nodes/biology_nodes.dm
/datum/techweb_node/xenobiology
	required_experiments = list()
	discount_experiments = list(/datum/experiment/scanning/random/cytology = TECHWEB_TIER_3_POINTS)

//ORIGINAL FILE: code/modules/research/techweb/nodes/cyborg_nodes.dm
/datum/techweb_node/cyber/cyber_organs_upgraded
	required_experiments = list()
	discount_experiments = list(/datum/experiment/scanning/people/augmented_organs = TECHWEB_TIER_4_POINTS)

//ORIGINAL FILE: code/modules/research/techweb/nodes/engi_nodes.dm
/datum/techweb_node/parts_adv
	required_experiments = list()
	discount_experiments = list(/datum/experiment/scanning/points/machinery_tiered_scan/tier2_any = TECHWEB_TIER_3_POINTS)

//ORIGINAL FILE: code/modules/research/techweb/nodes/mech_nodes.dm
/datum/techweb_node/mech_combat
	required_experiments = list()
	discount_experiments = list(
		/datum/experiment/scanning/random/mecha_equipped_scan = TECHWEB_TIER_1_POINTS,
		/datum/experiment/scanning/random/mecha_damage_scan = TECHWEB_TIER_2_POINTS,
	)

//ORIGINAL FILE: code/modules/research/techweb/nodes/medbay_nodes.dm
/datum/techweb_node/cryostasis
	required_experiments = list()
	discount_experiments = list(/datum/experiment/scanning/reagent/cryostylane = TECHWEB_TIER_3_POINTS)

//ORIGINAL FILE: code/modules/research/techweb/nodes/research_nodes.dm
/datum/techweb_node/applied_bluespace
	required_experiments = list()
	discount_experiments = list(/datum/experiment/scanning/points/bluespace_crystal = TECHWEB_TIER_2_POINTS)

//ORIGINAL FILE: code/modules/research/techweb/nodes/security_nodes.dm
/datum/techweb_node/explosives
	required_experiments = list()
	discount_experiments = list(
		/datum/experiment/ordnance/explosive/lowyieldbomb = TECHWEB_TIER_2_POINTS,
		/datum/experiment/ordnance/explosive/highyieldbomb = TECHWEB_TIER_3_POINTS,
	)

//ORIGINAL FILE: code/modules/research/techweb/nodes/service_nodes.dm
/datum/techweb_node/fishing_equip_adv
	required_experiments = list()
	discount_experiments = list(/datum/experiment/scanning/fish = TECHWEB_TIER_2_POINTS)

//ORIGINAL FILE: code/modules/research/techweb/nodes/biology_nodes.dm
/datum/techweb_node/selection
	required_experiments = list()
	discount_experiments = list(
        /datum/experiment/scanning/random/plants/wild = TECHWEB_TIER_2_POINTS,
        /datum/experiment/scanning/random/plants/traits = TECHWEB_TIER_3_POINTS,
    )

//ORIGINAL FILE: code/modules/research/techweb/nodes/surgery_nodes.dm
/datum/techweb_node/surgery_adv
	required_experiments = list()
	discount_experiments = list(/datum/experiment/autopsy/human = TECHWEB_TIER_2_POINTS)

/datum/techweb_node/surgery_exp
	required_experiments = list()
	discount_experiments = list(/datum/experiment/autopsy/nonhuman = TECHWEB_TIER_3_POINTS)
