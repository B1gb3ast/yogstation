/*
Chief Medical Officer
*/
/datum/job/cmo
	title = "Chief Medical Officer"
	flag = CMO
	department_head = list("Captain")
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#ffddf0"
	req_admin_notify = 1
	minimal_player_age = 15
	whitelisted = 1

	default_id = /obj/item/weapon/card/id/silver
	default_pda = /obj/item/device/pda/heads/cmo
	default_headset = /obj/item/device/radio/headset/heads/cmo
	default_backpack = /obj/item/weapon/storage/backpack/medic
	default_satchel = /obj/item/weapon/storage/backpack/satchel_med

	access = list(access_medical, access_morgue, access_genetics, access_paramedic, access_heads, access_mineral_storeroom,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors)
	minimal_access = list(access_medical, access_morgue, access_genetics, access_paramedic, access_heads, access_mineral_storeroom,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors)

/datum/job/cmo/equip_items(mob/living/carbon/human/H)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/chief_medical_officer(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/brown(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/toggle/labcoat/cmo(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/regular(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/device/flashlight/pen(H), slot_s_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/melee/classic_baton/telescopic(H), slot_in_backpack)

	announce_head(H, list("Medical")) //tell underlings (medical radio) they have a head

/*
Medical Doctor
*/
/datum/job/doctor
	title = "Medical Doctor"
	flag = DOCTOR
	department_head = list("Chief Medical Officer")
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 5
	spawn_positions = 3
	supervisors = "the chief medical officer"
	selection_color = "#ffeef0"

	default_pda = /obj/item/device/pda/medical
	default_headset = /obj/item/device/radio/headset/headset_med
	default_backpack = /obj/item/weapon/storage/backpack/medic
	default_satchel = /obj/item/weapon/storage/backpack/satchel_med

	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_mineral_storeroom)
	minimal_access = list(access_medical, access_morgue, access_surgery)

/datum/job/doctor/equip_items(mob/living/carbon/human/H)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/medical(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/white(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/toggle/labcoat(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/regular(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/device/flashlight/pen(H), slot_s_store)

/*
Mining Medic
*/
/datum/job/miningmedic
	title = "Mining Medic"
	flag = MMEDIC
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the chief medical officer"
	selection_color = "#ffeef0"

	default_pda = /obj/item/device/pda/medical
	default_headset = /obj/item/device/radio/headset/headset_cargo
	default_backpack = /obj/item/weapon/storage/backpack/medic
	default_satchel = /obj/item/weapon/storage/backpack/satchel_med

	access = list(access_medical, access_morgue, access_surgery, access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mint, access_mining, access_mining_station, access_mineral_storeroom)
	minimal_access = list(access_medical, access_mining, access_mint, access_mining_station, access_mailsorting, access_mineral_storeroom)

/datum/job/miningmedic/equip_items(var/mob/living/carbon/human/H)

	H.equip_to_slot_or_del(new /obj/item/weapon/reagent_containers/hypospray/mini(H.back), slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/o2(H.back), slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/white(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/mmedical(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/regular(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/device/flashlight/pen(H), slot_s_store)

/*
Paramedic
*/
/datum/job/paramedic
	title = "Paramedic"
	flag = PARAMEDIC
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 3
	spawn_positions = 2
	supervisors = "the chief medical officer"
	selection_color = "#ffeef0"

	default_pda = /obj/item/device/pda/medical
	default_headset = /obj/item/device/radio/headset/headset_med
	default_backpack = /obj/item/weapon/storage/backpack/medic
	default_satchel = /obj/item/weapon/storage/backpack/satchel_med

	access = list(access_medical, access_morgue, access_maint_tunnels, access_external_airlocks, access_paramedic)
	minimal_access = list(access_medical, access_morgue, access_maint_tunnels, access_external_airlocks, access_paramedic)

/datum/job/paramedic/equip_items(var/mob/living/carbon/human/H)

	H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/regular(H.back), slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/white(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/medical(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/toggle/labcoat/emt(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/roller(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/device/flashlight(H), slot_l_store)
	H.equip_to_slot_or_del(new /obj/item/device/gps(H), slot_r_store)
/*
Psychiatrist
*/
/datum/job/psych
	title = "Psychiatrist"
	flag = PSYCH
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the chief medical officer"
	selection_color = "#ffeef0"

	default_pda = /obj/item/device/pda
	default_headset = /obj/item/device/radio/headset/headset_med
	default_backpack = /obj/item/weapon/storage/backpack
	default_satchel = /obj/item/weapon/storage/backpack/satchel_norm

	access = list(access_medical)
	minimal_access = list(access_medical)

/datum/job/psych/equip_items(var/mob/living/carbon/human/H)

	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/brown(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/suit_jacket/burgundy(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/briefcase(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/regular(H), slot_glasses)

/*
Chemist
*/
/datum/job/chemist
	title = "Chemist"
	flag = CHEMIST
	department_head = list("Chief Medical Officer")
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the chief medical officer"
	selection_color = "#ffeef0"

	default_pda = /obj/item/device/pda/chemist
	default_headset = /obj/item/device/radio/headset/headset_med

	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_mineral_storeroom)
	minimal_access = list(access_medical, access_chemistry, access_mineral_storeroom)

/datum/job/chemist/equip_items(mob/living/carbon/human/H)

	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/science, slot_glasses) //for viewing reagents
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/chemist(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/white(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/toggle/labcoat/chemist(H), slot_wear_suit)

/*
Geneticist
*/
/datum/job/geneticist
	title = "Geneticist"
	flag = GENETICIST
	department_head = list("Chief Medical Officer", "Research Director")
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the chief medical officer and research director"
	selection_color = "#ffeef0"

	default_pda = /obj/item/device/pda/geneticist
	default_headset = /obj/item/device/radio/headset/headset_medsci

	access = list(access_medical, access_morgue, access_chemistry, access_virology, access_genetics, access_research, access_xenobiology, access_robotics, access_mineral_storeroom, access_tech_storage)
	minimal_access = list(access_medical, access_morgue, access_genetics, access_research)

/datum/job/geneticist/equip_items(mob/living/carbon/human/H)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/geneticist(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/white(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/toggle/labcoat/genetics(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/device/flashlight/pen(H), slot_s_store)

/*
Virologist
*/
/datum/job/virologist
	title = "Virologist"
	flag = VIROLOGIST
	department_head = list("Chief Medical Officer")
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the chief medical officer"
	selection_color = "#ffeef0"

	default_pda = /obj/item/device/pda/viro
	default_headset = /obj/item/device/radio/headset/headset_med
	default_backpack = /obj/item/weapon/storage/backpack/medic
	default_satchel = /obj/item/weapon/storage/backpack/satchel_med

	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_mineral_storeroom)
	minimal_access = list(access_medical, access_virology, access_mineral_storeroom)

/datum/job/virologist/equip_items(mob/living/carbon/human/H)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/virologist(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/surgical(H), slot_wear_mask)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/white(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/toggle/labcoat/virologist(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/device/flashlight/pen(H), slot_s_store)

