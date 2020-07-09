SELECT TOP(10) ObjectHeatConsumption.primarykey AS pk ,ObjectHeatConsumption.name AS name1 , Count(NetworkSection.primarykey) as count1
FROM ObjectHeatConsumption left JOIN NetworkSection2ObjectHeatConsum  On ObjectHeatConsumption.primarykey = NetworkSection2ObjectHeatConsum.object_heat_consum_id 
				left JOIN NetworkSection ON NetworkSection2ObjectHeatConsum.network_section_id = NetworkSection.primarykey
Group by dbo.ObjectHeatConsumption.primarykey, ObjectHeatConsumption.name
ORder BY count1 DESc
