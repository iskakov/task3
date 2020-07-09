SELECT TypeIsolation.name, NetworkArea.name, count(NetworkArea.primarykey)
FROM TypeIsolation JOIN NetworkSection ON TypeIsolation.primarykey = NetworkSection.type_isolation_id
	LEft JOIN NetworkSection2ObjectHeatConsum ON NetworkSection.primarykey = NetworkSection2ObjectHeatConsum.network_section_id
	LEft JOIN ObjectHeatConsumption ON NetworkSection2ObjectHeatConsum.object_heat_consum_id  = ObjectHeatConsumption.primarykey
	LEft JOIN Building ON ObjectHeatConsumption.building_id = Building.primarykey
	LEft JOIN NetworkArea ON Building.network_area_id = NetworkArea.primarykey
GROUP BY  NetworkArea.name,TypeIsolation.name
ORDER BY count(NetworkArea.primarykey) DESC
