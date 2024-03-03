function MCLua.conf(mod)

    mod.name = "My new Minecraft Mod"
    mod.description = "Awesome Minecraft Mod"
    mod.identity = "io.github.okzyrox" -- java style mod id or something
    mod.logo = "resources/logo.png" -- or something else
    mod.version = "0.0.1"
    mod.authors = {
        ["AuthorName"] = "AuthorContribution",
        -- i.e..
        ["okzyrox"] = "Mod creator"
    }
    mod.contact = {
        ["source"] = "https://github.com/okzyrox/POC-mclua",
        ["website"] = "https://github.com/okzyrox",
        ["issues"] = "https://github.com/okzyrox/POC-mclua/issues",
        -- twitter, discord, bsky, etc
    }
    -- etc etc
end