local mod = RegisterMod("My mod", 1)

local damagePotion = Isaac.GetItemIdByName("Damage Potion")
local damagePotionDamage = 1

function mod:EvaluateCache(player, cacheFlags)
    if (cacheFlags & CacheFlag.CACHE_DAMAGE) == CacheFlag.CACHE_DAMAGE then
        local itemCount = player:GetCollectibleNum(damagePotion)
        player.Damage = player.Damage + damagePotionDamage * itemCount
    end
end

mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.EvaluateCache)
