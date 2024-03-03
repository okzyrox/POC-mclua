local Registry = MCLua.minecraft.registry.Registry
local BuiltInRegistries = MCLua.minecraft.registry.BuiltInRegistries
local ResourceLocation = MCLUA.minecraft.resources.ResourceLocation
local Block = MCLua.minecraft.world.level.block.Block





--[[
something like..
BuiltInRegistries = {
    ["BLOCK"] = ...,
    ["ITEM"] = ...,
    you get the idea
}

]]

Blocks = {
    ["RubyBlock"] = require 'MyAwesomeMod.block.RubyBlock'
}
-- or
local RubyBlock = require 'MyAwesomeMod.block.RubyBlock'



function Load()
    RUBY_BLOCK = Registry.register(
        BuiltInRegistries["BLOCK"],
        ResourceLocation:new(
            conf.identity, --??
            "ruby_block",
            Blocks["RubyBlock"]


        )
    )
end

function LoadClient()
    Blocks["RubyBlock"]:initClient()
end