local BlockData = MCLua.minecraft.world.block
--[[
BlockData.state.BlockState
BlockData.state.StateDefinition#
BlockData.Rotation
]]
local Block = MCLua.minecraft.world.level.block.Block


local RubyBlockProperties = BlockData.state.BlockBehaviour.Properties:new(
    -- tool required
    -- tool required  for drops
    -- sound played
    -- light emitted
    -- etc
)

local RubyBlock = Block:init(
    RubyBlockProperties
)

-- override
function RubyBlock:initClient()
    -- do client init
end


return RubyBlock