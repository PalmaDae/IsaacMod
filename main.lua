local mod = RegisterMod("My mod", 1)

local damagePotion = Isaac.GetItemIdByName("Damage Potion")
local damagePotionDamage = 1
local lastCount = 0

function mod:EvaluateCache(player, cacheFlags)
    if (cacheFlags & CacheFlag.CACHE_DAMAGE) == CacheFlag.CACHE_DAMAGE then
        local itemCount = player:GetCollectibleNum(damagePotion)
        player.Damage = player.Damage + damagePotionDamage * itemCount
    end
    
end



mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.EvaluateCache)


function mod:OnUpdate(player)
    local player = Isaac.GetPlayer()
    local currentCount = player:GetCollectibleNum(damagePotion)
    
    
    if currentCount > lastCount then
        local diff = currentCount - lastCount
        player:AddBlackHearts(2 * diff)
        lastCount = currentCount
    elseif currentCount < lastCount then
        lastCount = currentCount
    end
end
mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, mod.OnUpdate)
