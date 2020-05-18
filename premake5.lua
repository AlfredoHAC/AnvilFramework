-- Workspace definitions.
workspace "Anvil"

    -- Architecture
    architecture "x86_64"

    -- Start project
    startproject "Sandbox"

    -- Main build configurations.
    configurations {
        "Debug",
        "Optimized",
        "Release"
    }

    -- Flags for debbuging information.
    flags {

        -- Enable Visual Studio to use multiple compiler processes when building.
        "MultiProcessorCompile"
    }

-- Anvil lib definitions.
project "Anvil"

    -- Basic definitions.
    kind "StaticLib"
    language "C++"
    cppdialect "C++14"
    location "Anvil"
    staticruntime "on"

    -- Compiled binary files location.
    targetdir "%{prj.name}/bin/%{cfg.buildcfg}/"
    objdir "%{prj.name}/bin/obj/%{cfg.buildcfg}/"

    -- Source-files location.
    files {
        "%{prj.name}/include/**.hpp",
        "%{prj.name}/src/**.cpp"
    }

    -- Build filters.
    filter "configurations:Debug"
        defines "ANVL_DEBUG"
        symbols "On"
    
    filter "configurations:Optimized"
        defines "ANVL_OPTIMIZED"
        optimize "On"
        
    filter "configurations:Release"
        defines "ANVL_RELEASE"
        optimize "Full"

    
-- Sandbox application definitions.
project "Sandbox"

    -- Basic definitions.
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++14"
    location "Sandbox"
    staticruntime "on"
    
    -- Dependencies linkage
    links { "Anvil" }
    
    -- Compiled binary files location.
    targetdir "%{prj.name}/bin/%{cfg.buildcfg}/"
    objdir "%{prj.name}/bin/obj/%{cfg.buildcfg}/"

    -- Source-files location.
    files {
        "%{prj.name}/include/**.hpp",
        "%{prj.name}/src/**.cpp"
    }
    
    -- Build filters.
    filter "configurations:Debug"
        defines "ANVL_DEBUG"
        symbols "On"
    
    filter "configurations:Optimized"
        defines "ANVL_OPTIMIZED"
        optimize "On"
        
    filter "configurations:Release"
        defines "ANVL_RELEASE"
        optimize "On"