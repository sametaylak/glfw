project "GLFW"
  kind "StaticLib"
  language "C"
  staticruntime "off"

  targetdir ("bin/" .. outputdir .. "/%{prj.name}")
  objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

  files
  {
    "%{prj.location}/include/GLFW/glfw3.h",
    "%{prj.location}/include/GLFW/glfw3native.h",
    "%{prj.location}/src/internal.h",
    "%{prj.location}/src/platform.h",
    "%{prj.location}/src/mappings.h",
    "%{prj.location}/src/context.c",
    "%{prj.location}/src/init.c",
    "%{prj.location}/src/input.c",
    "%{prj.location}/src/monitor.c",
    "%{prj.location}/src/platform.c",
    "%{prj.location}/src/vulkan.c",
    "%{prj.location}/src/window.c",
    "%{prj.location}/src/egl_context.c",
    "%{prj.location}/src/osmesa_context.c",
    "%{prj.location}/src/null_platform.h",
    "%{prj.location}/src/null_joystick.h",
    "%{prj.location}/src/null_init.c",
    "%{prj.location}/src/null_monitor.c",
    "%{prj.location}/src/null_window.c",
    "%{prj.location}/src/null_joystick.c"
  }

  filter "system:macosx"
    pic "On"

    files
    {
      "${prj.location}/src/cocoa_time.h",
      "${prj.location}/src/cocoa_time.c",
      "${prj.location}/src/posix_thread.h",
      "${prj.location}/src/posix_module.c",
      "${prj.location}/src/posix_thread.c",
      "${prj.location}/src/cocoa_platform.h",
      "${prj.location}/src/cocoa_joystick.h",
      "${prj.location}/src/cocoa_init.m",
      "${prj.location}/src/cocoa_joystick.m",
      "${prj.location}/src/cocoa_monitor.m",
      "${prj.location}/src/cocoa_window.m",
      "${prj.location}/src/nsgl_context.m"
    }

    defines
    {
      "_GLFW_COCOA"
    }

  filter "system:linux"
    pic "On"

    systemversion "latest"
    
    files
    {
      "${prj.location}/src/x11_platform.h",
      "${prj.location}/src/xkb_unicode.h",
      "${prj.location}/src/x11_init.c",
      "${prj.location}/src/x11_monitor.c",
      "${prj.location}/src/x11_window.c",
      "${prj.location}/src/xkb_unicode.c",
      "${prj.location}/src/glx_context.c",
    }

    defines
    {
      "_GLFW_X11"
    }

  filter "system:windows"
    systemversion "latest"

    files
    {
      "${prj.location}/src/win32_platform.h",
      "${prj.location}/src/win32_joystick.h",
      "${prj.location}/src/win32_init.c",
      "${prj.location}/src/win32_joystick.c",
      "${prj.location}/src/win32_monitor.c",
      "${prj.location}/src/win32_window.c",
      "${prj.location}/src/wgl_context.c",
    }

    defines 
    { 
      "_GLFW_WIN32"
    }

  filter "configurations:Debug"
    runtime "Debug"
    symbols "on"

  filter "configurations:Release"
    runtime "Release"
    optimize "on"
