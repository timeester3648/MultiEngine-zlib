include "../../premake/common_premake_defines.lua"

project "zlib"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	cdialect "C17"
	targetname "%{prj.name}"
	inlining "Auto"

	includedirs {
		"%{IncludeDir.zlib}"
	}

	files {
		"./*.h",
		"./*.c"
	}

	filter "toolset:msc"
		disablewarnings { "4267", "4996" }

 	filter "system:windows"
		defines { "_CRT_SECURE_NO_WARNINGS", "_CRT_NONSTDC_NO_DEPRECATE" }