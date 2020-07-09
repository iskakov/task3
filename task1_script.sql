SELECT NetworkArea.primarykey AS pk, NetworkArea.name AS name, COUNT(dbo.ObjectHeatConsumption.primarykey) As count_object 
FROM NetworkArea left JOIN Building  On NetworkArea.primarykey = Building.network_area_id 
				left JOIN ObjectHeatConsumption ON Building.primarykey = ObjectHeatConsumption.building_id
Group by dbo.NetworkArea.primarykey, dbo.NetworkArea.name 
Order BY count_object  DESC;