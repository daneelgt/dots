
hl.monitor({
    output = "DP-2",
    mode = "1920x1080@180",
    position = "0x0",
    scale = "1",
    vrr = 1,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "0x1080",
    scale = "1",
})

--monitor = HDMI-A-1, 1920x1080@60, auto, 1.25, transform, 1
--monitor = DP-2, 1920x1080@180, auto, 1, vrr, 1

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
-- env = WLR_NO_HARDWARE_CURSORS,1
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("__GL_GSYNC_ALLOWED", "1")
hl.env("__GL_VRR_ALLOWED", "1")
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "24")

-- TODO: manual review — top-level key 'blurls = waybar' has no enclosing section

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.22, 1 }, { 0.36, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0 }, { 0.35, 1 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4,
    bezier = "overshot",
    style = "slide",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 3,
    bezier = "easeOutQuint",
    style = "slide",
})
hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 6,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 30,
    bezier = "linear",
    style = "loop",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    bezier = "easeOutQuint",
    style = "slide",
})
hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
    style = "fade",
})

local mod = "SUPER"

hl.bind(mod .. " + Return", hl.dsp.exec_cmd("ghostty"))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + M", hl.dsp.exit())
hl.bind(mod .. " + T", hl.dsp.exec_cmd("nautilus"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("kitty --class yazi -e yazi"))
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + R", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mod .. " + P", hl.dsp.window.pseudo())
hl.bind(mod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mod .. " + G", hl.dsp.exec_cmd("~/.config/hypr/scripts/gamemode.sh toggle"))
hl.bind(mod .. " + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/wallpaper.sh next"))
hl.bind(mod .. " + D", hl.dsp.exec_cmd("discord"), { dont_inhibit = true })
hl.bind(mod .. " + D", hl.dsp.exec_cmd("equibop"), { dont_inhibit = true })

hl.bind(mod .. " + SHIFT + D", hl.dsp.exec_cmd("~/.config/hypr/scripts/discord-launch.sh"), { dont_inhibit = true })
hl.bind(mod .. " + SHIFT + E", hl.dsp.exec_cmd("wlogout -p layer-shell"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh area"))
hl.bind(mod .. " + SHIFT + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

hl.bind("Print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh area"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh full"))
hl.bind(mod .. " + Print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh window"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })

hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" }))
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

hl.bind(mod .. " + CTRL + left", hl.dsp.window.resize({ x = -40, y = 0, relative = true }))
hl.bind(mod .. " + CTRL + right", hl.dsp.window.resize({ x = 40, y = 0, relative = true }))
hl.bind(mod .. " + CTRL + up", hl.dsp.window.resize({ x = 0, y = -40, relative = true }))
hl.bind(mod .. " + CTRL + down", hl.dsp.window.resize({ x = 0, y = 40, relative = true }))
hl.bind(mod .. " + CTRL + H", hl.dsp.focus({ monitor = -1 }))
hl.bind(mod .. " + CTRL + L", hl.dsp.focus({ monitor = "+1" }))
hl.bind(mod .. " + CTRL + left", hl.dsp.focus({ monitor = -1 }))
hl.bind(mod .. " + CTRL + right", hl.dsp.focus({ monitor = "+1" }))
hl.bind(mod .. " + CTRL + SHIFT + H", hl.dsp.window.move({ monitor = "-1", follow = false }))
hl.bind(mod .. " + CTRL + SHIFT + L", hl.dsp.window.move({ monitor = "+1", follow = false }))
hl.bind(mod .. " + CTRL + SHIFT + left", hl.dsp.window.move({ monitor = "-1", follow = false }))
hl.bind(mod .. " + CTRL + SHIFT + right", hl.dsp.window.move({ monitor = "+1", follow = false }))

hl.bind(mod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mod .. " + 9", hl.dsp.focus({ workspace = 9 }))

hl.bind(mod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))

hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize())

hl.window_rule({
    name = "steam-games-fullscreen",
    match = {
        class = "^(steam_app_.*)$",
    },
    immediate = true,
    fullscreen = true,
    no_blur = true,
    no_anim = true,
    border_size = 0,
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    name = "discord-workspace",
    match = {
        class = "^(discord)$",
    },
    workspace = "3 silent",
})

hl.window_rule({
    name = "browser-workspace",
    match = {
        class = "^(firefox-browser|Firefox-browser|firefox)$",
    },
    workspace = "2 silent",
})

hl.window_rule({
    name = "steam-client",
    match = {
        class = "^(steam)$",
    },
    no_blur = true,
    workspace = "4 silent",
})

hl.window_rule({
    name = "steam-main-window-float",
    match = {
        class = "^(steam)$",
        title = "^(Steam)$",
    },
    float = true,
})

hl.window_rule({
    name = "heroic-main-window",
    match = {
        class = "^(com.heroicgameslauncher.hgl)$",
    },
    no_blur = true,
})

hl.window_rule({
    name = "heroic-dialogs-float",
    match = {
        class = "^(com.heroicgameslauncher.hgl)$",
        title = "negative:(Heroic Games Launcher)",
    },
    float = true,
    center = true,
})

hl.window_rule({
    name = "xwayland-fullscreen-immediate",
    match = {
        xwayland = true,
        fullscreen = true,
    },
    immediate = true,
})

hl.window_rule({
    name = "all-fullscreen-no-blur",
    match = {
        fullscreen = true,
    },
    no_blur = true,
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    name = "pavucontrol-floating",
    match = {
        class = "^(pavucontrol)$",
    },
    float = true,
    center = true,
    size = "700 450",
})

hl.window_rule({
    name = "nm-connection-editor-floating",
    match = {
        class = "^(nm-connection-editor)$",
    },
    float = true,
})

hl.window_rule({
    name = "blueman-manager-floating",
    match = {
        class = "^(blueman-manager)$",
    },
    float = true,
})

hl.window_rule({
    name = "file-dialog-open",
    match = {
        title = "^(Open File)$",
    },
    float = true,
    center = true,
})

hl.window_rule({
    name = "file-dialog-save",
    match = {
        title = "^(Save File)$",
    },
    float = true,
    center = true,
})

hl.window_rule({
    name = "rofi-style",
    match = {
        class = "^(Rofi|rofi)$",
    },
    no_anim = false,
    no_blur = false,
    float = true,
    center = true,
})

hl.window_rule({
    name = "yazi-float",
    match = {
        class = "^(yazi)$",
    },
    float = true,
    size = "1200 760",
    center = true,
})

hl.window_rule({
    name = "xwayland-empty-class-title-fix",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
    },
    no_blur = true,
})

hl.config({
    input = {
        -- Layouts: Brasileiro (br) e Americano (us)
        kb_layout = "br,us",
        -- Variantes: O espaço antes da vírgula é para o 'br' (padrão) 
        -- e 'intl' é para o 'us' (internacional com acentos)
        kb_variant = ",",
        -- Atalho para trocar de teclado (Tecla Windows + Espaço)
        kb_options = "grp:win_space_toggle",
        follow_mouse = 1,
        sensitivity = 0,
        accel_profile = "flat",
        touchpad = {
            natural_scroll = false,
        },
    },
    general = {
        gaps_in = 5,
        gaps_out = 10, --talva 14
        border_size = 0,
        layout = "dwindle",
        allow_tearing = true,
    },
    decoration = {
        rounding = 10,
        active_opacity = 0.9,
        inactive_opacity = 0.9,
        fullscreen_opacity = 1.0,
        blur = {
            enabled = true,
            size = 3,
            passes = 4,
            new_optimizations = true,
            xray = false,
            ignore_opacity = false,
            contrast = 1.0,
            brightness = 1.0,
        },
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },
    },
    -- Ativa o efeito de blur na Waybar transparente
    animations = {
        enabled = true,
    },
    dwindle = {
        force_split = 0,
        preserve_split = true,
        smart_split = false,
        smart_resizing = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        focus_on_activate = false,
        animate_manual_resizes = true,
        animate_mouse_windowdragging = false,
    },
    render = {
        direct_scanout = true,
    },
    cursor = {
        no_hardware_cursors = true,
        sync_gsettings_theme = true,
    },
})

hl.on("hyprland.start", function()
    hl.exec_cmd("wal -R && sleep 2 && killall -SIGUSR2 waybar")
    hl.exec_cmd("swww-daemon")
    hl.exec_cmd("~/.config/hypr/scripts/wallpaper.sh init")
    hl.exec_cmd("~/.config/hypr/scripts/wallpaper-auto.sh")
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("hyprctl setcursor Nordzy-cursors 24")
    hl.exec_cmd("bluetoothctl power on")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("udiskie &")
    hl.exec_cmd("solaar --window=hide")
    hl.exec_cmd("wal -R")
end)

