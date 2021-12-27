------------------------------------------- Optimization -------------------------------------------
local setmetatable = setmetatable
----------------------------------------------------------------------------------------------------

local ShopShamanItem = table.setNewClass("ShopShamanItem")

ShopShamanItem.new = function(self)
	return setmetatable({
		id = nil,

		isEquiped = nil,

		totalColors = nil,
		colors = nil,

		cheesePrice = nil,
		fraisePrice = nil,

		isNew = nil,
		flags = nil
	}, self)
end

ShopShamanItem.loadOwned = function(self, packet, category, id, totalColors)
	self.id = packet:read16()

	self.isEquiped = packet:readBool()

	self.totalColors = packet:read8()

	if self.totalColors > 0 then
		local colors = { }
		self.colors = colors

		for c = 1, self.totalColors - 1 do
			colors[c] = packet:read32()
		end
	end

	return self
end

ShopShamanItem.loadPurchasable = function(self, packet)
	local id = packet:read32()
	local totalColors = packet:read8()

	self.isNew = packet:readBool()
	self.flags = packet:read8()

	self.cheesePrice = packet:read32()
	self.fraisePrice = packet:read16()

	return self
end

return ShopShamanItem