-- set minimum xmake version
set_xmakever("2.8.2")

-- includes
includes("lib/commonlibsse-ng")
includes("lib/CLibUtil")

-- set project
set_project("commonlibsse-ng-template")
set_version("0.0.0")
set_license("GPL-3.0")

-- set defaults
set_languages("c++23")
set_warnings("allextra")
set_defaultmode("releasedbg")

-- set policies
set_policy("package.requires_lock", true)

-- add rules
add_rules("mode.debug", "mode.releasedbg")
add_rules("plugin.vsxmake.autoupdate")

-- require packages
add_requires("xbyak", "simpleini")

-- targets
target("commonlibsse-ng-template")
    -- add dependencies to target
    add_deps("commonlibsse-ng", "CLibUtil")

    -- add packages to target
    add_packages("xbyak", "simpleini")

    -- add commonlibsse-ng plugin
    add_rules("commonlibsse-ng.plugin", {
        name = "commonlibsse-ng-template",
        author = "Enneal",
        description = "SKSE64 plugin template using CommonLibSSE-NG"
    })

    -- add src files
    add_files("src/**.cpp")
    add_headerfiles("include/**.h")
    add_includedirs("include")
    set_pcxxheader("include/pch.h")
