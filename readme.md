# Lua-based MC Mod Proof of Concept / Idea

I was thinking about this as a better/easier solution for creating mods for minecraft

## The idea

- Mods are written in Lua, likely importing some extra code which provides an interface to the minecraft mappings / minecraft api for developing features
- Lua is a easy and fast language
- Could be compiled, or using similar methods to how Love2D handles code, or Luac for making binary data (just like .jar!)

## Why?

I find Java, as a language, a nightmare (personal opinion on the internet??!?). The syntax, classes, and just everything went over my head when learning about it, even when I try to actually learn stuff. Lua is a fast and simple language, but extendable and very customizable, making it seem to work well with something like minecraft?

## How?

I'd expect there to be a mod that would handle the conversion of the likely raw or obfuscated lua code, and then transpile or simply convert the instructions into something the game can understand. Maybe even a reload feature, since it loads the data after the mod is loaded, so mods can be hotswapped or edited without reloading the game over and over.. In addition, inclusion of extra java code if said feature is not possible for something like Lua could be included.

This approach also means that mods only have to be made once, and as long as there is a translator for the mod engine (forge, fabric, quilt, etc) then the mod can be run

File/Folder structure:
```
project_directory/
│
├── lib/
│   ├──  gui/ 
│   ├──  world/ 
│   ├──  entity/ (etc etc you get the point)
│   └── libraries here..
├── ModName/
│   └── SomeCode.lua
├── resources/
│   ├── ../
│   └── assets/ 
│        ├── images
│        ├── audio/sfx
│        └── model data (.json or whatever the format is)
│
│
├── main.lua
└── conf.lua

```

### Conf.lua

```lua

-- similar to love2d eh?, i just think their method is smart and makes sense

function MCLua.conf(mod)

    mod.name = "My Minecraft Mod"
    mod.description = "A Minecraft Mod"
    mod.identity = "io.github.okzyrox" -- java style mod id or something
    mod.logo = "resources/logo.png" -- or something else
    mod.version = "0.0.1"
    mod.authors = {
        ["AuthorName"] = "AuthorContribution",
        -- i.e..
        ["okzyrox"] = "Mod creator"
    }
    mod.contact = {
        ["source"] = "https://github.com/...",
        ["website"] = "google.com",
        ["issues"] = "repoURL/issues",
        -- twitter, discord, bsky, etc
    }
    -- etc etc
end

```

### Main.lua

```lua
local requiredCode = require 'ModName.someCode'
-- require above


function mod.OnInit()
    print("Hello World")
    requiredCode.init()
    --
end

function mod.OnUpdate(tick)
    -- do something

    -- arbitrary names but you get the point..
    -- what this does is: if the player (not the guy YOU) is in a world, and not in a server
    -- -it takes 1 from the player every tick
    -- a deltatime is not used due to the effects of it from framerate
    if mod.game.isInGame == true and mod.game.isInServer == false then
        player = mod.game.entity.player.GetPlayerEntity()
        player.health -= 1
    end


    -- or

    requiredCode.update(tick)
end
```

```lua
-- Or for creating and managing resources..

-- sounds.lua

local SoundEventRegistry = mod.minecraft.registries.SoundEvent -- equiv to java

local NewSoundResource = mod.minecraft.SoundEvent.new(
    'entity.generic.damage' -- sound id, usually got from an accompaning file 'sounds.json' in the resources folder, which has the id as the key
)

function Init()
    mod.minecraft.registry.AddRegistry(
        SoundEventRegistry,
        NewSoundResource.id,
        NewSoundResource
    )

end


-- main.lua

local Sounds = require 'ModName.sounds'

function mod.OnInit()
    Sounds.init()

end

```
you get the idea

### Will this ever be a thing

Maybe who knows. I might make it, you might make it, it's all up to how much people see the idea and understand it and are "yes i want that i hate Java Java sucks", or something. I'm not trying to discredit Java, there have been some amazing things made with java and it is very well covered, documented and full of libraries for creators, I just want an alternative that is more friendly to people that aren't fans of object oriented langs or weird syntax.

Projects such as [Minetest](https://github.com/minetest/minetest), which is a 3d voxel game, already support modding and changing the game using lua, and it works very well there!, so I don't know why there isn't an equivalent to that for minecraft.