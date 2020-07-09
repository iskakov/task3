SELECT Consumer.primarykey, Consumer.personal_account, Count(NetworkSection2ObjectHeatConsum.network_section_id)
FROM Consumer left JOIN ObjectHeatConsumption ON Consumer.primarykey = ObjectHeatConsumption.consumer_id
		LEFT JOIN NetworkSection2ObjectHeatConsum ON ObjectHeatConsumption.primarykey = NetworkSection2ObjectHeatConsum.object_heat_consum_id
WHERE NetworkSection2ObjectHeatConsum.is_inside = 1
GROup BY Consumer.primarykey, Consumer.personal_account
ORDER BY Count(NetworkSection2ObjectHeatConsum.network_section_id) DESC
