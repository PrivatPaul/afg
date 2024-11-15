-- Author: PrivatPaul
-- Owner: Average Floppa Games © 2024

export type RbxAssetId = string;

local FactionService = {}
local FactionManager = {}

FactionService.__index = FactionService
FactionManager.__index = FactionManager

FactionService.ForbiddenNames = {
	"dev", "game", "mu", "afg", "mu777", "mu888", "mu999", "muupdate"
}

function FactionService:FilterForbiddenName(name: string): boolean
	for _, forbidden in ipairs(self.ForbiddenNames) do
		if name:find(forbidden) then
			return false
		end
	end
	return true
end

function FactionManager:AddFaction(components: {
		name: string,
		creator: string,
		icon: RbxAssetId
	})
	
	FactionService:FilterForbiddenName(components.name)
end

return {FactionService = FactionService, FactionManager = FactionManager}
