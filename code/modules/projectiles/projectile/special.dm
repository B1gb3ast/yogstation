/obj/item/projectile/ion
	name = "ion bolt"
	icon_state = "ion"
	damage = 0
	damage_type = BURN
	nodamage = 1
	flag = "energy"


/obj/item/projectile/ion/on_hit(atom/target, blocked = 0)
	..()
	empulse(target, 1, 1)
	return 1


/obj/item/projectile/ion/weak

/obj/item/projectile/ion/weak/on_hit(atom/target, blocked = 0)
	..()
	empulse(target, 0, 0)
	return 1


/obj/item/projectile/bullet/gyro
	name ="explosive bolt"
	icon_state= "bolter"
	damage = 50

/obj/item/projectile/bullet/gyro/on_hit(atom/target, blocked = 0)
	..()
	explosion(target, -1, 0, 2)
	return 1

/obj/item/projectile/bullet/a40mm
	name ="40mm grenade"
	desc = "USE A WEEL GUN"
	icon_state= "bolter"
	damage = 60

/obj/item/projectile/bullet/a40mm/on_hit(atom/target, blocked = 0)
	..()
	explosion(target, -1, 0, 2, 1, 0, flame_range = 3)
	return 1

/obj/item/projectile/temp
	name = "temperature beam"
	icon_state = "ice_2"
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	damage = 0
	damage_type = BURN
	nodamage = 1
	flag = "energy"
	temperature = null
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE

/obj/item/projectile/temp/New()
	spawn(1)
		switch(temperature)
			if(501 to INFINITY)
				name = "searing beam"	//if emagged
				icon_state = "temp_8"
			if(400 to 500)
				name = "burning beam"	//temp at which mobs start taking HEAT_DAMAGE_LEVEL_2
				icon_state = "temp_7"
			if(360 to 400)
				name = "hot beam"		//temp at which mobs start taking HEAT_DAMAGE_LEVEL_1
				icon_state = "temp_6"
			if(335 to 360)
				name = "warm beam"		//temp at which players get notified of their high body temp
				icon_state = "temp_5"
			if(295 to 335)
				name = "ambient beam"
				icon_state = "temp_4"
			if(260 to 295)
				name = "cool beam"		//temp at which players get notified of their low body temp
				icon_state = "temp_3"
			if(200 to 260)
				name = "cold beam"		//temp at which mobs start taking COLD_DAMAGE_LEVEL_1
				icon_state = "temp_2"
			if(120 to 260)
				name = "ice beam"		//temp at which mobs start taking COLD_DAMAGE_LEVEL_2
				icon_state = "temp_1"
			if(-INFINITY to 120)
				name = "freeze beam"	//temp at which mobs start taking COLD_DAMAGE_LEVEL_3
				icon_state = "temp_0"
			else
				name = "temperature beam"//failsafe
				icon_state = "temp_4"



/obj/item/projectile/temp/on_hit(atom/target, blocked = 0)//These two could likely check temp protection on the mob
	..()
	if(ismob(target))
		var/mob/living/M = target
		M.bodytemperature = temperature
		if(temperature > 500) //emagged
			M.adjust_fire_stacks(1)
			M.IgniteMob()
			playsound(M.loc, 'sound/effects/bamf.ogg', 50, 0)
		if(istype(M,/mob/living/simple_animal/slime) && temperature < 50)
			M.death()
	return 1

/obj/item/projectile/meteor
	name = "meteor"
	icon = 'icons/obj/meteor.dmi'
	icon_state = "small1"
	damage = 0
	damage_type = BRUTE
	nodamage = 1
	flag = "bullet"

/obj/item/projectile/meteor/Bump(atom/A, yes)
	if(!yes) //prevents multi bumps.
		return
	if(A == firer)
		loc = A.loc
		return
	A.ex_act(2)
	playsound(src.loc, 'sound/effects/meteorimpact.ogg', 40, 1)
	for(var/mob/M in range(10, src))
		if(!M.stat)
			shake_camera(M, 3, 1)
	qdel(src)

/obj/item/projectile/energy/floramut
	name = "alpha somatoray"
	icon_state = "energy"
	damage = 0
	damage_type = TOX
	nodamage = 1
	flag = "energy"

/obj/item/projectile/energy/florayield
	name = "beta somatoray"
	icon_state = "energy2"
	damage = 0
	damage_type = TOX
	nodamage = 1
	flag = "energy"

/obj/item/projectile/beam/mindflayer
	name = "flayer ray"

/obj/item/projectile/beam/mindflayer/on_hit(atom/target, blocked = 0)
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/M = target
		M.adjustBrainLoss(20)
		M.hallucination += 20

/obj/item/projectile/kinetic
	name = "kinetic force"
	icon_state = null
	damage = 10
	damage_type = BRUTE
	flag = "bomb"
	range = 3

obj/item/projectile/kinetic/New()
	var/turf/proj_turf = get_turf(src)
	if(!istype(proj_turf, /turf))
		return
	var/datum/gas_mixture/environment = proj_turf.return_air()
	var/pressure = environment.return_pressure()
	if(pressure < 50)
		name = "full strength kinetic force"
		damage *= 4
	..()

/obj/item/projectile/kinetic/Range()
	range--
	if(range <= 0)
		new /obj/item/effect/kinetic_blast(src.loc)
		qdel(src)

/obj/item/projectile/kinetic/on_hit(atom/target)
	. = ..()
	var/turf/target_turf= get_turf(target)
	if(istype(target_turf, /turf/simulated/mineral))
		var/turf/simulated/mineral/M = target_turf
		M.gets_drilled(firer)
	new /obj/item/effect/kinetic_blast(target_turf)



/obj/item/effect/kinetic_blast
	name = "kinetic explosion"
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "kinetic_blast"
	layer = 4.1

/obj/item/effect/kinetic_blast/New()
	spawn(4)
		qdel(src)

/obj/item/projectile/kinetic/traitor
	damage = 30

/obj/item/projectile/beam/wormhole
	name = "bluespace beam"
	icon_state = "spark"
	hitsound = "sparks"
	damage = 3
	var/obj/item/weapon/gun/energy/wormhole_projector/gun
	color = "#33CCFF"

/obj/item/projectile/beam/wormhole/orange
	name = "orange bluespace beam"
	color = "#FF6600"

/obj/item/projectile/beam/wormhole/New(var/obj/item/ammo_casing/energy/wormhole/casing)
	if(casing)
		gun = casing.gun

/obj/item/ammo_casing/energy/wormhole/New(var/obj/item/weapon/gun/energy/wormhole_projector/wh)
	gun = wh

/obj/item/projectile/beam/wormhole/on_hit(atom/target)
	if(ismob(target))
		return ..()
	if(!gun)
		qdel(src)
	gun.create_portal(src)


/obj/item/projectile/bullet/gyro/on_hit(atom/target, blocked = 0)
	..()
	explosion(target, -1, 0, 2)
	return 1


/obj/item/projectile/bullet/frag12
	name ="explosive slug"
	damage = 25
	weaken = 5

/obj/item/projectile/bullet/frag12/on_hit(atom/target, blocked = 0)
	..()
	explosion(target, -1, 0, 1)
	return 1

/obj/item/projectile/plasma
	name = "plasma blast"
	icon_state = "plasmacutter"
	damage_type = BRUTE
	damage = 5
	range = 3

/obj/item/projectile/plasma/New()
	var/turf/proj_turf = get_turf(src)
	if(!istype(proj_turf, /turf))
		return
	var/datum/gas_mixture/environment = proj_turf.return_air()
	if(environment)
		var/pressure = environment.return_pressure()
		if(pressure < 30)
			name = "full strength plasma blast"
			damage *= 3
	..()

/obj/item/projectile/plasma/on_hit(atom/target)
	. = ..()
	if(istype(target, /turf/simulated/mineral))
		var/turf/simulated/mineral/M = target
		M.gets_drilled(firer)
		range = max(range - 1, 1)
		return -1

/obj/item/projectile/plasma/adv
	range = 5

/obj/item/projectile/plasma/adv/mech
	damage = 10
	range = 6
