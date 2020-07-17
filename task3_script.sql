SELECT Consumer.primarykey, Consumer.personal_account, Count(NetworkSection2ObjectHeatConsum.network_section_id) as u
FROM Consumer left JOIN ObjectHeatConsumption ON Consumer.primarykey = ObjectHeatConsumption.consumer_id
		LEFT JOIN NetworkSection2ObjectHeatConsum ON ObjectHeatConsumption.primarykey = NetworkSection2ObjectHeatConsum.object_heat_consum_id
WHERE NetworkSection2ObjectHeatConsum.is_inside = 1
Group by Consumer.primarykey, Consumer.personal_account

HAVING Count(NetworkSection2ObjectHeatConsum.network_section_id) =  (SELECT MAX(q1.u) FROM (SELECT Consumer.primarykey, Count(NetworkSection2ObjectHeatConsum.network_section_id) as u
FROM Consumer left JOIN ObjectHeatConsumption ON Consumer.primarykey = ObjectHeatConsumption.consumer_id
		LEFT JOIN NetworkSection2ObjectHeatConsum ON ObjectHeatConsumption.primarykey = NetworkSection2ObjectHeatConsum.object_heat_consum_id
WHERE NetworkSection2ObjectHeatConsum.is_inside = 1
Group by Consumer.primarykey) as q1)
