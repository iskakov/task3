SELECT TOP(5) Building.primarykey,Building.city,Building.street,Building.number,COUNT (NetworkSection2ObjectHeatConsum.network_section_id)
FROM Building JOIN ObjectHeatConsumption ON Building.primarykey = ObjectHeatConsumption.building_id
		JOIN NetworkSection2ObjectHeatConsum  ON ObjectHeatConsumption.primarykey = NetworkSection2ObjectHeatConsum.object_heat_consum_id
WHERE NetworkSection2ObjectHeatConsum.is_inside = 0
GROUP BY Building.primarykey,Building.city,Building.street,Building.number
ORDER BY COUNT (NetworkSection2ObjectHeatConsum.network_section_id) Desc