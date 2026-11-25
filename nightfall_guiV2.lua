local Nightfall = {}

local DEV_USERS = {
    "lastpeakerss",
}

function Nightfall:CreateWindow(options)
    options = options or {}
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local Players = game:GetService("Players")
    local CoreGui = game:GetService("CoreGui")

    local LocalPlayer = Players.LocalPlayer

    local connections = {}
    local function connect(signal, callback)
        local connection = signal:Connect(callback)
        table.insert(connections, connection)
        return connection
    end

    local gethui = gethui
        or function()
            local success, hui = pcall(function()
                return CoreGui
            end)
            return (success and hui) or LocalPlayer:WaitForChild("PlayerGui")
        end

    if getgenv and getgenv().NightFallGUI then
        pcall(function()
            getgenv().NightFallGUI:Destroy()
        end)
    end

    local THEME = {
        BgMain = Color3.fromRGB(7, 6, 11),
        BgSecondary = Color3.fromRGB(13, 10, 20),
        BgPanel = Color3.fromRGB(16, 12, 25),
        BgPanelHover = Color3.fromRGB(24, 18, 36),
        BgInner = Color3.fromRGB(11, 8, 17),
        Border = Color3.fromRGB(48, 32, 68),
        BorderActive = Color3.fromRGB(139, 66, 232),
        PrimaryPurp = Color3.fromRGB(117, 60, 186),
        AccentPurp = Color3.fromRGB(151, 98, 207),
        AccentGlow = Color3.fromRGB(150, 60, 255),
        TextPrimary = Color3.fromRGB(211, 199, 229),
        TextMuted = Color3.fromRGB(130, 116, 147),
        TextDark = Color3.fromRGB(85, 74, 98),
        SuccessGreen = Color3.fromRGB(54, 216, 137),
        DangerRed = Color3.fromRGB(244, 63, 94),
        WarnYellow = Color3.fromRGB(251, 191, 36),
    }

    local ICONS = {
        Home = "rbxassetid://10723407389",
        User = "rbxassetid://10747373176",
        Eye = "rbxassetid://10723346959",
        Settings = "rbxassetid://10734950309",
        Terminal = "rbxassetid://10734982144",
        Target = "rbxassetid://10734977012",
        Speed = "rbxassetid://10723395708",
        Shield = "rbxassetid://10734951847",
        Trash = "rbxassetid://10747362393",
        Diamond = "rbxassetid://10709819149",
        Electricity = "rbxassetid://10723345749",
        Moon = "rbxassetid://10734897102",
        Package = "rbxassetid://10734909540",
        Minus = "rbxassetid://10734896206",
        Square = "rbxassetid://10734965702",
        Close = "rbxassetid://10747384394",
        ChevronRight = "rbxassetid://10709782497",
        ChevronLeft = "rbxassetid://10709782559",
        Glow = "",
        Shadow = "",
        Sun = "local:sun",
        Layers = "local:layers",
        Palette = "local:palette",
        Heart = "local:heart",
        Pin = "local:pin",
        Arrow = "local:arrow",
        Cross = "local:cross",
        Box = "local:box",
        Keyboard = "rbxassetid://10734898107",
    }

    local ICON_PATHS = {
        [ICONS.Sun] = {
            {
                12,
                2,
                12,
                5,
            },
            {
                12,
                19,
                12,
                22,
            },
            {
                2,
                12,
                5,
                12,
            },
            {
                19,
                12,
                22,
                12,
            },
            {
                5,
                5,
                7,
                7,
            },
            {
                17,
                17,
                19,
                19,
            },
            {
                5,
                19,
                7,
                17,
            },
            {
                17,
                7,
                19,
                5,
            },
            {
                12,
                7,
                17,
                12,
                12,
                17,
                7,
                12,
                12,
                7,
            },
        },
        [ICONS.Layers] = {
            {
                2,
                8,
                12,
                3,
                22,
                8,
                12,
                13,
                2,
                8,
            },
            {
                2,
                13,
                12,
                18,
                22,
                13,
            },
            {
                2,
                18,
                12,
                23,
                22,
                18,
            },
        },
        [ICONS.Palette] = {
            {
                12,
                2,
                5,
                4,
                2,
                11,
                4,
                18,
                10,
                22,
                14,
                21,
                13,
                16,
                20,
                15,
                22,
                10,
                19,
                4,
                12,
                2,
            },
            {
                7,
                7,
                8,
                7,
            },
            {
                14,
                6,
                15,
                6,
            },
            {
                18,
                10,
                19,
                10,
            },
            {
                6,
                13,
                7,
                13,
            },
        },
        [ICONS.Heart] = {
            {
                12,
                21,
                3,
                12,
                2,
                7,
                5,
                3,
                9,
                3,
                12,
                7,
                15,
                3,
                19,
                3,
                22,
                7,
                21,
                12,
                12,
                21,
            },
        },
        [ICONS.Pin] = {
            {
                12,
                23,
                4,
                12,
                3,
                7,
                7,
                2,
                17,
                2,
                21,
                7,
                20,
                12,
                12,
                23,
            },
            {
                9,
                8,
                12,
                5,
                15,
                8,
                12,
                11,
                9,
                8,
            },
        },
        [ICONS.Arrow] = {
            {
                12,
                22,
                12,
                3,
            },
            {
                5,
                10,
                12,
                3,
                19,
                10,
            },
        },
        [ICONS.Cross] = {
            {
                9,
                2,
                15,
                2,
                15,
                9,
                22,
                9,
                22,
                15,
                15,
                15,
                15,
                22,
                9,
                22,
                9,
                15,
                2,
                15,
                2,
                9,
                9,
                9,
                9,
                2,
            },
        },
        [ICONS.Box] = {
            {
                3,
                3,
                21,
                3,
                21,
                21,
                3,
                21,
                3,
                3,
            },
            {
                3,
                3,
                21,
                21,
            },
            {
                21,
                3,
                3,
                21,
            },
        },
        [ICONS.Home] = {
            {
                3,
                11,
                12,
                3,
                21,
                11,
            },
            {
                5,
                10,
                5,
                21,
                10,
                21,
                10,
                14,
                14,
                14,
                14,
                21,
                19,
                21,
                19,
                10,
            },
        },
        [ICONS.User] = {
            {
                4,
                21,
                4,
                18,
                7,
                14,
                17,
                14,
                20,
                18,
                20,
                21,
            },
        },
        [ICONS.Eye] = {
            {
                2,
                12,
                6,
                7,
                12,
                5,
                18,
                7,
                22,
                12,
                18,
                17,
                12,
                19,
                6,
                17,
                2,
                12,
            },
        },
        [ICONS.Settings] = {
            {
                9,
                3,
                15,
                3,
                16,
                6,
                19,
                7,
                22,
                10,
                20,
                13,
                20,
                17,
                17,
                18,
                15,
                22,
                11,
                21,
                9,
                18,
                5,
                18,
                3,
                15,
                5,
                12,
                4,
                8,
                7,
                6,
                9,
                3,
            },
        },
        [ICONS.Terminal] = {
            {
                4,
                5,
                10,
                11,
                4,
                17,
            },
            {
                12,
                19,
                21,
                19,
            },
        },
        [ICONS.Target] = {
            {
                12,
                1,
                12,
                6,
            },
            {
                12,
                18,
                12,
                23,
            },
            {
                1,
                12,
                6,
                12,
            },
            {
                18,
                12,
                23,
                12,
            },
        },
        [ICONS.Speed] = {
            {
                13,
                7,
                9,
                12,
                14,
                15,
                11,
                22,
            },
            {
                9,
                12,
                5,
                11,
                2,
                15,
            },
            {
                12,
                9,
                17,
                12,
                21,
                10,
            },
            {
                9,
                16,
                5,
                21,
            },
        },
        [ICONS.Shield] = {
            {
                12,
                2,
                21,
                6,
                20,
                14,
                17,
                19,
                12,
                22,
                7,
                19,
                4,
                14,
                3,
                6,
                12,
                2,
            },
            {
                12,
                3,
                12,
                21,
            },
        },
        [ICONS.Trash] = {
            {
                3,
                6,
                21,
                6,
            },
            {
                8,
                6,
                8,
                3,
                16,
                3,
                16,
                6,
            },
            {
                6,
                7,
                7,
                21,
                17,
                21,
                18,
                7,
            },
            {
                10,
                10,
                10,
                17,
            },
            {
                14,
                10,
                14,
                17,
            },
        },
        [ICONS.Diamond] = {
            {
                12,
                1,
                15,
                9,
                23,
                12,
                15,
                15,
                12,
                23,
                9,
                15,
                1,
                12,
                9,
                9,
                12,
                1,
            },
        },
        [ICONS.Electricity] = {
            {
                13,
                2,
                4,
                14,
                11,
                14,
                9,
                23,
                21,
                9,
                13,
                9,
                13,
                2,
            },
        },
        [ICONS.Moon] = {
            {
                17,
                2,
                10,
                3,
                5,
                7,
                3,
                13,
                5,
                19,
                10,
                22,
                16,
                22,
                21,
                18,
                22,
                14,
                17,
                17,
                12,
                16,
                9,
                12,
                9,
                7,
                12,
                3,
                17,
                2,
            },
        },
        [ICONS.Package] = {
            {
                12,
                2,
                22,
                7,
                22,
                17,
                12,
                23,
                2,
                17,
                2,
                7,
                12,
                2,
            },
            {
                2,
                7,
                12,
                12,
                22,
                7,
            },
            {
                12,
                12,
                12,
                23,
            },
            {
                7,
                5,
                17,
                10,
            },
        },
        [ICONS.Minus] = {
            {
                4,
                12,
                20,
                12,
            },
        },
        [ICONS.Square] = {
            {
                4,
                4,
                20,
                4,
                20,
                20,
                4,
                20,
                4,
                4,
            },
        },
        [ICONS.Close] = {
            {
                4,
                4,
                20,
                20,
            },
            {
                20,
                4,
                4,
                20,
            },
        },
        [ICONS.ChevronRight] = {
            {
                9,
                6,
                15,
                12,
                9,
                18,
            },
        },
        [ICONS.ChevronLeft] = {
            {
                15,
                6,
                9,
                12,
                15,
                18,
            },
        },
    }

    local functionIcons = {
        Respawn = {
            {
                19,
                7,
                15,
                3,
                8,
                3,
                3,
                8,
                3,
                15,
                8,
                20,
                15,
                20,
                20,
                15,
            },
            {
                19,
                2,
                19,
                7,
                14,
                7,
            },
            {
                12,
                8,
                12,
                16,
            },
            {
                8,
                12,
                16,
                12,
            },
        },
        Return = {
            {
                3,
                8,
                17,
                8,
                21,
                12,
                21,
                17,
                17,
                21,
                11,
                21,
            },
            {
                7,
                3,
                2,
                8,
                7,
                13,
            },
            {
                12,
                12,
                12,
                16,
                16,
                16,
            },
        },
        Criminal = {
            {
                3,
                7,
                12,
                10,
                21,
                7,
                20,
                15,
                16,
                19,
                12,
                17,
                8,
                19,
                4,
                15,
                3,
                7,
            },
            {
                6,
                11,
                9,
                12,
                6,
                13,
            },
            {
                18,
                11,
                15,
                12,
                18,
                13,
            },
        },
        Ghost = {
            {
                5,
                21,
                5,
                8,
                7,
                4,
                12,
                2,
                17,
                4,
                19,
                8,
                19,
                21,
                15,
                18,
                12,
                21,
                9,
                18,
                5,
                21,
            },
            {
                9,
                8,
                9,
                11,
            },
            {
                15,
                8,
                15,
                11,
            },
        },
        Noclip = {
            {
                14,
                2,
                21,
                2,
                21,
                22,
                14,
                22,
            },
            {
                14,
                3,
                14,
                7,
            },
            {
                14,
                17,
                14,
                21,
            },
            {
                2,
                12,
                18,
                12,
            },
            {
                10,
                6,
                16,
                12,
                10,
                18,
            },
        },
        Boost = {
            {
                3,
                17,
                8,
                12,
                13,
                17,
            },
            {
                3,
                10,
                8,
                5,
                13,
                10,
            },
            {
                17,
                20,
                17,
                4,
            },
            {
                14,
                7,
                17,
                4,
                20,
                7,
            },
        },
        Momentum = {
            {
                2,
                7,
                10,
                7,
            },
            {
                2,
                12,
                7,
                12,
            },
            {
                2,
                17,
                10,
                17,
            },
            {
                12,
                5,
                20,
                12,
                12,
                19,
            },
            {
                8,
                12,
                20,
                12,
            },
        },
        Bhop = {
            {
                2,
                20,
                5,
                10,
                8,
                6,
                11,
                10,
                14,
                20,
                17,
                10,
                20,
                6,
                22,
                10,
            },
            {
                2,
                22,
                22,
                22,
            },
        },
        Sprint = {
            {
                14,
                3,
                17,
                3,
                17,
                6,
                14,
                6,
                14,
                3,
            },
            {
                13,
                8,
                9,
                13,
                14,
                16,
                11,
                22,
            },
            {
                12,
                9,
                18,
                12,
                22,
                10,
            },
            {
                9,
                13,
                5,
                12,
            },
            {
                9,
                17,
                5,
                21,
            },
            {
                2,
                5,
                9,
                5,
            },
            {
                1,
                8,
                6,
                8,
            },
        },
        AntiJump = {
            {
                5,
                17,
                12,
                10,
                19,
                17,
            },
            {
                12,
                10,
                12,
                22,
            },
            {
                3,
                3,
                21,
                3,
            },
            {
                4,
                6,
                20,
                6,
            },
        },
        InfJump = {
            {
                2,
                9,
                5,
                6,
                9,
                6,
                15,
                12,
                19,
                12,
                22,
                9,
                19,
                6,
                15,
                6,
                9,
                12,
                5,
                12,
                2,
                9,
            },
            {
                12,
                22,
                12,
                15,
            },
            {
                8,
                19,
                12,
                15,
                16,
                19,
            },
        },
        Hitbox = {
            {
                3,
                3,
                8,
                3,
            },
            {
                3,
                3,
                3,
                8,
            },
            {
                16,
                3,
                21,
                3,
                21,
                8,
            },
            {
                3,
                16,
                3,
                21,
                8,
                21,
            },
            {
                16,
                21,
                21,
                21,
                21,
                16,
            },
            {
                7,
                7,
                17,
                7,
                17,
                17,
                7,
                17,
                7,
                7,
            },
        },
        Reveal = {
            {
                2,
                12,
                6,
                7,
                12,
                5,
                18,
                7,
                22,
                12,
                18,
                17,
                12,
                19,
                6,
                17,
                2,
                12,
            },
            {
                12,
                8,
                16,
                12,
                12,
                16,
                8,
                12,
                12,
                8,
            },
            {
                12,
                1,
                12,
                3,
            },
            {
                3,
                3,
                5,
                5,
            },
            {
                21,
                3,
                19,
                5,
            },
        },
        Taser = {
            {
                12,
                2,
                20,
                5,
                20,
                13,
                17,
                19,
                12,
                22,
                7,
                19,
                4,
                13,
                4,
                5,
                12,
                2,
            },
            {
                13,
                6,
                8,
                13,
                13,
                13,
                11,
                18,
                17,
                10,
                12,
                10,
            },
        },
        Anchor = {
            {
                12,
                3,
                15,
                6,
                12,
                9,
                9,
                6,
                12,
                3,
            },
            {
                12,
                9,
                12,
                21,
            },
            {
                7,
                11,
                17,
                11,
            },
            {
                3,
                14,
                4,
                18,
                8,
                21,
                16,
                21,
                20,
                18,
                21,
                14,
            },
            {
                3,
                14,
                3,
                18,
            },
            {
                21,
                14,
                21,
                18,
            },
        },
        Weapon = {
            {
                2,
                6,
                21,
                6,
                21,
                11,
                13,
                11,
                11,
                14,
                8,
                14,
                7,
                21,
                3,
                21,
                5,
                11,
                2,
                11,
                2,
                6,
            },
            {
                10,
                11,
                10,
                14,
            },
            {
                17,
                3,
                20,
                3,
            },
            {
                8,
                8,
                18,
                8,
            },
        },
        Map = {
            {
                2,
                5,
                8,
                2,
                16,
                5,
                22,
                2,
                22,
                19,
                16,
                22,
                8,
                19,
                2,
                22,
                2,
                5,
            },
            {
                8,
                3,
                8,
                18,
            },
            {
                16,
                6,
                16,
                21,
            },
        },
        Spin = {
            {
                5,
                8,
                8,
                3,
                16,
                3,
                20,
                8,
            },
            {
                20,
                3,
                20,
                8,
                15,
                8,
            },
            {
                19,
                16,
                16,
                21,
                8,
                21,
                4,
                16,
            },
            {
                4,
                21,
                4,
                16,
                9,
                16,
            },
            {
                12,
                9,
                15,
                12,
                12,
                15,
                9,
                12,
                12,
                9,
            },
        },
        Hunt = {
            {
                2,
                8,
                2,
                3,
                7,
                3,
            },
            {
                17,
                3,
                22,
                3,
                22,
                8,
            },
            {
                2,
                16,
                2,
                21,
                7,
                21,
            },
            {
                17,
                21,
                22,
                21,
                22,
                16,
            },
            {
                12,
                6,
                15,
                9,
                12,
                12,
                9,
                9,
                12,
                6,
            },
            {
                7,
                18,
                8,
                15,
                16,
                15,
                17,
                18,
            },
        },
        WeaponStyle = {
            {
                3,
                6,
                20,
                6,
                20,
                11,
                12,
                11,
                10,
                15,
                7,
                15,
                6,
                21,
                2,
                21,
                4,
                11,
            },
            {
                17,
                14,
                22,
                19,
                19,
                22,
                14,
                17,
                17,
                14,
            },
            {
                19,
                16,
                16,
                19,
            },
        },
    }
    for name, paths in pairs(functionIcons) do
        ICONS[name] = "local:" .. name
        ICON_PATHS[ICONS[name]] = paths
    end

    local function arc(cx, cy, radius, first, last)
        local points = {}
        local steps = math.ceil(math.abs(last - first) / 8)
        for i = 0, steps do
            local angle = math.rad(first + (last - first) * i / steps)
            table.insert(points, cx + math.cos(angle) * radius)
            table.insert(points, cy + math.sin(angle) * radius)
        end
        return points
    end
    ICON_PATHS[ICONS.Respawn] = {
        arc(12, 12, 8, 35, 310),
        { 17, 2, 17, 6, 21, 6 },
        { 12, 8, 12, 16 },
        { 8, 12, 16, 12 },
    }
    ICON_PATHS[ICONS.Return] = {
        { 8, 4, 3, 9, 8, 14 },
        { 3, 9, 14, 9 },
        arc(14, 14, 5, -90, 90),
        { 14, 19, 9, 19 },
    }
    ICON_PATHS[ICONS.Criminal] = {
        {
            3,
            7,
            6,
            8,
            9,
            9,
            12,
            10,
            15,
            9,
            18,
            8,
            21,
            7,
            20.5,
            11,
            20,
            14,
            18,
            17,
            16,
            18,
            12,
            16,
            8,
            18,
            6,
            17,
            4,
            14,
            3.5,
            11,
            3,
            7,
        },
        { 6, 11, 9, 12, 7, 13 },
        { 18, 11, 15, 12, 17, 13 },
    }

    ICONS.Skull = "local:skull"
    ICON_PATHS[ICONS.Skull] = {
        { 6, 17, 3, 14, 3, 8, 5, 4, 9, 2, 15, 2, 19, 4, 21, 8, 21, 14, 18, 17, 17, 22, 7, 22, 6, 17 },
        { 7, 9, 10, 9, 10, 12, 7, 12, 7, 9 },
        { 14, 9, 17, 9, 17, 12, 14, 12, 14, 9 },
        { 12, 13, 10, 16, 14, 16, 12, 13 },
        { 10, 19, 10, 22 },
        { 14, 19, 14, 22 },
    }
    local pin = arc(12, 9, 7, 145, 395)
    table.insert(pin, 12)
    table.insert(pin, 22)
    table.insert(pin, pin[1])
    table.insert(pin, pin[2])
    ICON_PATHS[ICONS.Pin] = {
        pin,
        arc(12, 9, 2.4, 0, 360),
    }
    local crescent = arc(12, 12, 9, 270, 0)
    for i = 1, 24 do
        local t = i / 24
        local u = 1 - t
        table.insert(crescent, u * u * 21 + 2 * u * t * 7 + t * t * 12)
        table.insert(crescent, u * u * 12 + 2 * u * t * 17 + t * t * 3)
    end
    table.insert(crescent, 12)
    table.insert(crescent, 3)
    ICON_PATHS[ICONS.Moon] = {
        crescent,
    }

    local ICON_FILLS = {
        [ICONS.Home] = {
            {
                2,
                11,
                12,
                2,
                22,
                11,
                19,
                11,
                19,
                22,
                14,
                22,
                14,
                15,
                10,
                15,
                10,
                22,
                5,
                22,
                5,
                11,
            },
        },
        [ICONS.User] = {
            {
                3,
                22,
                3,
                19,
                5,
                15,
                9,
                13,
                15,
                13,
                19,
                15,
                21,
                19,
                21,
                22,
            },
        },
        [ICONS.Diamond] = {
            {
                12,
                0,
                15,
                9,
                24,
                12,
                15,
                15,
                12,
                24,
                9,
                15,
                0,
                12,
                9,
                9,
            },
        },
        [ICONS.Electricity] = {
            {
                11,
                1,
                4,
                14,
                11,
                14,
                8,
                24,
                21,
                9,
                13,
                9,
                17,
                1,
            },
        },
        [ICONS.Shield] = {
            {
                12,
                2,
                12,
                22,
                7,
                19,
                4,
                14,
                3,
                6,
            },
        },
        [ICONS.Package] = {
            {
                3,
                8,
                11,
                12,
                11,
                22,
                3,
                17,
            },
            {
                13,
                12,
                21,
                8,
                21,
                17,
                13,
                22,
            },
            {
                3,
                6,
                12,
                2,
                21,
                6,
                12,
                10,
            },
        },
    }

    local function createVectorIcon(parent, iconId, size, color, pos, anchor)
        local img = Instance.new("ImageLabel")
        img.Size = size or UDim2.new(0, 18, 0, 18)
        if pos then
            img.Position = pos
        end
        if anchor then
            img.AnchorPoint = anchor
        end
        img.BackgroundTransparency = 1
        img.Image = ""
        img.ImageColor3 = color or THEME.TextMuted
        img.ZIndex = (parent.ZIndex or 1) + 1
        img.Parent = parent
        local parts = {}
        local strokeWidth = 1.65
        local joints = {}
        local function joint(x, y)
            local key = string.format("%.3f:%.3f", x, y)
            if joints[key] then
                return
            end
            joints[key] = true
            local dot = Instance.new("Frame")
            dot.AnchorPoint = Vector2.new(0.5, 0.5)
            dot.Position = UDim2.fromScale(x / 24, y / 24)
            dot.Size = UDim2.fromScale(strokeWidth / 24, strokeWidth / 24)
            dot.BackgroundColor3 = img.ImageColor3
            dot.BorderSizePixel = 0
            dot.ZIndex = img.ZIndex
            dot.Parent = img
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0.5, 0)
            corner.Parent = dot
            table.insert(parts, dot)
        end
        local function segment(x1, y1, x2, y2)
            local part = Instance.new("Frame")
            part.AnchorPoint = Vector2.new(0.5, 0.5)
            part.Position = UDim2.fromScale((x1 + x2) / 48, (y1 + y2) / 48)
            part.Size = UDim2.fromScale(math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2) / 24, strokeWidth / 24)
            part.Rotation = math.deg(math.atan2(y2 - y1, x2 - x1))
            part.BorderSizePixel = 0
            part.BackgroundColor3 = img.ImageColor3
            part.ZIndex = img.ZIndex
            part.Parent = img
            table.insert(parts, part)
            joint(x1, y1)
            joint(x2, y2)
        end
        local function ring(cx, cy, radius)
            for i = 0, 47 do
                local a, b = i * math.pi / 24, (i + 1) * math.pi / 24
                segment(
                    cx + math.cos(a) * radius,
                    cy + math.sin(a) * radius,
                    cx + math.cos(b) * radius,
                    cy + math.sin(b) * radius
                )
            end
        end
        for _, polygon in ipairs(ICON_FILLS[iconId] or {}) do
            for y = 0, 47 do
                local scan, intersections = (y + 0.5) / 2, {}
                for i = 1, #polygon, 2 do
                    local j = (i + 1) % #polygon + 1
                    local x1, y1, x2, y2 = polygon[i], polygon[i + 1], polygon[j], polygon[j + 1]
                    if (y1 <= scan and y2 > scan) or (y2 <= scan and y1 > scan) then
                        table.insert(intersections, x1 + (scan - y1) * (x2 - x1) / (y2 - y1))
                    end
                end
                table.sort(intersections)
                for i = 1, #intersections - 1, 2 do
                    local part = Instance.new("Frame")
                    part.BorderSizePixel = 0
                    part.Position = UDim2.fromScale(intersections[i] / 24, y / 48)

                    part.Size = UDim2.new((intersections[i + 1] - intersections[i]) / 24, 0, 0, 1.5)
                    part.BackgroundColor3 = img.ImageColor3
                    part.ZIndex = img.ZIndex
                    part.Parent = img
                    table.insert(parts, part)
                end
            end
        end
        local paths = ICON_PATHS[iconId] or {}
        if iconId == ICONS.Settings then
            paths = {}
            local gear = {}
            for i = 0, 63 do
                local angle = i * math.pi / 32
                local phase = i % 8
                local radius = (phase >= 2 and phase <= 5) and 9.5 or 7.5
                table.insert(gear, 12 + math.cos(angle) * radius)
                table.insert(gear, 12 + math.sin(angle) * radius)
            end
            table.insert(gear, gear[1])
            table.insert(gear, gear[2])
            paths = {
                gear,
            }
        end
        if
            iconId == ICONS.Home
            or iconId == ICONS.Diamond
            or iconId == ICONS.Electricity
            or iconId == ICONS.Package
        then
            paths = {}
        end
        for _, path in ipairs(paths) do
            for i = 1, #path - 2, 2 do
                segment(path[i], path[i + 1], path[i + 2], path[i + 3])
            end
        end
        if iconId == ICONS.User then
            ring(12, 7, 4)
        elseif iconId == ICONS.Eye then
            ring(12, 12, 3)
        elseif iconId == ICONS.Target then
            ring(12, 12, 7)
        elseif iconId == ICONS.Settings then
            ring(12, 12, 4)
        elseif iconId == ICONS.Speed then
            ring(16, 3, 2)
        end
        img:GetPropertyChangedSignal("ImageColor3"):Connect(function()
            for _, part in ipairs(parts) do
                if part.Parent then
                    part.BackgroundColor3 = img.ImageColor3
                end
            end
        end)
        return img
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NightFall_" .. tostring(math.random(100000, 999999))
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.Destroying:Connect(function()
        for _, connection in ipairs(connections) do
            connection:Disconnect()
        end
    end)

    if getgenv then
        getgenv().NightFallGUI = ScreenGui
    end

    pcall(function()
        ScreenGui.Parent = gethui()
    end)
    if not ScreenGui.Parent then
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end

    local NotificationContainer = Instance.new("Frame")
    NotificationContainer.Name = "NotificationContainer"
    NotificationContainer.Size = UDim2.new(0, 360, 1, -40)
    NotificationContainer.Position = UDim2.new(1, -24, 1, -24)
    NotificationContainer.AnchorPoint = Vector2.new(1, 1)
    NotificationContainer.BackgroundTransparency = 1
    NotificationContainer.ClipsDescendants = false
    NotificationContainer.ZIndex = 500
    NotificationContainer.Parent = ScreenGui

    local NotifLayout = Instance.new("UIListLayout")
    NotifLayout.SortOrder = Enum.SortOrder.LayoutOrder
    NotifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    NotifLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    NotifLayout.Padding = UDim.new(0, 8)
    NotifLayout.Parent = NotificationContainer

    local OuterBloom = Instance.new("ImageLabel")
    OuterBloom.Name = "OuterBloom"
    OuterBloom.AnchorPoint = Vector2.new(0.5, 0.5)
    OuterBloom.Position = UDim2.new(0.5, 0, 0.5, 0)
    OuterBloom.Size = UDim2.new(0, 1010, 0, 590)
    OuterBloom.BackgroundTransparency = 1
    OuterBloom.Image = ICONS.Shadow
    OuterBloom.ScaleType = Enum.ScaleType.Slice
    OuterBloom.SliceCenter = Rect.new(10, 10, 118, 118)
    OuterBloom.ImageColor3 = THEME.AccentGlow
    OuterBloom.ImageTransparency = 0.68
    OuterBloom.ZIndex = 1
    OuterBloom.Parent = ScreenGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 1200, 0, 630)
    MainFrame.Position = UDim2.new(0.5, -600, 0.5, -315)
    MainFrame.BackgroundColor3 = THEME.BgMain
    MainFrame.BorderSizePixel = 0
    MainFrame.ZIndex = 5
    MainFrame.ClipsDescendants = false
    MainFrame.Parent = ScreenGui

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 16)
    MainCorner.Parent = MainFrame

    do
        local layers = {}
        for i = 1, 10 do
            local shadow = Instance.new("Frame")
            shadow.Name = "CharcoalEdge" .. i
            shadow.BackgroundColor3 = Color3.fromRGB(2, 2, 5)
            shadow.BackgroundTransparency = 0.88 + i * 0.008
            shadow.BorderSizePixel = 0
            shadow.ZIndex = 2
            shadow.Parent = ScreenGui
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 16 + i * 2)
            corner.Parent = shadow
            layers[i] = shadow
        end
        local function updateEdges()
            for i, shadow in ipairs(layers) do
                local spread = i * 2
                shadow.Parent = MainFrame.Parent
                shadow.Position = MainFrame.Position + UDim2.fromOffset(-spread, -spread + 3)
                shadow.Size = MainFrame.Size + UDim2.fromOffset(spread * 2, spread * 2)
                shadow.Visible = MainFrame.Visible
            end
        end
        for _, property in ipairs({
            "Position",
            "Size",
            "Visible",
            "Parent",
        }) do
            MainFrame:GetPropertyChangedSignal(property):Connect(updateEdges)
        end
        ScreenGui.Destroying:Connect(function()
            for _, shadow in ipairs(layers) do
                shadow:Destroy()
            end
        end)
        updateEdges()
    end

    local MainStroke = Instance.new("UIStroke")
    MainStroke.Thickness = 1
    MainStroke.Color = Color3.fromRGB(110, 65, 155)
    MainStroke.Transparency = 0.25
    MainStroke.Parent = MainFrame

    local MainGrad = Instance.new("UIGradient")
    MainGrad.Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(190, 180, 210))
    MainGrad.Rotation = 40
    MainGrad.Parent = MainFrame

    local function syncBloom()
        OuterBloom.Position = UDim2.new(
            MainFrame.Position.X.Scale,
            MainFrame.Position.X.Offset + (MainFrame.Size.X.Offset / 2),
            MainFrame.Position.Y.Scale,
            MainFrame.Position.Y.Offset + (MainFrame.Size.Y.Offset / 2)
        )
        OuterBloom.Size = UDim2.new(0, MainFrame.Size.X.Offset + 32, 0, MainFrame.Size.Y.Offset + 32)
    end
    MainFrame:GetPropertyChangedSignal("Position"):Connect(syncBloom)
    MainFrame:GetPropertyChangedSignal("Size"):Connect(syncBloom)
    syncBloom()

    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 144)
    TitleBar.BackgroundTransparency = 1
    TitleBar.ZIndex = 6
    TitleBar.Parent = MainFrame

    local HeaderGlow = Instance.new("Frame")
    HeaderGlow.Size = UDim2.new(0, 360, 1, 0)
    HeaderGlow.Position = UDim2.new(0, 0, 0, 0)
    HeaderGlow.BackgroundColor3 = Color3.fromRGB(35, 18, 55)
    HeaderGlow.BackgroundTransparency = 0.82
    HeaderGlow.BorderSizePixel = 0
    HeaderGlow.ZIndex = 6
    HeaderGlow.Parent = TitleBar

    local HeaderGlowFade = Instance.new("UIGradient")
    HeaderGlowFade.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.4),
        NumberSequenceKeypoint.new(0.8, 0.9),
        NumberSequenceKeypoint.new(1, 1),
    })
    HeaderGlowFade.Parent = HeaderGlow

    local HeaderDivider = Instance.new("Frame")
    HeaderDivider.Size = UDim2.new(1, 0, 0, 1)
    HeaderDivider.Position = UDim2.new(0, 0, 1, -1)
    HeaderDivider.BackgroundColor3 = THEME.Border
    HeaderDivider.BackgroundTransparency = 0.45
    HeaderDivider.BorderSizePixel = 0
    HeaderDivider.ZIndex = 6
    HeaderDivider.Parent = TitleBar

    local LogoBox = Instance.new("Frame")
    LogoBox.Name = "LogoBox"
    LogoBox.Size = UDim2.new(0, 130, 0, 126)
    LogoBox.Position = UDim2.new(0, 32, 0, 8)
    LogoBox.BackgroundTransparency = 1
    LogoBox.ZIndex = 6
    LogoBox.Parent = TitleBar

    local MoonAura = Instance.new("ImageLabel")
    MoonAura.AnchorPoint = Vector2.new(0.5, 0.5)
    MoonAura.Position = UDim2.new(0.5, 0, 0.5, 0)
    MoonAura.Size = UDim2.new(1.6, 0, 1.6, 0)
    MoonAura.BackgroundTransparency = 1
    MoonAura.Image = ICONS.Glow
    MoonAura.ImageColor3 = THEME.AccentPurp
    MoonAura.ImageTransparency = 0.35
    MoonAura.ZIndex = 6
    MoonAura.Parent = LogoBox

    createVectorIcon(
        LogoBox,
        ICONS.Moon,
        UDim2.new(0, 124, 0, 124),
        THEME.PrimaryPurp,
        UDim2.new(0.5, 0, 0.5, 0),
        Vector2.new(0.5, 0.5)
    )

    local CrestN = Instance.new("TextLabel")
    CrestN.Size = UDim2.new(1, 0, 1, 0)
    CrestN.Position = UDim2.new(0, 2, 0, -1)
    CrestN.BackgroundTransparency = 1
    CrestN.Text = "N"
    CrestN.Font = Enum.Font.Bodoni
    CrestN.TextSize = 100
    CrestN.TextColor3 = THEME.PrimaryPurp
    CrestN.TextXAlignment = Enum.TextXAlignment.Center
    CrestN.TextYAlignment = Enum.TextYAlignment.Center
    CrestN.ZIndex = 8
    CrestN.Parent = LogoBox

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Position = UDim2.new(0, 200, 0, 16)
    TitleLabel.Size = UDim2.new(0, 440, 0, 88)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "NightFall"
    TitleLabel.Font = Enum.Font.Bodoni
    TitleLabel.TextSize = 76
    TitleLabel.TextColor3 = THEME.TextPrimary
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.ZIndex = 7
    TitleLabel.Parent = TitleBar

    local TitleGrad = Instance.new("UIGradient")
    TitleGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(171, 112, 224)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 49, 159)),
    })
    TitleGrad.Rotation = 90
    TitleGrad.Parent = TitleLabel

    local SubtitleLabel = Instance.new("TextLabel")
    SubtitleLabel.Name = "SubtitleLabel"
    SubtitleLabel.Position = UDim2.new(0, 206, 0, 104)
    SubtitleLabel.Size = UDim2.new(0, 470, 0, 20)
    SubtitleLabel.BackgroundTransparency = 1
    SubtitleLabel.Text = "D A R K N E S S  I S  T H E  I N T E R F A C E ."
    SubtitleLabel.Font = Enum.Font.Code
    SubtitleLabel.TextSize = 13
    SubtitleLabel.TextColor3 = THEME.TextMuted
    SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    SubtitleLabel.ZIndex = 7
    SubtitleLabel.Parent = TitleBar

    local StatusBadge = Instance.new("Frame")
    StatusBadge.Name = "StatusBadge"
    StatusBadge.Size = UDim2.new(0, 260, 0, 54)
    StatusBadge.Position = UDim2.new(1, -280, 0, 72)
    StatusBadge.BackgroundColor3 = THEME.BgPanel
    StatusBadge.BackgroundTransparency = 1
    StatusBadge.ZIndex = 6
    StatusBadge.Parent = TitleBar

    local StatusCorner = Instance.new("UICorner")
    StatusCorner.CornerRadius = UDim.new(0, 10)
    StatusCorner.Parent = StatusBadge

    local StatusStroke = Instance.new("UIStroke")
    StatusStroke.Thickness = 1
    StatusStroke.Color = THEME.Border
    StatusStroke.Transparency = 1
    StatusStroke.Parent = StatusBadge

    createVectorIcon(
        StatusBadge,
        ICONS.Package,
        UDim2.new(0, 18, 0, 18),
        THEME.TextMuted,
        UDim2.new(0, 10, 0.5, -9)
    )

    local GameTitle = Instance.new("TextLabel")
    GameTitle.Size = UDim2.new(0, 85, 0, 16)
    GameTitle.Position = UDim2.new(0, 34, 0, 4)
    GameTitle.BackgroundTransparency = 1
    GameTitle.Text = "Prison Life"
    GameTitle.Font = Enum.Font.GothamBold
    GameTitle.TextSize = 12
    GameTitle.TextColor3 = THEME.TextPrimary
    GameTitle.TextXAlignment = Enum.TextXAlignment.Left
    GameTitle.ZIndex = 7
    GameTitle.Parent = StatusBadge

    local GameVer = Instance.new("TextLabel")
    GameVer.Size = UDim2.new(0, 85, 0, 14)
    GameVer.Position = UDim2.new(0, 34, 0, 20)
    GameVer.BackgroundTransparency = 1
    GameVer.Text = "v1.0.0"
    GameVer.Font = Enum.Font.Code
    GameVer.TextSize = 10
    GameVer.TextColor3 = THEME.TextMuted
    GameVer.TextXAlignment = Enum.TextXAlignment.Left
    GameVer.ZIndex = 7
    GameVer.Parent = StatusBadge

    local StatusDiv = Instance.new("Frame")
    StatusDiv.Size = UDim2.new(0, 1, 0, 20)
    StatusDiv.Position = UDim2.new(0, 122, 0.5, -10)
    StatusDiv.BackgroundColor3 = THEME.Border
    StatusDiv.BorderSizePixel = 0
    StatusDiv.ZIndex = 7
    StatusDiv.Parent = StatusBadge

    local StatusDot = Instance.new("Frame")
    StatusDot.Size = UDim2.new(0, 6, 0, 6)
    StatusDot.Position = UDim2.new(0, 134, 0.5, -3)
    StatusDot.BackgroundColor3 = THEME.SuccessGreen
    StatusDot.BorderSizePixel = 0
    StatusDot.ZIndex = 7
    StatusDot.Parent = StatusBadge

    local DotCorner = Instance.new("UICorner")
    DotCorner.CornerRadius = UDim.new(1, 0)
    DotCorner.Parent = StatusDot

    local StatusText = Instance.new("TextLabel")
    StatusText.Size = UDim2.new(0, 50, 0, 16)
    StatusText.Position = UDim2.new(0, 146, 0.5, -8)
    StatusText.BackgroundTransparency = 1
    StatusText.Text = "Online"
    StatusText.Font = Enum.Font.GothamBold
    StatusText.TextSize = 11
    StatusText.TextColor3 = THEME.SuccessGreen
    StatusText.TextXAlignment = Enum.TextXAlignment.Left
    StatusText.ZIndex = 7
    StatusText.Parent = StatusBadge

    local ControlsBox = Instance.new("Frame")
    ControlsBox.Name = "ControlsBox"
    ControlsBox.Size = UDim2.new(0, 92, 0, 38)
    ControlsBox.Position = UDim2.new(1, -152, 0, 8)
    ControlsBox.Size = UDim2.new(0, 138, 0, 38)
    ControlsBox.BackgroundTransparency = 1
    ControlsBox.ZIndex = 6
    ControlsBox.Parent = TitleBar

    local function createWinBtn(name, iconId, xOffset, onClick)
        local btn = Instance.new("ImageButton")
        btn.Name = name
        btn.Image = ""
        btn.Size = UDim2.new(0, 26, 0, 26)
        btn.Position = UDim2.new(0, xOffset * 1.5, 0.5, -13)
        btn.BackgroundColor3 = THEME.BgPanel
        btn.BackgroundTransparency = 1
        btn.AutoButtonColor = false
        btn.ZIndex = 7
        btn.Parent = ControlsBox

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 6)
        btnCorner.Parent = btn

        local icon = createVectorIcon(
            btn,
            iconId,
            UDim2.new(0, 20, 0, 20),
            THEME.AccentPurp,
            UDim2.new(0.5, 0, 0.5, 0),
            Vector2.new(0.5, 0.5)
        )
        icon.ZIndex = 8

        icon:ClearAllChildren()
        local bars = {}
        local function bar(x, y, w, h, rotation)
            local part = Instance.new("Frame")
            part.BorderSizePixel = 0
            part.Position = UDim2.fromOffset(x, y)
            part.Size = UDim2.fromOffset(w, h)
            part.Rotation = rotation or 0
            part.BackgroundColor3 = THEME.AccentPurp
            part.ZIndex = 8
            part.Parent = icon
            table.insert(bars, part)
        end
        if name == "MinBtn" then
            bar(2, 10, 16, 2)
        elseif name == "MaxBtn" then
            bar(3, 3, 14, 2)
            bar(3, 15, 14, 2)
            bar(3, 5, 2, 10)
            bar(15, 5, 2, 10)
        else
            bar(0, 9, 20, 2, 45)
            bar(0, 9, 20, 2, -45)
        end
        icon:GetPropertyChangedSignal("ImageColor3"):Connect(function()
            for _, part in ipairs(bars) do
                part.BackgroundColor3 = icon.ImageColor3
            end
        end)

        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.15), {
                BackgroundTransparency = 1,
            }):Play()
            TweenService:Create(icon, TweenInfo.new(0.15), {
                ImageColor3 = THEME.TextPrimary,
            }):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.15), {
                BackgroundTransparency = 1,
            }):Play()
            TweenService:Create(icon, TweenInfo.new(0.15), {
                ImageColor3 = THEME.AccentPurp,
            }):Play()
        end)

        if onClick then
            btn.MouseButton1Click:Connect(onClick)
        end
        return btn
    end

    local isMinimized = false
    local minimizeWindow
    createWinBtn("MinBtn", ICONS.Minus, 0, function()
        if minimizeWindow then
            minimizeWindow()
        end
    end)

    local fitWindow
    local expanded = false
    createWinBtn("MaxBtn", ICONS.Square, 32, function()
        expanded = not expanded
        if fitWindow then
            fitWindow()
        end
    end)

    createWinBtn("CloseBtn", ICONS.Close, 64, function()
        ScreenGui:Destroy()
    end)

    local dragging = false
    local dragInput, dragStart, startPos

    TitleBar.InputBegan:Connect(function(input)
        if
            input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch
        then
            dragging = true
            dragStart = input.Position
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local mouse = UserInputService:GetMouseLocation()
                dragStart = Vector3.new(mouse.X, mouse.Y, 0)
            end
            startPos = MainFrame.Parent.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    TitleBar.InputChanged:Connect(function(input)
        if
            input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch
        then
            dragInput = input
        end
    end)

    local changelogsDivider = nil
    local isChangelogsCollapsed = false
    local toggleChangelogs = nil

    local Body = Instance.new("Frame")
    Body.Name = "Body"
    Body.Size = UDim2.new(1, -32, 1, -172)
    Body.Position = UDim2.new(0, 16, 0, 156)
    Body.BackgroundTransparency = 1
    Body.ZIndex = 6
    Body.Parent = MainFrame

    local Sidebar = Instance.new("Frame")
    Sidebar.Name = "Sidebar"
    Sidebar.Size = UDim2.new(0, 190, 1, 0)
    Sidebar.BackgroundTransparency = 1
    Sidebar.ZIndex = 6
    Sidebar.Parent = Body

    local NavContainer = Instance.new("ScrollingFrame")
    NavContainer.CanvasSize = UDim2.new()
    NavContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
    NavContainer.ScrollBarThickness = 2
    NavContainer.BorderSizePixel = 0
    NavContainer.Name = "NavContainer"
    NavContainer.Size = UDim2.new(1, 0, 1, -145)
    NavContainer.BackgroundTransparency = 1
    NavContainer.ZIndex = 6
    NavContainer.Parent = Sidebar

    local SidebarLayout = Instance.new("UIListLayout")
    SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
    SidebarLayout.Padding = UDim.new(0, 8)
    SidebarLayout.Parent = NavContainer

    local ContentArea = Instance.new("Frame")
    ContentArea.Name = "ContentArea"
    ContentArea.Size = UDim2.new(0, 550, 1, 0)
    ContentArea.Position = UDim2.new(0, 214, 0, 0)
    ContentArea.BackgroundTransparency = 1
    ContentArea.ZIndex = 6
    ContentArea.Parent = Body

    local ConsoleFrame = Instance.new("Frame")
    ConsoleFrame.Name = "ConsoleFrame"
    ConsoleFrame.Size = UDim2.new(0, 390, 1, -36)
    ConsoleFrame.Position = UDim2.new(1, -390, 0, 0)
    ConsoleFrame.BackgroundColor3 = THEME.BgPanel
    ConsoleFrame.BackgroundTransparency = 0.45
    ConsoleFrame.ZIndex = 6
    ConsoleFrame.Parent = Body

    local ConsoleCorner = Instance.new("UICorner")
    ConsoleCorner.CornerRadius = UDim.new(0, 12)
    ConsoleCorner.Parent = ConsoleFrame

    local ConsoleStroke = Instance.new("UIStroke")
    ConsoleStroke.Thickness = 1
    ConsoleStroke.Color = THEME.Border
    ConsoleStroke.Transparency = 0.35
    ConsoleStroke.Parent = ConsoleFrame

    local ConsoleHeader = Instance.new("Frame")
    ConsoleHeader.Size = UDim2.new(1, 0, 0, 38)
    ConsoleHeader.BackgroundTransparency = 1
    ConsoleHeader.ZIndex = 7
    ConsoleHeader.Parent = ConsoleFrame

    local ConsoleIcon = Instance.new("TextLabel")
    ConsoleIcon.Size = UDim2.new(0, 20, 1, 0)
    ConsoleIcon.Position = UDim2.new(0, 12, 0, 0)
    ConsoleIcon.BackgroundTransparency = 1
    ConsoleIcon.Text = ">_"
    ConsoleIcon.Font = Enum.Font.Code
    ConsoleIcon.TextSize = 13
    ConsoleIcon.TextColor3 = THEME.AccentPurp
    ConsoleIcon.TextXAlignment = Enum.TextXAlignment.Left
    ConsoleIcon.ZIndex = 7
    ConsoleIcon.Parent = ConsoleHeader

    local ConsoleTitle = Instance.new("TextLabel")
    ConsoleTitle.Size = UDim2.new(0, 100, 1, 0)
    ConsoleTitle.Position = UDim2.new(0, 36, 0, 0)
    ConsoleTitle.BackgroundTransparency = 1
    ConsoleTitle.Text = "Console"
    ConsoleTitle.Font = Enum.Font.GothamBold
    ConsoleTitle.TextSize = 13
    ConsoleTitle.TextColor3 = THEME.TextPrimary
    ConsoleTitle.TextXAlignment = Enum.TextXAlignment.Left
    ConsoleTitle.ZIndex = 7
    ConsoleTitle.Parent = ConsoleHeader

    local TrashBtn = Instance.new("ImageButton")
    TrashBtn.Size = UDim2.new(0, 22, 0, 22)
    TrashBtn.Position = UDim2.new(1, -32, 0.5, -11)
    TrashBtn.BackgroundTransparency = 1
    TrashBtn.Image = ""
    TrashBtn.ImageColor3 = THEME.TextMuted
    TrashBtn.ZIndex = 7
    TrashBtn.Parent = ConsoleHeader
    createVectorIcon(TrashBtn, ICONS.Trash, UDim2.fromScale(1, 1), THEME.TextMuted)

    local ConsoleScroll = Instance.new("ScrollingFrame")
    ConsoleScroll.Size = UDim2.new(1, -20, 1, -85)
    ConsoleScroll.Position = UDim2.new(0, 10, 0, 40)
    ConsoleScroll.BackgroundTransparency = 1
    ConsoleScroll.BorderSizePixel = 0
    ConsoleScroll.ScrollBarThickness = 2
    ConsoleScroll.ScrollBarImageColor3 = THEME.PrimaryPurp
    ConsoleScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    ConsoleScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ConsoleScroll.ZIndex = 7
    ConsoleScroll.Parent = ConsoleFrame

    local ConsoleLayout = Instance.new("UIListLayout")
    ConsoleLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ConsoleLayout.Padding = UDim.new(0, 4)
    ConsoleLayout.Parent = ConsoleScroll

    local function sanitizeRichText(str)
        return str:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
    end

    local logOrder = 0
    local function logConsole(tag, msg, tagColor)
        if tag ~= "UPDATE" then
            return
        end
        logOrder = logOrder + 1
        local line = Instance.new("TextLabel")
        line.Size = UDim2.new(1, -8, 0, 21)
        line.AutomaticSize = Enum.AutomaticSize.Y
        line.TextWrapped = true
        line.BackgroundTransparency = 1
        line.Font = Enum.Font.Code
        line.TextSize = 16
        line.LayoutOrder = logOrder
        line.TextXAlignment = Enum.TextXAlignment.Left
        line.RichText = true
        line.ZIndex = 8

        local colorHex = (tagColor or THEME.SuccessGreen):ToHex()
        local cleanTag = sanitizeRichText(tag)
        local cleanMsg = sanitizeRichText(msg)

        line.Text = string.format(
            '<font color="#%s">[%s]</font> <font color="#E8DDF5">%s</font>',
            colorHex,
            cleanTag,
            cleanMsg
        )
        line.Parent = ConsoleScroll
    end

    TrashBtn.MouseButton1Click:Connect(function()
        for _, child in ipairs(ConsoleScroll:GetChildren()) do
            if child:IsA("TextLabel") then
                child:Destroy()
            end
        end
        logConsole("SYS", "Console cleared", THEME.TextMuted)
    end)

    logConsole("INFO", "NightFall loaded successfully!", THEME.SuccessGreen)
    logConsole("INFO", "Game: Prison Life", THEME.SuccessGreen)
    logConsole("INFO", "Version: 1.0.0", THEME.SuccessGreen)
    logConsole("INFO", "Enjoy your stay. <3 }", THEME.SuccessGreen)

    local PromptRow = Instance.new("Frame")
    PromptRow.Size = UDim2.new(1, -20, 0, 20)
    PromptRow.Position = UDim2.new(0, 10, 1, -42)
    PromptRow.BackgroundTransparency = 1
    PromptRow.ZIndex = 7
    PromptRow.Parent = ConsoleFrame

    local PromptPrefix = Instance.new("TextLabel")
    PromptPrefix.Size = UDim2.new(0, 14, 1, 0)
    PromptPrefix.BackgroundTransparency = 1
    PromptPrefix.Text = ">"
    PromptPrefix.Font = Enum.Font.Code
    PromptPrefix.TextSize = 12
    PromptPrefix.TextColor3 = THEME.TextMuted
    PromptPrefix.ZIndex = 7
    PromptPrefix.Parent = PromptRow

    local PromptInput = Instance.new("TextBox")
    PromptInput.Size = UDim2.new(1, -16, 1, 0)
    PromptInput.Position = UDim2.new(0, 16, 0, 0)
    PromptInput.BackgroundTransparency = 1
    PromptInput.Font = Enum.Font.Code
    PromptInput.PlaceholderText = "_"
    PromptInput.PlaceholderColor3 = THEME.AccentPurp
    PromptInput.Text = ""
    PromptInput.TextColor3 = THEME.TextPrimary
    PromptInput.TextSize = 11
    PromptInput.TextXAlignment = Enum.TextXAlignment.Left
    PromptInput.ClearTextOnFocus = false
    PromptInput.ZIndex = 7
    PromptInput.Parent = PromptRow

    local ConsoleFooter = Instance.new("TextLabel")
    ConsoleFooter.Size = UDim2.new(1, 0, 0, 16)
    ConsoleFooter.Position = UDim2.new(0, 0, 1, 22)
    ConsoleFooter.BackgroundTransparency = 1
    ConsoleFooter.Text = "──────── NightFall // v1.0.0 ────────"
    ConsoleFooter.Font = Enum.Font.Code
    ConsoleFooter.TextSize = 13
    ConsoleFooter.TextColor3 = THEME.TextDark
    ConsoleFooter.TextXAlignment = Enum.TextXAlignment.Center
    ConsoleFooter.ZIndex = 7
    ConsoleFooter.Parent = ConsoleFrame

    local tabs = {}
    local activeTab = nil
    local tabOrder = 0
    local pageTween
    local pageFade
    local navTweens = {}
    local function navTween(object, properties)
        if navTweens[object] then
            navTweens[object]:Cancel()
        end
        local tween = TweenService:Create(object, TweenInfo.new(0.18, Enum.EasingStyle.Quad), properties)
        navTweens[object] = tween
        tween:Play()
    end

    local function createTab(name, iconId)
        tabOrder = tabOrder + 1
        local currentOrder = tabOrder

        local tabBtn = Instance.new("TextButton")
        tabBtn.Name = name .. "TabBtn"
        tabBtn.Size = UDim2.new(1, 0, 0, 48)
        tabBtn.BackgroundColor3 = THEME.PrimaryPurp
        tabBtn.BackgroundTransparency = 1
        tabBtn.Text = ""
        tabBtn.AutoButtonColor = false
        tabBtn.LayoutOrder = currentOrder
        tabBtn.ZIndex = 7
        tabBtn.Parent = NavContainer
        local selectionGradient = Instance.new("UIGradient")
        selectionGradient.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(1, 0.6),
        })
        selectionGradient.Parent = tabBtn

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 10)
        btnCorner.Parent = tabBtn

        local activeBar = Instance.new("Frame")
        activeBar.Name = "ActiveBar"
        activeBar.Size = UDim2.new(0, 2, 1, -10)
        activeBar.Position = UDim2.new(0, 0, 0, 5)
        activeBar.BackgroundColor3 = THEME.AccentPurp
        activeBar.BackgroundTransparency = 1
        activeBar.BorderSizePixel = 0
        activeBar.ZIndex = 9
        activeBar.Parent = tabBtn

        local barCorner = Instance.new("UICorner")
        barCorner.CornerRadius = UDim.new(1, 0)
        barCorner.Parent = activeBar

        local icon = createVectorIcon(
            tabBtn,
            iconId,
            UDim2.new(0, 27, 0, 27),
            THEME.TextMuted,
            UDim2.new(0, 16, 0.5, -13)
        )
        icon.ZIndex = 8

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -48, 1, 0)
        label.Position = UDim2.new(0, 58, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = name
        label.Font = Enum.Font.Code
        label.TextSize = 18
        label.TextColor3 = THEME.TextMuted
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.ZIndex = 8
        label.Parent = tabBtn

        local page = Instance.new("ScrollingFrame")
        page.Name = name .. "Page"
        page.Size = UDim2.new(1, 0, 1, 0)
        page.BackgroundTransparency = 1
        page.BorderSizePixel = 0
        page.ScrollBarThickness = 2
        page.CanvasSize = UDim2.new()
        page.AutomaticCanvasSize = Enum.AutomaticSize.Y
        page.ScrollBarImageColor3 = THEME.PrimaryPurp
        page.Visible = false
        page.ZIndex = 7
        page.Parent = ContentArea

        local pageList = Instance.new("UIListLayout")
        pageList.SortOrder = Enum.SortOrder.LayoutOrder
        pageList.Padding = UDim.new(0, 8)
        pageList.Parent = page
        local pagePadding = Instance.new("UIPadding")
        pagePadding.PaddingTop = UDim.new(0, 6)
        pagePadding.PaddingBottom = UDim.new(0, 20)
        pagePadding.PaddingLeft = UDim.new(0, 8)
        pagePadding.PaddingRight = UDim.new(0, 12)
        pagePadding.Parent = page
        pageList.Padding = UDim.new(0, 12)
        page.ScrollBarThickness = 3
        page.ScrollBarImageColor3 = Color3.fromRGB(75, 63, 91)
        page.ScrollBarImageTransparency = 0.3

        local tabData = {
            Button = tabBtn,
            Page = page,
            Icon = icon,
            Label = label,
            ActiveBar = activeBar,
        }

        tabBtn.MouseEnter:Connect(function()
            if activeTab ~= tabData then
                navTween(tabBtn, {
                    BackgroundTransparency = 0.7,
                    BackgroundColor3 = THEME.BgPanelHover,
                })
                navTween(label, {
                    TextColor3 = THEME.TextPrimary,
                })
                navTween(icon, {
                    ImageColor3 = THEME.AccentPurp,
                })
            end
        end)

        tabBtn.MouseLeave:Connect(function()
            if activeTab ~= tabData then
                navTween(tabBtn, {
                    BackgroundTransparency = 1,
                })
                navTween(label, {
                    TextColor3 = THEME.TextMuted,
                })
                navTween(icon, {
                    ImageColor3 = THEME.TextMuted,
                })
            end
        end)

        tabBtn.MouseButton1Click:Connect(function()
            if activeTab == tabData then
                return
            end

            for _, t in pairs(tabs) do
                navTween(t.Button, {
                    BackgroundTransparency = 1,
                })
                navTween(t.Label, {
                    TextColor3 = THEME.TextMuted,
                })
                navTween(t.Icon, {
                    ImageColor3 = THEME.TextMuted,
                })
                navTween(t.ActiveBar, {
                    BackgroundTransparency = 1,
                })
                t.Page.Visible = false
            end

            navTween(tabBtn, {
                BackgroundTransparency = 0.78,
                BackgroundColor3 = THEME.PrimaryPurp,
            })
            navTween(label, {
                TextColor3 = THEME.TextPrimary,
            })
            navTween(icon, {
                ImageColor3 = THEME.AccentPurp,
            })
            navTween(activeBar, {
                BackgroundTransparency = 0,
            })
            page.Visible = true
            activeTab = tabData
            if pageTween then
                pageTween:Cancel()
            end
            if pageFade then
                pageFade:Cancel()
            end
            ContentArea.Position = UDim2.fromOffset(220, 0)
            pageTween = TweenService:Create(
                ContentArea,
                TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                {
                    Position = UDim2.fromOffset(214, 0),
                }
            )
            pageTween:Play()
        end)

        tabs[name] = tabData
        return page
    end

    local DashboardPage = createTab("Dashboard", ICONS.Home)
    local PlayerPage = createTab("Player", ICONS.User)
    local VisualsPage = createTab("Visuals", ICONS.Eye)
    local SettingsPage = createTab("Settings", ICONS.Settings)

    local SidebarFooter = Instance.new("Frame")
    SidebarFooter.Name = "SidebarFooter"
    SidebarFooter.Size = UDim2.new(1, 0, 0, 75)
    SidebarFooter.Position = UDim2.new(0, 0, 1, -80)
    SidebarFooter.BackgroundTransparency = 1
    SidebarFooter.ZIndex = 7
    SidebarFooter.Parent = Sidebar

    createVectorIcon(
        SidebarFooter,
        ICONS.Diamond,
        UDim2.new(0, 12, 0, 12),
        THEME.AccentPurp,
        UDim2.new(0.5, 0, 0, 4),
        Vector2.new(0.5, 0)
    )

    local FootTitle = Instance.new("TextLabel")
    FootTitle.Size = UDim2.new(1, 0, 0, 16)
    FootTitle.Position = UDim2.new(0, 0, 0, 22)
    FootTitle.BackgroundTransparency = 1
    FootTitle.Text = "NightFall"
    FootTitle.Font = Enum.Font.GothamBold
    FootTitle.TextSize = 11
    FootTitle.TextColor3 = THEME.TextPrimary
    FootTitle.ZIndex = 8
    FootTitle.Parent = SidebarFooter

    local FootVer = Instance.new("TextLabel")
    FootVer.Size = UDim2.new(1, 0, 0, 14)
    FootVer.Position = UDim2.new(0, 0, 0, 38)
    FootVer.BackgroundTransparency = 1
    FootVer.Text = "v1.0.0"
    FootVer.Font = Enum.Font.Code
    FootVer.TextSize = 10
    FootVer.TextColor3 = THEME.TextDark
    FootVer.ZIndex = 8
    FootVer.Parent = SidebarFooter

    local FootLove = Instance.new("TextLabel")
    FootLove.Size = UDim2.new(1, 0, 0, 14)
    FootLove.Position = UDim2.new(0, 0, 0, 54)
    FootLove.BackgroundTransparency = 1
    FootLove.Text = "Made with love <3"
    FootLove.Font = Enum.Font.GothamMedium
    FootLove.TextSize = 9
    FootLove.TextColor3 = THEME.TextDark
    FootLove.ZIndex = 8
    FootLove.Parent = SidebarFooter

    local function createToggleCard(parent, title, subtitle, iconId, defaultState, onToggle)
        local card = Instance.new("Frame")
        card.Size = UDim2.new(0, 252, 0, 62)
        card.BackgroundColor3 = THEME.BgPanel
        card.BackgroundTransparency = 0.08
        card.ZIndex = 7
        card.Parent = parent

        local cardCorner = Instance.new("UICorner")
        cardCorner.CornerRadius = UDim.new(0, 7)
        cardCorner.Parent = card

        local cardStroke = Instance.new("UIStroke")
        cardStroke.Thickness = 1
        cardStroke.Color = THEME.Border
        cardStroke.Transparency = 0.65
        cardStroke.Parent = card

        local cardGrad = Instance.new("UIGradient")
        cardGrad.Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(180, 165, 205))
        cardGrad.Rotation = 45
        cardGrad.Parent = card

        local iconBox = Instance.new("Frame")
        iconBox.Size = UDim2.new(0, 36, 0, 36)
        iconBox.Position = UDim2.new(0, 12, 0.5, -18)
        iconBox.BackgroundColor3 = THEME.BgInner
        iconBox.BackgroundTransparency = 1
        iconBox.ZIndex = 8
        iconBox.Parent = card

        local iconCorner = Instance.new("UICorner")
        iconCorner.CornerRadius = UDim.new(0, 8)
        iconCorner.Parent = iconBox

        local iconStroke = Instance.new("UIStroke")
        iconStroke.Thickness = 1
        iconStroke.Color = THEME.Border
        iconStroke.Transparency = 1
        iconStroke.Parent = iconBox

        createVectorIcon(
            iconBox,
            iconId,
            UDim2.new(0, 29, 0, 29),
            THEME.AccentPurp,
            UDim2.new(0.5, 0, 0.5, 0),
            Vector2.new(0.5, 0.5)
        )

        local titleLabel = Instance.new("TextLabel")
        titleLabel.Size = UDim2.new(0, 120, 0, 16)
        titleLabel.Position = UDim2.new(0, 58, 0, 13)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = title
        titleLabel.Font = Enum.Font.Code
        titleLabel.TextSize = 17
        titleLabel.TextColor3 = THEME.TextPrimary
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.ZIndex = 8
        titleLabel.Parent = card

        local descLabel = Instance.new("TextLabel")
        descLabel.Size = UDim2.new(1, -110, 0, 16)
        descLabel.Position = UDim2.new(0, 58, 0, 32)
        descLabel.BackgroundTransparency = 1
        descLabel.Text = subtitle
        descLabel.Font = Enum.Font.Code
        descLabel.TextSize = 12
        descLabel.TextColor3 = THEME.TextMuted
        descLabel.TextXAlignment = Enum.TextXAlignment.Left
        descLabel.ZIndex = 8
        descLabel.Parent = card

        local switch = Instance.new("Frame")
        switch.Size = UDim2.new(0, 40, 0, 22)
        switch.Position = UDim2.new(1, -52, 0.5, -11)
        switch.BackgroundColor3 = defaultState and Color3.fromRGB(77, 59, 101) or Color3.fromRGB(36, 29, 48)
        switch.ZIndex = 8
        switch.Parent = card

        local switchCorner = Instance.new("UICorner")
        switchCorner.CornerRadius = UDim.new(1, 0)
        switchCorner.Parent = switch

        local switchStroke = Instance.new("UIStroke")
        switchStroke.Thickness = 1
        switchStroke.Color = defaultState and THEME.AccentPurp or THEME.Border
        switchStroke.Transparency = 0.3
        switchStroke.Parent = switch

        local thumb = Instance.new("Frame")
        thumb.Size = UDim2.new(0, 16, 0, 16)
        thumb.Position = defaultState and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
        thumb.BackgroundColor3 = Color3.fromRGB(166, 149, 191)
        thumb.ZIndex = 9
        thumb.Parent = switch

        local thumbCorner = Instance.new("UICorner")
        thumbCorner.CornerRadius = UDim.new(1, 0)
        thumbCorner.Parent = thumb

        local clickBtn = Instance.new("TextButton")
        clickBtn.Size = UDim2.new(1, 0, 1, 0)
        clickBtn.BackgroundTransparency = 1
        clickBtn.Text = ""
        clickBtn.ZIndex = 10
        clickBtn.Parent = card

        local state = defaultState

        local function updateVisual(anim)
            local time = anim and 0.22 or 0
            local targetColor = state and Color3.fromRGB(77, 59, 101) or Color3.fromRGB(36, 29, 48)
            local targetStroke = state and THEME.AccentPurp or THEME.Border
            local targetPos = state and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)

            TweenService:Create(switch, TweenInfo.new(time), {
                BackgroundColor3 = targetColor,
            }):Play()
            TweenService:Create(switchStroke, TweenInfo.new(time), {
                Color = targetStroke,
            }):Play()
            TweenService
                :Create(thumb, TweenInfo.new(time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Position = targetPos,
                })
                :Play()
        end

        clickBtn.MouseEnter:Connect(function()
            TweenService:Create(card, TweenInfo.new(0.18), {
                BackgroundTransparency = 0.2,
                BackgroundColor3 = THEME.BgPanelHover,
            }):Play()
        end)
        clickBtn.MouseLeave:Connect(function()
            TweenService:Create(card, TweenInfo.new(0.18), {
                BackgroundTransparency = 0.08,
                BackgroundColor3 = THEME.BgPanel,
            }):Play()
        end)

        clickBtn.MouseButton1Click:Connect(function()
            state = not state
            updateVisual(true)
            logConsole(
                "TOGGLE",
                string.format("%s: %s", title, state and "ENABLED" or "DISABLED"),
                state and THEME.SuccessGreen or THEME.DangerRed
            )
            if onToggle then
                onToggle(state)
            end
        end)

        return {
            Frame = card,
            Set = function(_, v, silent)
                if state == (v == true) then
                    return
                end
                local changed = state ~= v
                state = v == true
                updateVisual(false)
                if changed and onToggle and not silent then
                    onToggle(state)
                end
            end,
            Get = function()
                return state
            end,
        }
    end

    local function createSlider(parent, labelText, minVal, maxVal, defaultVal, onChange, step)
        local row = Instance.new("Frame")
        row.Size = UDim2.new(1, 0, 0, 34)
        row.BackgroundTransparency = 1
        row.ZIndex = 7
        row.Parent = parent

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0, 110, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = labelText
        label.Font = Enum.Font.GothamMedium
        label.TextSize = 16
        label.TextColor3 = THEME.TextPrimary
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.ZIndex = 8
        label.Parent = row

        local track = Instance.new("Frame")
        track.Size = UDim2.new(1, -122, 0, 6)
        track.Position = UDim2.new(0, 16, 0.5, -3)
        track.BackgroundColor3 = THEME.BgInner
        track.ZIndex = 8
        track.Parent = row

        local trackCorner = Instance.new("UICorner")
        trackCorner.CornerRadius = UDim.new(1, 0)
        trackCorner.Parent = track

        local fill = Instance.new("Frame")
        fill.Size = UDim2.new((defaultVal - minVal) / (maxVal - minVal), 0, 1, 0)
        fill.BackgroundColor3 = THEME.PrimaryPurp
        fill.ZIndex = 8
        fill.Parent = track

        local fillCorner = Instance.new("UICorner")
        fillCorner.CornerRadius = UDim.new(1, 0)
        fillCorner.Parent = fill

        local fillGrad = Instance.new("UIGradient")
        fillGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, THEME.PrimaryPurp),
            ColorSequenceKeypoint.new(1, THEME.AccentPurp),
        })
        fillGrad.Parent = fill

        local thumb = Instance.new("Frame")
        thumb.Size = UDim2.new(0, 16, 0, 16)
        thumb.AnchorPoint = Vector2.new(0.5, 0.5)
        thumb.Position = UDim2.new((defaultVal - minVal) / (maxVal - minVal), 0, 0.5, 0)
        thumb.BackgroundColor3 = Color3.fromRGB(142, 94, 194)
        thumb.ZIndex = 9
        thumb.Parent = track

        local thumbCorner = Instance.new("UICorner")
        thumbCorner.CornerRadius = UDim.new(1, 0)
        thumbCorner.Parent = thumb

        local valBadge = Instance.new("Frame")
        valBadge.Size = UDim2.new(0, 82, 0, 28)
        valBadge.Position = UDim2.new(1, -94, 0.5, -14)
        valBadge.BackgroundColor3 = THEME.BgPanel
        valBadge.BackgroundTransparency = 0.3
        valBadge.ZIndex = 8
        valBadge.Parent = row

        local valCorner = Instance.new("UICorner")
        valCorner.CornerRadius = UDim.new(0, 6)
        valCorner.Parent = valBadge

        local valStroke = Instance.new("UIStroke")
        valStroke.Thickness = 1
        valStroke.Color = THEME.Border
        valStroke.Transparency = 0.4
        valStroke.Parent = valBadge

        local valText = Instance.new("TextBox")
        valText.ClearTextOnFocus = false
        valText.Size = UDim2.new(1, 0, 1, 0)
        valText.BackgroundTransparency = 1
        valText.Text = tostring(defaultVal)
        valText.Font = Enum.Font.Code
        valText.TextSize = 16
        valText.TextColor3 = THEME.TextPrimary
        valText.ZIndex = 9
        valText.Parent = valBadge

        local currentVal = defaultVal
        local draggingSlider = false

        local function setValue(value, notify)
            value = tonumber(value)
            if not value or value ~= value or math.abs(value) == math.huge then
                valText.Text = tostring(currentVal)
                return
            end
            value = math.clamp(value, minVal, maxVal)
            if step and step > 0 then
                value = math.clamp(minVal + math.round((value - minVal) / step) * step, minVal, maxVal)
            end
            local changed = currentVal ~= value
            currentVal = value
            valText.Text = string.format("%.6g", value)
            local rel = maxVal > minVal and (value - minVal) / (maxVal - minVal) or 0
            fill.Size = UDim2.fromScale(rel, 1)
            thumb.Position = UDim2.new(rel, 0, 0.5, 0)
            if changed and notify and onChange then
                onChange(value)
            end
        end

        valText.FocusLost:Connect(function()
            setValue(valText.Text:gsub(",", "."), true)
        end)

        local function updateFromPos(mouseX)
            local rel = math.clamp((mouseX - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
            setValue(math.round((minVal + (maxVal - minVal) * rel) * 100) / 100, true)
        end

        local trackBtn = Instance.new("TextButton")
        trackBtn.Size = UDim2.new(1, 24, 1, 24)
        trackBtn.Position = UDim2.new(0, -12, 0, -12)
        trackBtn.BackgroundTransparency = 1
        trackBtn.Text = ""
        trackBtn.ZIndex = 10
        trackBtn.Parent = track

        trackBtn.InputBegan:Connect(function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch
            then
                draggingSlider = true
                updateFromPos(input.Position.X)
            end
        end)

        connect(UserInputService.InputEnded, function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch
            then
                if draggingSlider then
                    draggingSlider = false
                    logConsole(
                        "SLIDER",
                        string.format("%s set to %d", labelText, currentVal),
                        THEME.AccentPurp
                    )
                end
            end
        end)

        connect(UserInputService.InputChanged, function(input)
            if
                draggingSlider
                and (
                    input.UserInputType == Enum.UserInputType.MouseMovement
                    or input.UserInputType == Enum.UserInputType.Touch
                )
            then
                updateFromPos(input.Position.X)
            end
        end)

        return {
            Set = function(_, value, silent)
                setValue(value, not silent)
            end,
            Get = function()
                return currentVal
            end,
        }
    end

    local HeroCard = Instance.new("Frame")
    HeroCard.Name = "HeroCard"
    HeroCard.Size = UDim2.new(1, -5, 0, 164)
    HeroCard.BackgroundColor3 = THEME.BgPanel
    HeroCard.BackgroundTransparency = 0.35
    HeroCard.ClipsDescendants = true
    HeroCard.ZIndex = 7
    HeroCard.Parent = DashboardPage

    local HeroCorner = Instance.new("UICorner")
    HeroCorner.CornerRadius = UDim.new(0, 14)
    HeroCorner.Parent = HeroCard

    local HeroStroke = Instance.new("UIStroke")
    HeroStroke.Thickness = 1
    HeroStroke.Color = THEME.Border
    HeroStroke.Transparency = 0.35
    HeroStroke.Parent = HeroCard

    local HeroGrad = Instance.new("UIGradient")
    HeroGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(26, 18, 42)),
        ColorSequenceKeypoint.new(0.55, Color3.fromRGB(16, 12, 26)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 7, 16)),
    })
    HeroGrad.Rotation = 20
    HeroGrad.Parent = HeroCard

    local BannerHeaderRow = Instance.new("Frame")
    BannerHeaderRow.Size = UDim2.new(0, 160, 0, 22)
    BannerHeaderRow.Position = UDim2.new(0, 16, 0, 14)
    BannerHeaderRow.BackgroundTransparency = 1
    BannerHeaderRow.ZIndex = 8
    BannerHeaderRow.Parent = HeroCard

    createVectorIcon(
        BannerHeaderRow,
        ICONS.Diamond,
        UDim2.new(0, 13, 0, 13),
        THEME.AccentPurp,
        UDim2.new(0, 0, 0.5, -6)
    )

    local BannerHeaderText = Instance.new("TextLabel")
    BannerHeaderText.Size = UDim2.new(1, -20, 1, 0)
    BannerHeaderText.Position = UDim2.new(0, 20, 0, 0)
    BannerHeaderText.BackgroundTransparency = 1
    BannerHeaderText.Text = "Dashboard"
    BannerHeaderText.Font = Enum.Font.GothamBold
    BannerHeaderText.TextSize = 13
    BannerHeaderText.TextColor3 = THEME.TextPrimary
    BannerHeaderText.TextXAlignment = Enum.TextXAlignment.Left
    BannerHeaderText.ZIndex = 8
    BannerHeaderText.Parent = BannerHeaderRow

    local WelcomeBox = Instance.new("Frame")
    WelcomeBox.Name = "WelcomeBox"
    WelcomeBox.Size = UDim2.new(1, -24, 0, 102)
    WelcomeBox.Position = UDim2.new(0, 16, 0, 46)
    WelcomeBox.BackgroundColor3 = THEME.BgInner
    WelcomeBox.BackgroundTransparency = 1
    WelcomeBox.ZIndex = 8
    WelcomeBox.Parent = HeroCard

    local WelcomeCorner = Instance.new("UICorner")
    WelcomeCorner.CornerRadius = UDim.new(0, 10)
    WelcomeCorner.Parent = WelcomeBox

    local WelcomeStroke = Instance.new("UIStroke")
    WelcomeStroke.Thickness = 1
    WelcomeStroke.Color = THEME.Border
    WelcomeStroke.Transparency = 0.4
    WelcomeStroke.Parent = WelcomeBox

    local WelcomeTitle = Instance.new("TextLabel")
    WelcomeTitle.Size = UDim2.new(1, -24, 0, 24)
    WelcomeTitle.Position = UDim2.new(0, 16, 0, 16)
    WelcomeTitle.BackgroundTransparency = 1
    WelcomeTitle.Text = "Welcome to NightFall!"
    WelcomeTitle.Font = Enum.Font.Code
    WelcomeTitle.TextSize = 18
    WelcomeTitle.TextColor3 = THEME.TextPrimary
    WelcomeTitle.TextXAlignment = Enum.TextXAlignment.Left
    WelcomeTitle.ZIndex = 9
    WelcomeTitle.Parent = WelcomeBox

    local WelcomeSub = Instance.new("TextLabel")
    WelcomeSub.Size = UDim2.new(1, -24, 0, 18)
    WelcomeSub.Position = UDim2.new(0, 16, 0, 46)
    WelcomeSub.BackgroundTransparency = 1
    WelcomeSub.Text = "Enjoy your game experience."
    WelcomeSub.Font = Enum.Font.Code
    WelcomeSub.TextSize = 15
    WelcomeSub.TextColor3 = THEME.TextMuted
    WelcomeSub.TextXAlignment = Enum.TextXAlignment.Left
    WelcomeSub.ZIndex = 9
    WelcomeSub.Parent = WelcomeBox

    local ArtContainer = Instance.new("Frame")
    ArtContainer.Size = UDim2.new(0, 230, 1, 0)
    ArtContainer.Position = UDim2.new(1, -230, 0, 0)
    ArtContainer.BackgroundTransparency = 1
    ArtContainer.ClipsDescendants = true
    ArtContainer.ZIndex = 7
    ArtContainer.Parent = HeroCard

    local SkyGradient = Instance.new("Frame")
    SkyGradient.Size = UDim2.new(1, 0, 1, 0)
    SkyGradient.BackgroundColor3 = Color3.fromRGB(38, 18, 62)
    SkyGradient.BorderSizePixel = 0
    SkyGradient.ZIndex = 8
    SkyGradient.Parent = ArtContainer

    local SkyFade = Instance.new("UIGradient")
    SkyFade.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.35, 0.45),
        NumberSequenceKeypoint.new(1, 0.05),
    })
    SkyFade.Parent = SkyGradient

    local MoonAura = Instance.new("ImageLabel")
    MoonAura.AnchorPoint = Vector2.new(0.5, 0.5)
    MoonAura.Position = UDim2.new(0.58, 0, 0.42, 0)
    MoonAura.Size = UDim2.new(0, 130, 0, 130)
    MoonAura.BackgroundTransparency = 1
    MoonAura.Image = ICONS.Glow
    MoonAura.ImageColor3 = THEME.AccentPurp
    MoonAura.ImageTransparency = 0.35
    MoonAura.ZIndex = 9
    MoonAura.Parent = ArtContainer

    local MoonCorona = Instance.new("ImageLabel")
    MoonCorona.AnchorPoint = Vector2.new(0.5, 0.5)
    MoonCorona.Position = UDim2.new(0.58, 0, 0.42, 0)
    MoonCorona.Size = UDim2.new(0, 80, 0, 80)
    MoonCorona.BackgroundTransparency = 1
    MoonCorona.Image = ICONS.Glow
    MoonCorona.ImageColor3 = Color3.fromRGB(225, 190, 255)
    MoonCorona.ImageTransparency = 0.5
    MoonCorona.ZIndex = 9
    MoonCorona.Parent = ArtContainer

    local MoonDisc = Instance.new("Frame")
    MoonDisc.Size = UDim2.new(0, 56, 0, 56)
    MoonDisc.AnchorPoint = Vector2.new(0.5, 0.5)
    MoonDisc.Position = UDim2.new(0.58, 0, 0.42, 0)
    MoonDisc.BackgroundColor3 = Color3.fromRGB(215, 185, 255)
    MoonDisc.BorderSizePixel = 0
    MoonDisc.ClipsDescendants = true
    MoonDisc.ZIndex = 10
    MoonDisc.Parent = ArtContainer

    local MoonDiscCorner = Instance.new("UICorner")
    MoonDiscCorner.CornerRadius = UDim.new(1, 0)
    MoonDiscCorner.Parent = MoonDisc

    local MoonDiscGrad = Instance.new("UIGradient")
    MoonDiscGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(245, 230, 255)),
        ColorSequenceKeypoint.new(0.6, Color3.fromRGB(205, 170, 245)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(160, 115, 215)),
    })
    MoonDiscGrad.Rotation = 40
    MoonDiscGrad.Parent = MoonDisc

    local function addCrater(xRel, yRel, w, h, trans)
        local crater = Instance.new("Frame")
        crater.Size = UDim2.new(0, w, 0, h)
        crater.Position = UDim2.new(xRel, 0, yRel, 0)
        crater.BackgroundColor3 = Color3.fromRGB(135, 95, 185)
        crater.BackgroundTransparency = trans or 0.55
        crater.BorderSizePixel = 0
        crater.ZIndex = 11
        crater.Parent = MoonDisc

        local cCorner = Instance.new("UICorner")
        cCorner.CornerRadius = UDim.new(1, 0)
        cCorner.Parent = crater
    end
    addCrater(0.2, 0.25, 18, 14, 0.5)
    addCrater(0.48, 0.18, 14, 12, 0.55)
    addCrater(0.35, 0.55, 22, 16, 0.45)
    addCrater(0.15, 0.60, 12, 10, 0.6)

    local function addCloud(x, y, w, h, trans)
        local c = Instance.new("Frame")
        c.Size = UDim2.new(0, w, 0, h)
        c.Position = UDim2.new(x, 0, y, 0)
        c.BackgroundColor3 = Color3.fromRGB(48, 24, 75)
        c.BackgroundTransparency = trans or 0.55
        c.BorderSizePixel = 0
        c.ZIndex = 12
        c.Parent = ArtContainer

        local cCorner = Instance.new("UICorner")
        cCorner.CornerRadius = UDim.new(1, 0)
        cCorner.Parent = c
    end
    addCloud(0.32, 0.35, 95, 7, 0.5)
    addCloud(0.46, 0.50, 75, 5, 0.58)
    addCloud(0.20, 0.62, 110, 6, 0.62)

    local Hills = Instance.new("Frame")
    Hills.Size = UDim2.new(1, 0, 0, 32)
    Hills.Position = UDim2.new(0, 0, 1, -32)
    Hills.BackgroundColor3 = Color3.fromRGB(13, 9, 20)
    Hills.BorderSizePixel = 0
    Hills.ZIndex = 13
    Hills.Parent = ArtContainer

    local HillsCorner = Instance.new("UICorner")
    HillsCorner.CornerRadius = UDim.new(0, 16)
    HillsCorner.Parent = Hills

    local TowerFrame = Instance.new("Frame")
    TowerFrame.Size = UDim2.new(0, 58, 0, 96)
    TowerFrame.Position = UDim2.new(1, -74, 1, -96)
    TowerFrame.BackgroundTransparency = 1
    TowerFrame.ZIndex = 14
    TowerFrame.Parent = ArtContainer

    local TRoof = Instance.new("Frame")
    TRoof.Size = UDim2.new(0, 48, 0, 6)
    TRoof.Position = UDim2.new(0.5, -24, 0, 10)
    TRoof.BackgroundColor3 = Color3.fromRGB(9, 6, 14)
    TRoof.BorderSizePixel = 0
    TRoof.ZIndex = 15
    TRoof.Parent = TowerFrame

    local TPeak = Instance.new("Frame")
    TPeak.Size = UDim2.new(0, 4, 0, 7)
    TPeak.Position = UDim2.new(0.5, -2, 0, 4)
    TPeak.BackgroundColor3 = Color3.fromRGB(9, 6, 14)
    TPeak.BorderSizePixel = 0
    TPeak.ZIndex = 15
    TPeak.Parent = TowerFrame

    local TCabin = Instance.new("Frame")
    TCabin.Size = UDim2.new(0, 38, 0, 24)
    TCabin.Position = UDim2.new(0.5, -19, 0, 16)
    TCabin.BackgroundColor3 = Color3.fromRGB(9, 6, 14)
    TCabin.BorderSizePixel = 0
    TCabin.ZIndex = 15
    TCabin.Parent = TowerFrame

    local TWindow = Instance.new("Frame")
    TWindow.Size = UDim2.new(0, 20, 0, 8)
    TWindow.Position = UDim2.new(0.5, -10, 0, 20)
    TWindow.BackgroundColor3 = Color3.fromRGB(230, 190, 255)
    TWindow.BorderSizePixel = 0
    TWindow.ZIndex = 16
    TWindow.Parent = TowerFrame

    local TWindowGlow = Instance.new("ImageLabel")
    TWindowGlow.AnchorPoint = Vector2.new(0.5, 0.5)
    TWindowGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
    TWindowGlow.Size = UDim2.new(1.8, 0, 2.2, 0)
    TWindowGlow.BackgroundTransparency = 1
    TWindowGlow.Image = ICONS.Glow
    TWindowGlow.ImageColor3 = THEME.AccentPurp
    TWindowGlow.ImageTransparency = 0.4
    TWindowGlow.ZIndex = 15
    TWindowGlow.Parent = TWindow

    local TRail = Instance.new("Frame")
    TRail.Size = UDim2.new(0, 52, 0, 4)
    TRail.Position = UDim2.new(0.5, -26, 0, 40)
    TRail.BackgroundColor3 = Color3.fromRGB(9, 6, 14)
    TRail.BorderSizePixel = 0
    TRail.ZIndex = 15
    TRail.Parent = TowerFrame

    local TDeck = Instance.new("Frame")
    TDeck.Size = UDim2.new(0, 50, 0, 3)
    TDeck.Position = UDim2.new(0.5, -25, 0, 44)
    TDeck.BackgroundColor3 = Color3.fromRGB(9, 6, 14)
    TDeck.BorderSizePixel = 0
    TDeck.ZIndex = 15
    TDeck.Parent = TowerFrame

    local TLeg1 = Instance.new("Frame")
    TLeg1.Size = UDim2.new(0, 3, 0, 54)
    TLeg1.Position = UDim2.new(0.5, -18, 0, 46)
    TLeg1.BackgroundColor3 = Color3.fromRGB(9, 6, 14)
    TLeg1.BorderSizePixel = 0
    TLeg1.ZIndex = 15
    TLeg1.Parent = TowerFrame

    local TLeg2 = Instance.new("Frame")
    TLeg2.Size = UDim2.new(0, 3, 0, 54)
    TLeg2.Position = UDim2.new(0.5, 15, 0, 46)
    TLeg2.BackgroundColor3 = Color3.fromRGB(9, 6, 14)
    TLeg2.BorderSizePixel = 0
    TLeg2.ZIndex = 15
    TLeg2.Parent = TowerFrame

    local TBrace1 = Instance.new("Frame")
    TBrace1.Size = UDim2.new(0, 34, 0, 1)
    TBrace1.Position = UDim2.new(0.5, -17, 0, 68)
    TBrace1.BackgroundColor3 = Color3.fromRGB(15, 10, 22)
    TBrace1.BorderSizePixel = 0
    TBrace1.ZIndex = 15
    TBrace1.Parent = TowerFrame

    local SectionTitle = Instance.new("Frame")
    SectionTitle.Size = UDim2.new(1, 0, 0, 26)
    SectionTitle.BackgroundTransparency = 1
    SectionTitle.ZIndex = 7
    SectionTitle.Parent = DashboardPage

    createVectorIcon(
        SectionTitle,
        ICONS.Electricity,
        UDim2.new(0, 15, 0, 15),
        THEME.AccentPurp,
        UDim2.new(0, 0, 0.5, -7)
    )

    local SecText = Instance.new("TextLabel")
    SecText.Size = UDim2.new(1, -24, 1, 0)
    SecText.Position = UDim2.new(0, 24, 0, 0)
    SecText.BackgroundTransparency = 1
    SecText.Text = "Quick Features"
    SecText.Font = Enum.Font.GothamBold
    SecText.TextSize = 13
    SecText.TextColor3 = THEME.TextPrimary
    SecText.TextXAlignment = Enum.TextXAlignment.Left
    SecText.ZIndex = 8
    SecText.Parent = SectionTitle

    local Grid = Instance.new("Frame")
    Grid.Size = UDim2.new(1, -5, 0, 124)
    Grid.BackgroundTransparency = 1
    Grid.ZIndex = 7
    Grid.Parent = DashboardPage

    local GridLayout = Instance.new("UIGridLayout")
    GridLayout.CellSize = UDim2.new(0.5, -6, 0, 57)
    GridLayout.CellPadding = UDim2.new(0, 10, 0, 10)
    GridLayout.Parent = Grid

    local MiscSectionTitle = Instance.new("Frame")
    MiscSectionTitle.Size = UDim2.new(1, 0, 0, 26)
    MiscSectionTitle.BackgroundTransparency = 1
    MiscSectionTitle.ZIndex = 7
    MiscSectionTitle.Parent = DashboardPage

    createVectorIcon(
        MiscSectionTitle,
        ICONS.Package,
        UDim2.new(0, 15, 0, 15),
        THEME.AccentPurp,
        UDim2.new(0, 0, 0.5, -7)
    )

    local MiscSecText = Instance.new("TextLabel")
    MiscSecText.Size = UDim2.new(1, -24, 1, 0)
    MiscSecText.Position = UDim2.new(0, 24, 0, 0)
    MiscSecText.BackgroundTransparency = 1
    MiscSecText.Text = "Miscellaneous"
    MiscSecText.Font = Enum.Font.GothamBold
    MiscSecText.TextSize = 13
    MiscSecText.TextColor3 = THEME.TextPrimary
    MiscSecText.TextXAlignment = Enum.TextXAlignment.Left
    MiscSecText.ZIndex = 8
    MiscSecText.Parent = MiscSectionTitle

    local MiscCard = Instance.new("Frame")
    MiscCard.Size = UDim2.new(1, -5, 0, 76)
    MiscCard.BackgroundColor3 = THEME.BgPanel
    MiscCard.BackgroundTransparency = 0.35
    MiscCard.ZIndex = 7
    MiscCard.Parent = DashboardPage

    local MiscCorner = Instance.new("UICorner")
    MiscCorner.CornerRadius = UDim.new(0, 12)
    MiscCorner.Parent = MiscCard

    local MiscStroke = Instance.new("UIStroke")
    MiscStroke.Thickness = 1
    MiscStroke.Color = THEME.Border
    MiscStroke.Transparency = 0.35
    MiscStroke.Parent = MiscCard

    local MiscLayout = Instance.new("UIListLayout")
    MiscLayout.Padding = UDim.new(0, 8)
    MiscLayout.Parent = MiscCard

    if tabs["Dashboard"] then
        tabs["Dashboard"].Button.BackgroundColor3 = THEME.PrimaryPurp
        tabs["Dashboard"].Button.BackgroundTransparency = 0.82
        tabs["Dashboard"].Label.TextColor3 = THEME.TextPrimary
        tabs["Dashboard"].Icon.ImageColor3 = THEME.AccentPurp
        tabs["Dashboard"].ActiveBar.BackgroundTransparency = 0
        tabs["Dashboard"].Page.Visible = true
        activeTab = tabs["Dashboard"]
    end

    connect(UserInputService.InputBegan, function(input, processed)
        if
            not processed
            and (input.KeyCode == Enum.KeyCode.RightControl or input.KeyCode == Enum.KeyCode.Insert)
        then
            MainFrame.Visible = not MainFrame.Visible
            OuterBloom.Visible = MainFrame.Visible
        end
    end)

    do
        local function line(parent, x, y, width, height, color, transparency)
            local frame = Instance.new("Frame")
            frame.BorderSizePixel = 0
            frame.Position = UDim2.fromOffset(x, y)
            frame.Size = UDim2.fromOffset(width, height)
            frame.BackgroundColor3 = color or THEME.Border
            frame.BackgroundTransparency = transparency or 0
            frame.ZIndex = parent.ZIndex
            frame.Parent = parent
            return frame
        end

        line(Body, 204, -12, 1, 486, THEME.Border, 0.3)
        changelogsDivider = line(Body, 772, 0, 1, 458, THEME.Border, 0.55)
        line(SidebarFooter, 0, -18, 188, 1, THEME.Border, 0.2)
        line(ConsoleHeader, 0, 48, 390, 1, THEME.Border, 0.2)
        ConsoleHeader.Size = UDim2.new(1, 0, 0, 48)
        ConsoleScroll.Position = UDim2.fromOffset(12, 60)
        ConsoleScroll.Size = UDim2.new(1, -24, 1, -98)
        ConsoleScroll.ScrollBarThickness = 5
        ConsoleScroll.ScrollBarImageColor3 = THEME.Border
        ConsoleTitle.Font = Enum.Font.Code
        ConsoleTitle.TextSize = 18
        ConsoleTitle.Position = UDim2.fromOffset(50, 0)
        ConsoleIcon.TextSize = 23
        ConsoleIcon.Size = UDim2.new(0, 32, 1, 0)
        PromptPrefix.TextColor3 = THEME.SuccessGreen
        PromptInput.PlaceholderColor3 = THEME.SuccessGreen
        PromptRow.Position = UDim2.new(0, 12, 1, -28)

        GameTitle.Font = Enum.Font.Code
        GameTitle.TextSize = 17
        GameTitle.Size = UDim2.fromOffset(150, 24)
        GameTitle.Position = UDim2.fromOffset(42, 0)
        GameVer.TextSize = 14
        GameVer.Position = UDim2.fromOffset(42, 32)
        StatusDiv.Position = UDim2.fromOffset(146, 32)
        StatusDiv.Size = UDim2.fromOffset(1, 14)
        StatusDot.Position = UDim2.fromOffset(170, 35)
        StatusDot.Size = UDim2.fromOffset(9, 9)
        StatusText.Position = UDim2.fromOffset(188, 31)
        StatusText.TextSize = 14
        StatusText.Font = Enum.Font.Code
        BannerHeaderText.Font = Enum.Font.Code
        BannerHeaderText.TextSize = 18
        SecText.Font = Enum.Font.Code
        SecText.TextSize = 16
        MiscSecText.Font = Enum.Font.Code
        MiscSecText.TextSize = 16
        FootTitle.Font = Enum.Font.Code
        FootTitle.TextSize = 14
        FootLove.Font = Enum.Font.Code
        FootLove.TextSize = 12

        HeroCard.BackgroundColor3 = Color3.new(1, 1, 1)
        HeroCard.BackgroundTransparency = 0
        MoonDisc.BackgroundColor3 = Color3.new(1, 1, 1)
        MoonDiscGrad.Color = ColorSequence.new(Color3.fromRGB(151, 93, 208), Color3.fromRGB(79, 42, 126))
        TWindow.BackgroundColor3 = Color3.fromRGB(49, 32, 65)
        TWindowGlow.ImageTransparency = 0.92
        TLeg1.Size = UDim2.fromOffset(14, 54)
        TLeg2.Size = UDim2.fromOffset(14, 54)
        TBrace1.Rotation = 55
        local roof = line(TowerFrame, 9, 8, 40, 10, Color3.fromRGB(9, 6, 14))
        roof.Rotation = -12
        roof.ZIndex = 15

        local random = Random.new(21)
        for i = 1, 32 do
            local height = random:NextInteger(9, 32)
            local tree = line(ArtContainer, (i - 1) * 8, 164 - height, 15, height, Color3.fromRGB(10, 7, 16))
            tree.ZIndex = 13
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0.5, 0)
            corner.Parent = tree
        end

        local function fracture(x, y, angle, length, depth)
            if depth <= 0 then
                return
            end
            local dx, dy = math.cos(angle) * length, math.sin(angle) * length
            local vein = line(TitleBar, x + dx / 2, y + dy / 2, length, 1, THEME.PrimaryPurp, 0.78)
            vein.AnchorPoint = Vector2.new(0.5, 0.5)
            vein.Rotation = math.deg(angle)
            fracture(x + dx, y + dy, angle + random:NextNumber(-0.55, 0.55), length * 0.7, depth - 1)
            if depth > 2 then
                fracture(x + dx, y + dy, angle + 0.9, length * 0.46, depth - 2)
            end
        end

        local canvas = Instance.new("Frame")
        canvas.Name = "WindowCanvas"
        canvas.AnchorPoint = Vector2.new(0.5, 0.5)
        canvas.Position = UDim2.fromScale(0.5, 0.5)
        canvas.Size = UDim2.fromOffset(1200, 630)
        canvas.BackgroundTransparency = 1
        canvas.Parent = ScreenGui
        MainFrame.Parent = canvas
        OuterBloom.Parent = canvas
        local scale = Instance.new("UIScale")
        scale.Parent = canvas
        local requestedScale = options.Scale or 0.78
        if options.Scale then
            requestedScale = math.clamp(tonumber(options.Scale) or 0.78, 0.6, 1.8)
        end
        local function scaleLimit()
            local camera = workspace.CurrentCamera
            if not camera then
                return 1
            end
            local viewport = camera.ViewportSize
            return math.max(0.25, math.min((viewport.X - 48) / 1200, (viewport.Y - 70) / 630, 1.6))
        end
        fitWindow = function()
            local camera = workspace.CurrentCamera
            if not camera then
                return
            end
            local viewport = camera.ViewportSize
            scale.Scale = math.min(scaleLimit(), expanded and scaleLimit() or requestedScale)
            MainFrame.Position = UDim2.new(0.5, -600, 0.5, -315)
        end
        local cameraConnection
        local function watchCamera()
            if cameraConnection then
                cameraConnection:Disconnect()
            end
            if workspace.CurrentCamera then
                cameraConnection =
                    connect(workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"), fitWindow)
            end
            fitWindow()
        end
        connect(workspace:GetPropertyChangedSignal("CurrentCamera"), watchCamera)
        watchCamera()

        local pointerPosition
        connect(UserInputService.InputChanged, function(input)
            if input == dragInput then
                pointerPosition = input.Position
            end
        end)
        local dragRenderName = ScreenGui.Name .. "_Drag"
        local runService = game:GetService("RunService")
        local decorHidden = false
        local function dragDecor(hidden)
            for _, child in ipairs(canvas:GetChildren()) do
                if child:IsA("GuiObject") and (child.Name == "OuterSmoke" or child.Name:match("^CharcoalEdge")) then
                    child.Visible = not hidden and MainFrame.Visible and not isMinimized
                        and not child:GetAttribute("Disabled")
                end
            end
        end
        runService:BindToRenderStep(dragRenderName, Enum.RenderPriority.Input.Value + 1, function()
            if not dragging then
                if decorHidden then
                    decorHidden = false
                    dragDecor(false)
                end
                return
            end
            if not decorHidden then
                decorHidden = true
                dragDecor(true)
            end
            local pointer
            if dragInput and dragInput.UserInputType == Enum.UserInputType.Touch then
                pointer = pointerPosition or dragStart
            else
                local mouse = UserInputService:GetMouseLocation()
                pointer = Vector3.new(mouse.X, mouse.Y, 0)
            end
            local delta = pointer - dragStart
            canvas.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + math.round(delta.X),
                startPos.Y.Scale,
                startPos.Y.Offset + math.round(delta.Y)
            )
        end)
        ScreenGui.Destroying:Connect(function()
            runService:UnbindFromRenderStep(dragRenderName)
        end)

        local grip = Instance.new("TextButton")
        grip.Name = "ResizeHandle"
        grip.Size = UDim2.fromOffset(28, 28)
        grip.Position = UDim2.new(1, -30, 1, -30)
        grip.Text = ""
        grip.BackgroundTransparency = 1
        grip.ZIndex = 30
        grip.Parent = MainFrame
        for i = 1, 3 do
            local mark = Instance.new("Frame")
            mark.BorderSizePixel = 0
            mark.Size = UDim2.fromOffset(i * 5, 1.5)
            mark.Position = UDim2.fromOffset(23 - i * 5, 23 - i * 3)
            mark.Rotation = -45
            mark.BackgroundColor3 = THEME.TextMuted
            mark.ZIndex = 31
            mark.Parent = grip
        end
        local resizing, resizeStart, originalScale, resizeOrigin, resizeTouch
        local resizePreview = Instance.new("Frame")
        resizePreview.BackgroundTransparency = 1
        resizePreview.BorderSizePixel = 0
        resizePreview.Visible = false
        resizePreview.ZIndex = 60
        resizePreview.Parent = ScreenGui
        local previewStroke = Instance.new("UIStroke")
        previewStroke.Color = THEME.AccentPurp
        previewStroke.Parent = resizePreview
        local resizePointer
        grip.InputBegan:Connect(function(input)
            if isMinimized then
                return
            end
            if
                input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch
            then
                resizing = true
                dragging = false
                expanded = false
                resizeStart, originalScale = input.Position, scale.Scale
                resizePointer = input.Position
                resizeOrigin = MainFrame.AbsolutePosition
                resizePreview.Position = UDim2.fromOffset(resizeOrigin.X, resizeOrigin.Y)
                resizePreview.Size = UDim2.fromOffset(1200 * scale.Scale, 630 * scale.Scale)
                resizePreview.Visible = true
                resizeTouch = input
            end
        end)
        connect(UserInputService.InputChanged, function(input)
            if not resizing then
                return
            end
            if input.UserInputType ~= Enum.UserInputType.MouseMovement and input ~= resizeTouch then
                return
            end
            resizePointer = input.Position
        end)
        connect(game:GetService("RunService").RenderStepped, function()
            if not resizing or not resizePointer then
                return
            end
            local delta = resizePointer - resizeStart
            local change = (delta.X * 1200 + delta.Y * 630) / (1200 * 1200 + 630 * 630)
            local nextScale = math.clamp(originalScale + change, math.min(0.5, scaleLimit()), scaleLimit())
            if math.abs(nextScale - requestedScale) < 0.001 then
                return
            end
            requestedScale = nextScale
            resizePreview.Size = UDim2.fromOffset(1200 * requestedScale, 630 * requestedScale)
        end)
        connect(UserInputService.InputEnded, function(input)
            if input == resizeTouch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                if resizing then
                    scale.Scale = requestedScale
                    local origin = canvas.AbsolutePosition
                    MainFrame.Position = UDim2.fromOffset(
                        (resizeOrigin.X - origin.X) / scale.Scale,
                        (resizeOrigin.Y - origin.Y) / scale.Scale
                    )
                end
                resizePreview.Visible = false
                resizing = false
            end
        end)
        MainFrame:GetPropertyChangedSignal("Size"):Connect(function()
            grip.Visible = not isMinimized
        end)
    end

    do
        local function style(instance)
            if instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox") then
                instance.Font = Enum.Font.GothamMedium
            end
            if instance:IsA("GuiObject") then
                instance.BorderSizePixel = 0
            end
        end
        for _, instance in ipairs(ScreenGui:GetDescendants()) do
            style(instance)
        end
        ScreenGui.DescendantAdded:Connect(style)
        TitleLabel.TextSize = 64
        TitleLabel.Size = UDim2.fromOffset(440, 88)
        CrestN.TextSize = 82
        SubtitleLabel.Text = "DARKNESS IS THE INTERFACE."
        SubtitleLabel.TextSize = 16
        HeaderGlow.BackgroundTransparency = 0.92
        HeroGrad.Color = ColorSequence.new(Color3.fromRGB(13, 10, 21), Color3.fromRGB(21, 12, 33))
        HeroStroke.Transparency = 0.65
        WelcomeStroke.Transparency = 0.65
        ConsoleFrame.BackgroundColor3 = THEME.BgMain
        ConsoleStroke.Transparency = 0.5
        MiscStroke.Transparency = 0.7
        MainCorner.CornerRadius = UDim.new(0, 15)
        local edgeGradient = Instance.new("UIGradient")
        edgeGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(170, 115, 225)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(70, 45, 100)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 95, 205)),
        })
        edgeGradient.Rotation = 25
        edgeGradient.Parent = MainStroke
    end

    do
        local glyphs = {
            ["N"] = {
                advance = 85,
                top = 8,
                data = [=[5!)"1"0"Y","/#5"W#0"-$9"U$3",%;"T%5"*&>"S&7")'A"R'8"((C"R(9"()D"Q)%"])/"'*F"P*%"^*."&++"8+5"P+$"_+-"&,(";,3"O,$"_,."%-'"=-6"%.&">.4"`--#%/%"?/3"$0%"@01"`/.#A10"a1-"$1$#B20"C3/"$3##D4."a2.$D5/"b5."E6."b61#F7-#c8/"#5$&c9-"$:#"d:*"G9-$e;'"$;$#f<%"e=%"$=%#H<,$d>%"%?%"c?%"%@'"1@+"b@%"&A7"aA%"'B7"I?+%`B&"'C8"_C&"(D7")E6"^D'#+F4"JC*%]F("-G*":G%"\G)"\H(";H$$JG)%[I)#<K#"ZK*"ZL+"JK($JN'#YM,%IP'#IR&#YQ-$HT&#YT.#1V)"HV%"YV/"/W,"ZW."-X/"GW%#ZX/",Y1"FY%"ZY0"+Z3"FZ$"[Z1"pZ$")[5"E[%"[[9"(\7"D\%"\\7"(]$".]3"B]&"]]5"'^$"0^7"^^2"1_5"^_1"1`4"_`/"2a2"`a-"3b0"ab*"4c."bc("5d+"cd&"7e'"ee#"]=],
            },
            ["i"] = {
                advance = 26,
                top = 9,
                data = [=[.!%","("*#+#)%,%))+"**)"*+("*,'"+-$"*3#")4%"(5'"(6("'7*"&8,"&9."%:0"$;3##=$"(=-"#>#"(>,#(@+0)O**)X+$7Z#")[,"6[$")\0#*^."*_-"+`,",a*"-b)".c'"0d%"]=],
            },
            ["g"] = {
                advance = 45,
                top = 26,
                data = [=[6"#"5#%"5$&"4%("3&*"2'-"2(."0)2"/*5".+$"4+2"-,$"5,4",-%"6-3"*.&"7.2")/'"9//")0&":0."(1'"<1+"'2(">2)"&3)"&4("@3&#?5'"%5)#>6(">7'"=8(#<:)#<<*"$7*(;=+&$>+&;B,$%C+$%F,";E-#&G+"<G,"&H,#<H-#'J,"=J,"'K-"<K-"(L-":L/")M5")N2"*O/">M,$*P-"+Q)"+R'"+S%"?P+%,T#"@T*$@W)$([%"@Z(#'\'"?\("&])"?]'#&^*#>_&"'`*"=`&"<a&"(a*#;b&"*c*"9c&"+d2"-e."]=],
            },
            ["h"] = {
                advance = 43,
                top = 8,
                data = [=[8"("5#+"2$)"0%("#&#"/&("$'#"-')"$($",()"%)#"%*$"+))#&+#"*+*"&,-"'-,$=4#"<5$";6&":7'"88*"69-"(0+,5:/"(;=#(=,"8=."9>.":?-";@-"<A,"<B-"=C,#>E,%?I+"?J,'@P*'@V)"?W*#(>+=?Y)#(Z,#'\-"7\#"?[(#&]3"?]'"%^4">^("&_2">_'"'`0">`&")a-"=a'"+b*"=b&",c("<c&"-d&"<d%".e$";e%"/f#":f%"9g%"8h%"7i%"6j%"5k%"4l%"3m%"2n%"1o%"0p%"/q$".r$"-s$",t#"]=],
            },
            ["t"] = {
                advance = 30,
                top = 14,
                data = [=[9"""8##"7$#"6%$"5&$"4'$"3(%"2)%"1*&"0+&"/,'".-'",.)"+/*"*0*")1+"(2,"'37"%49"$5:"#6;""7;")8+>:T#")U-"9U$"(V/"8V$"&W5"&X4"(Y1"+Z."-[+".\)"/]("0^&"1_%"2`#"]=],
            },
            ["F"] = {
                advance = 73,
                top = 5,
                data = [=[:!."6"7"4#<"2$A"0%E"/&H"-'L",(O"+)R"**V"d*$"*+^"),/"A,F"(-,"E-A"'.+"H.<"'/)"K/8"&0)"M04"&1("I1#"O11"%2("H2$"Q2."%3'"G3%"S3*"F4%"T4("%4&#E5&"V5$"$6&#D6&#C8'"B9("A:*"A;+"@<,"@=-"^=""@>."]>%"@?/"\?'"$8%*@@0"[@)"%A$"@A1"ZA+"AB0"ZB,"%B%#AC1"YC."&D$"BD1"XD0"&E%"BE2"WE1"'F%"CF1"VF2"'G&"CG2"UG2"(H&"DHB")I&"DI5"ZI+"*J&"?J#"EJ3"\J(",K'"<K'"FK2"]K&"-L5"GL1"^L$"0M0"GM2"_M#"3N)"HN2"IO1"JP1#KR1",S%"+T*"LS0#,U+"MU/"/V*"MV0"0W*"NW/"0X+"OX.$0Y,&P[-$Q^,"/^-$.a."Q_+%Qc*#.b-&Pe*#.g,"Pg)"Oh*"/h+#Oi)"/j,"Nj)"0k+"Nk("1l*"Ml("1m+"Lm("2n*"Kn("4o*"Jo("5p,"Gp)"7q7"9r3"=s,"]=],
            },
            ["a"] = {
                advance = 44,
                top = 26,
                data = [=[6"""6#$"5$%"4%'"4&("3'+"2(-"1)/"0*2".+$"3+1"-,$"4,3",-%"5-3"+.%"6.2"*/&"8//")0&":0,"(1'";1+"'2("'3'"&4("%5)$$8*%#<+%#@,";2*0$A+#$C,$%F,"%G-#&I-";A+*II#"&J.":J-"HJ$"'K/"8K3"'L4";L0"(M2";M/")N/"*O-"<N-#+P+"=P+",Q(">Q)"-R&"?R("-S%"@S&".T""CT#"]=],
            },
            ["l"] = {
                advance = 26,
                top = 8,
                data = [=[8"'"5#*"3$'"1%'"#&#"0&'"#'$".'("$($"-(("%)#",))"&*#",*("&+$"++)"',-#(.,&)3+I:Z""([."9[#"'\0"8\#"&]4"%^5"(_1"+`-"-a*".b)"/c'"0d&"1e$"2f""]=],
            },
        }

        local pixelGeometry = {}
        local windowScale = MainFrame.Parent:FindFirstChildOfClass("UIScale")
        local function snapGeometry(frame, geometry)
            local scale = windowScale and windowScale.Scale or 1
            local x, y, w, h = table.unpack(geometry)
            local left, top = math.floor(x * scale), math.floor(y * scale)
            local right, bottom = math.ceil((x + w) * scale), math.ceil((y + h) * scale)
            frame.Position = UDim2.fromOffset(left / scale, top / scale)

            frame.Size = UDim2.fromOffset(
                (math.max(1, right - left) + 0.65) / scale,
                (math.max(1, bottom - top) + 0.65) / scale
            )
        end
        local function solid(parent, x, y, w, h, color, z, transparency)
            local frame = Instance.new("Frame")
            frame.BorderSizePixel = 0
            frame.Position = UDim2.fromOffset(x, y)
            frame.Size = UDim2.fromOffset(w, h)
            frame.BackgroundColor3 = color
            frame.BackgroundTransparency = transparency or 0
            frame.ZIndex = z or parent.ZIndex
            frame.Parent = parent
            local geometry = {
                x,
                y,
                w,
                h,
            }
            pixelGeometry[frame] = geometry
            snapGeometry(frame, geometry)
            return frame
        end
        if windowScale then
            local revision = 0
            connect(windowScale:GetPropertyChangedSignal("Scale"), function()
                revision = revision + 1
                local current = revision
                task.delay(0.18, function()
                    if current ~= revision or not ScreenGui.Parent then
                        return
                    end

                    local count = 0
                    for frame, geometry in pairs(pixelGeometry) do
                        if current ~= revision or not ScreenGui.Parent then
                            return
                        end
                        if frame.Parent then
                            snapGeometry(frame, geometry)
                        end
                        count = count + 1
                        if count % 100 == 0 then
                            game:GetService("RunService").Heartbeat:Wait()
                        end
                    end
                end)
            end)
        end

        local function blackletter(parent, text, size, x, y)
            local group = Instance.new("Frame")
            group.Name = "BlackletterArtwork"
            group.BackgroundTransparency = 1
            group.Position = UDim2.fromOffset(x, y)
            group.Size = UDim2.fromOffset(440, 116)
            group.ZIndex = 8
            group.Parent = parent
            local scale, cursor = size / 96, 0
            for char in text:gmatch(".") do
                local glyph = glyphs[char]
                for i = 1, #glyph.data, 4 do
                    local a, b, c, d = glyph.data:byte(i, i + 3)
                    local top = b - 33 + glyph.top
                    local color = Color3.fromRGB(157, 102, 207)
                        :Lerp(Color3.fromRGB(98, 48, 151), math.clamp(top / 105, 0, 1))
                    solid(
                        group,
                        cursor + (a - 33) * scale,
                        top * scale,
                        (c - 33) * scale,
                        (d - 33) * scale,
                        color,
                        8
                    )
                end
                cursor = cursor + (glyph.advance + 1) * scale
            end
            return group
        end

        TitleLabel.Visible = false
        blackletter(TitleBar, "NightFall", 76, 200, 17)
        for _, child in ipairs(LogoBox:GetChildren()) do
            child:Destroy()
        end

        local moon = Color3.fromRGB(113, 52, 190)
        for y = 0, 123 do
            local dy = y - 62
            local outer = math.sqrt(math.max(0, 62 * 62 - dy * dy))
            local inner = math.sqrt(math.max(0, 59 * 59 - dy * dy))
            local left, right = 67 - outer, math.min(67 + outer, 92 - inner)
            if right > left then
                solid(LogoBox, left, y, right - left, 1, moon:Lerp(THEME.AccentPurp, (124 - y) / 260), 7)
            end
        end
        blackletter(LogoBox, "N", 106, 33, 2)
        local function star(parent, x, y, radius, color, z)
            for dy = -radius, radius do
                local half = math.max(0.4, radius * (1 - math.abs(dy) / radius) ^ 3 * 0.6)
                solid(parent, x - half, y + dy, half * 2, 1, color, z)
            end
        end
        star(LogoBox, 112, 24, 18, THEME.PrimaryPurp, 9)
        star(LogoBox, 24, 78, 11, THEME.PrimaryPurp, 9)
        star(LogoBox, 47, 103, 7, THEME.AccentPurp, 9)

        for _, child in ipairs(StatusBadge:GetChildren()) do
            if child:IsA("ImageLabel") then
                child:Destroy()
            end
        end
        local roblox = Instance.new("Frame")
        roblox.Name = "RobloxLogo"
        roblox.Size = UDim2.fromOffset(25, 25)
        roblox.Position = UDim2.fromOffset(2, 9)
        roblox.BackgroundTransparency = 1
        roblox.Rotation = 15
        roblox.ZIndex = 8
        roblox.Parent = StatusBadge
        for _, r in ipairs({
            {
                0,
                0,
                25,
                8,
            },
            {
                0,
                17,
                25,
                8,
            },
            {
                0,
                8,
                8,
                9,
            },
            {
                17,
                8,
                8,
                9,
            },
        }) do
            local bar = Instance.new("Frame")
            bar.BorderSizePixel = 0
            bar.Position = UDim2.fromOffset(r[1], r[2])
            bar.Size = UDim2.fromOffset(r[3], r[4])
            bar.BackgroundColor3 = Color3.fromRGB(195, 185, 211)
            bar.ZIndex = 8
            bar.Parent = roblox
            local shade = Instance.new("UIGradient")
            shade.Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.new(1, 1, 1))
            shade.Rotation = 90
            shade.Parent = bar
        end
        for _, child in ipairs(roblox:GetChildren()) do
            child:Destroy()
        end
        for _, rect in ipairs({ { 0, 0, 25, 8 }, { 0, 17, 25, 8 }, { 0, 8, 8, 9 }, { 17, 8, 8, 9 } }) do
            local piece = Instance.new("Frame")
            piece.BorderSizePixel = 0
            piece.BackgroundColor3 = Color3.fromRGB(204, 197, 216)
            piece.Position = UDim2.fromOffset(rect[1], rect[2])
            piece.Size = UDim2.fromOffset(rect[3], rect[4])
            piece.ZIndex = 8
            piece.Parent = roblox
        end

        SubtitleLabel.Text = "D A R K N E S S  I S  T H E  I N T E R F A C E ."
        SubtitleLabel.TextSize = 13
        SubtitleLabel.Position = UDim2.fromOffset(206, 107)
        SubtitleLabel.TextSize = 14
        GameTitle.TextSize = 18
        GameVer.TextSize = 15
        FootVer.TextSize = 13
        FootLove.TextSize = 13
        ConsoleTitle.TextSize = 20
        BannerHeaderText.TextSize = 20
        SecText.TextSize = 18
        MiscSecText.TextSize = 18
        for _, row in ipairs({
            BannerHeaderRow,
            SectionTitle,
            MiscSectionTitle,
        }) do
            for _, child in ipairs(row:GetChildren()) do
                if child:IsA("ImageLabel") then
                    child.Size = UDim2.fromOffset(23, 23)
                    child.Position = UDim2.new(0, 0, 0.5, -11)
                elseif child:IsA("TextLabel") then
                    child.Position = UDim2.fromOffset(33, 0)
                    child.Size = UDim2.new(1, -33, 1, 0)
                end
            end
        end
        for _, child in ipairs(SidebarFooter:GetChildren()) do
            if child:IsA("ImageLabel") then
                child.Size = UDim2.fromOffset(25, 25)
                child.Position = UDim2.new(0.5, 0, 0, -7)
            end
        end
        MainStroke.Color = Color3.fromRGB(137, 83, 190)
        MainStroke.Thickness = 1.4
        MainStroke.Transparency = 0.18
        local strokeGradient = MainStroke:FindFirstChildOfClass("UIGradient")
        if strokeGradient then
            strokeGradient:Destroy()
        end

        PromptRow.Parent = ConsoleScroll
        PromptRow.LayoutOrder = 2147483647
        PromptRow.Size = UDim2.new(1, 0, 0, 25)
        ConsoleScroll.Size = UDim2.new(1, -24, 1, -72)
        PromptPrefix.TextSize = 16
        PromptInput.TextSize = 16
        ConsoleFooter.Text = "NightFall // v1.0.0"
        ConsoleFooter.TextColor3 = THEME.TextMuted
        solid(ConsoleFrame, 12, 443, 96, 1, THEME.PrimaryPurp, 7)
        solid(ConsoleFrame, 282, 443, 96, 1, THEME.PrimaryPurp, 7)

        WelcomeBox.Position = UDim2.fromOffset(8, 49)
        WelcomeBox.Size = UDim2.new(1, -16, 0, 102)
        BannerHeaderRow.Position = UDim2.fromOffset(10, 12)
        WelcomeTitle.TextSize = 19
        WelcomeTitle.Position = UDim2.fromOffset(18, 23)
        WelcomeSub.Position = UDim2.fromOffset(18, 54)
        HeroCard.BackgroundColor3 = Color3.fromRGB(10, 8, 16)
        HeroGrad.Enabled = false
        for _, card in ipairs(Grid:GetChildren()) do
            if card:IsA("Frame") then
                card.BackgroundColor3 = Color3.fromRGB(17, 13, 24)
                card.BackgroundTransparency = 0.12
            end
        end

        ArtContainer:ClearAllChildren()
        ArtContainer.Size = UDim2.new(0, 545, 1, 0)
        ArtContainer.AnchorPoint = Vector2.new(1, 0)
        ArtContainer.Position = UDim2.fromScale(1, 0)
        ArtContainer.ClipsDescendants = true
        local rng = Random.new(1047)
        local function ellipse(parent, x, y, w, h, color, alpha, z)
            local blob = solid(parent, x, y, w, h, color, z, alpha)
            local round = Instance.new("UICorner")
            round.CornerRadius = UDim.new(1, 0)
            round.Parent = blob
            return blob
        end
        local sky = solid(ArtContainer, 0, 0, 545, 164, Color3.new(1, 1, 1), 8)
        local skyColor = Instance.new("UIGradient")
        skyColor.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 8, 16)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(16, 10, 28)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(27, 14, 44)),
        })
        skyColor.Parent = sky
        for i = 1, 32 do
            local radius = 90 - i * 1.7
            ellipse(
                ArtContainer,
                437 - radius,
                57 - radius,
                radius * 2,
                radius * 2,
                Color3.fromRGB(108, 48, 179),
                0.994,
                9
            )
        end
        ellipse(ArtContainer, 407, 27, 60, 60, Color3.fromRGB(129, 79, 183), 0, 10)
        for i = 1, 95 do
            local angle, distance = rng:NextNumber(0, math.pi * 2), math.sqrt(rng:NextNumber()) * 26
            local radius = rng:NextNumber(1, math.min(7, 29 - distance))
            ellipse(
                ArtContainer,
                437 + math.cos(angle) * distance - radius,
                57 + math.sin(angle) * distance - radius,
                radius * 2,
                radius * 1.6,
                Color3.fromRGB(66, 36, 104),
                rng:NextNumber(0.55, 0.86),
                11
            )
        end
        for i = 1, 85 do
            local x, y = rng:NextNumber(235, 550), rng:NextNumber(0, 151)
            local cloud = ellipse(
                ArtContainer,
                x,
                y,
                rng:NextNumber(35, 145),
                rng:NextNumber(3, 15),
                i % 3 == 0 and Color3.fromRGB(94, 49, 137) or Color3.fromRGB(16, 10, 29),
                rng:NextNumber(0.94, 0.98),
                12
            )
            local fade = Instance.new("UIGradient")
            fade.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(1, 1),
            })
            fade.Parent = cloud
        end
        for layer = 1, 3 do
            local height = 130
            for x = 240, 545, 3 do
                height = math.clamp(height + rng:NextNumber(-4, 4), 105, 150)
                local y = height + layer * 5 + math.sin(x / 29) * 6
                solid(
                    ArtContainer,
                    x,
                    y,
                    3,
                    170 - y,
                    ({
                        Color3.fromRGB(29, 16, 46),
                        Color3.fromRGB(16, 10, 25),
                        Color3.fromRGB(8, 6, 13),
                    })[layer],
                    12 + layer
                )
            end
        end
        local dark = Color3.fromRGB(7, 5, 12)
        for i = 1, 25 do
            local x, y = rng:NextNumber(245, 545), rng:NextNumber(133, 155)
            ellipse(ArtContainer, x, y, rng:NextNumber(9, 30), rng:NextNumber(7, 18), dark, 0, 16)
        end
        local tower = Instance.new("Frame")
        tower.Size = UDim2.fromOffset(90, 116)
        tower.Position = UDim2.fromOffset(450, 48)
        tower.BackgroundTransparency = 1
        tower.ZIndex = 17
        tower.Parent = ArtContainer
        solid(tower, 30, 45, 29, 75, dark, 17)
        solid(tower, 24, 25, 40, 30, dark, 17)
        for y = 0, 11 do
            solid(tower, 45 - y * 3, 13 + y, y * 6 + 1, 1, dark, 18)
        end
        solid(tower, 45, 0, 1, 18, dark, 18)
        solid(tower, 18, 52, 52, 3, dark, 18)
        solid(tower, 14, 42, 57, 2, dark, 18)
        for x = 17, 69, 9 do
            solid(tower, x, 42, 1, 12, dark, 18)
        end
        for _, x in ipairs({
            29,
            43,
            55,
        }) do
            solid(tower, x, 29, 7, 9, Color3.fromRGB(35, 23, 48), 19)
            solid(tower, x, 33, 7, 1, dark, 20)
        end
        solid(tower, 48, 60, 9, 16, Color3.fromRGB(16, 10, 24), 19)

        local scrim = solid(ArtContainer, 0, 0, 545, 164, THEME.BgMain, 21)
        local fade = Instance.new("UIGradient")
        fade.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.40, 0.05),
            NumberSequenceKeypoint.new(0.65, 0.85),
            NumberSequenceKeypoint.new(1, 1),
        })
        fade.Parent = scrim

        local ornament = Instance.new("Frame")
        ornament.Name = "HeaderOrnament"
        ornament.Size = UDim2.fromScale(1, 1)
        ornament.BackgroundTransparency = 1
        ornament.ClipsDescendants = true
        ornament.ZIndex = 6
        ornament.Parent = TitleBar
        local function branch(x, y, angle, length, depth)
            if depth == 0 then
                return
            end
            local dx, dy = math.cos(angle) * length, math.sin(angle) * length
            local vein = solid(ornament, x + dx / 2, y + dy / 2, length, 0.65, THEME.PrimaryPurp, 6, 0.87)
            vein.AnchorPoint = Vector2.new(0.5, 0.5)
            vein.Rotation = math.deg(angle)
            branch(x + dx, y + dy, angle + rng:NextNumber(-0.65, 0.65), length * 0.7, depth - 1)
            if depth > 2 then
                branch(x + dx, y + dy, angle + rng:NextNumber(0.6, 1.2), length * 0.5, depth - 2)
            end
        end
        branch(817, 85, -0.2, 75, 6)
        branch(817, 85, -2.4, 70, 6)
        branch(817, 85, 2.8, 65, 6)
        branch(42, 0, 1.1, 35, 6)
    end

    do
        PromptRow:Destroy()
        TrashBtn:Destroy()
        ConsoleTitle.Text = "Changelogs"
        ConsoleTitle.Size = UDim2.new(1, -95, 1, 0)
        ConsoleIcon.Text = ""
        createVectorIcon(
            ConsoleHeader,
            ICONS.Package,
            UDim2.fromOffset(23, 23),
            THEME.AccentPurp,
            UDim2.fromOffset(15, 12)
        )
        ConsoleFrame.Name = "ChangelogsPanel"
        ConsoleScroll.Name = "ReleaseHistory"
        ConsoleLayout.Padding = UDim.new(0, 8)

        local CollapseBtn = Instance.new("TextButton")
        CollapseBtn.Name = "CollapseChangelogsBtn"
        CollapseBtn.Size = UDim2.fromOffset(28, 28)
        CollapseBtn.Position = UDim2.new(1, -38, 0.5, -14)
        CollapseBtn.BackgroundColor3 = Color3.fromRGB(20, 14, 30)
        CollapseBtn.BackgroundTransparency = 0.2
        CollapseBtn.Text = ""
        CollapseBtn.AutoButtonColor = false
        CollapseBtn.ZIndex = 8
        CollapseBtn.Parent = ConsoleHeader

        local collapseCorner = Instance.new("UICorner")
        collapseCorner.CornerRadius = UDim.new(0, 6)
        collapseCorner.Parent = CollapseBtn

        local collapseStroke = Instance.new("UIStroke")
        collapseStroke.Thickness = 1
        collapseStroke.Color = THEME.Border
        collapseStroke.Transparency = 0.3
        collapseStroke.Parent = CollapseBtn

        local collapseIcon = createVectorIcon(
            CollapseBtn,
            ICONS.ChevronRight,
            UDim2.fromOffset(14, 14),
            THEME.TextMuted,
            UDim2.fromScale(0.5, 0.5),
            Vector2.new(0.5, 0.5)
        )

        CollapseBtn.MouseEnter:Connect(function()
            TweenService:Create(CollapseBtn, TweenInfo.new(0.18), {
                BackgroundColor3 = Color3.fromRGB(36, 22, 54),
            }):Play()
            TweenService:Create(collapseStroke, TweenInfo.new(0.18), {
                Color = THEME.AccentPurp,
            }):Play()
            TweenService:Create(collapseIcon, TweenInfo.new(0.18), {
                ImageColor3 = THEME.TextPrimary,
            }):Play()
        end)

        CollapseBtn.MouseLeave:Connect(function()
            TweenService:Create(CollapseBtn, TweenInfo.new(0.18), {
                BackgroundColor3 = Color3.fromRGB(20, 14, 30),
            }):Play()
            TweenService:Create(collapseStroke, TweenInfo.new(0.18), {
                Color = THEME.Border,
            }):Play()
            TweenService:Create(collapseIcon, TweenInfo.new(0.18), {
                ImageColor3 = THEME.TextMuted,
            }):Play()
        end)

        local ExpandBtn = Instance.new("TextButton")
        ExpandBtn.Name = "ExpandChangelogsBtn"
        ExpandBtn.Size = UDim2.fromOffset(128, 30)
        ExpandBtn.Position = UDim2.new(1, -428, 0, 94)
        ExpandBtn.BackgroundColor3 = Color3.fromRGB(22, 19, 29)
        ExpandBtn.BackgroundTransparency = 0.2
        ExpandBtn.Text = ""
        ExpandBtn.AutoButtonColor = false
        ExpandBtn.Visible = false
        ExpandBtn.ZIndex = 8
        ExpandBtn.Parent = TitleBar

        local expandCorner = Instance.new("UICorner")
        expandCorner.CornerRadius = UDim.new(0, 8)
        expandCorner.Parent = ExpandBtn

        local expandStroke = Instance.new("UIStroke")
        expandStroke.Thickness = 1
        expandStroke.Color = THEME.Border
        expandStroke.Transparency = 0.65
        expandStroke.Parent = ExpandBtn

        local expandChevron = createVectorIcon(
            ExpandBtn,
            ICONS.ChevronLeft,
            UDim2.fromOffset(12, 12),
            THEME.TextMuted,
            UDim2.new(0, 8, 0.5, -6)
        )

        local expandIcon = createVectorIcon(
            ExpandBtn,
            ICONS.Package,
            UDim2.fromOffset(16, 16),
            THEME.AccentPurp,
            UDim2.new(0, 24, 0.5, -8)
        )

        local expandLabel = Instance.new("TextLabel")
        expandLabel.Size = UDim2.new(1, -48, 1, 0)
        expandLabel.Position = UDim2.fromOffset(46, 0)
        expandLabel.BackgroundTransparency = 1
        expandLabel.Text = "Changelogs"
        expandLabel.Font = Enum.Font.GothamBold
        expandLabel.TextSize = 11
        expandLabel.TextColor3 = THEME.TextPrimary
        expandLabel.TextXAlignment = Enum.TextXAlignment.Left
        expandLabel.ZIndex = 9
        expandLabel.Parent = ExpandBtn

        ExpandBtn.MouseEnter:Connect(function()
            TweenService:Create(ExpandBtn, TweenInfo.new(0.18), {
                BackgroundColor3 = Color3.fromRGB(32, 27, 41),
            }):Play()
            TweenService:Create(expandStroke, TweenInfo.new(0.18), {
                Color = THEME.AccentPurp,
            }):Play()
            TweenService:Create(expandChevron, TweenInfo.new(0.18), {
                ImageColor3 = THEME.TextPrimary,
            }):Play()
        end)

        ExpandBtn.MouseLeave:Connect(function()
            TweenService:Create(ExpandBtn, TweenInfo.new(0.18), {
                BackgroundColor3 = Color3.fromRGB(20, 14, 30),
            }):Play()
            TweenService:Create(expandStroke, TweenInfo.new(0.18), {
                Color = THEME.Border,
            }):Play()
            TweenService:Create(expandChevron, TweenInfo.new(0.18), {
                ImageColor3 = THEME.TextMuted,
            }):Play()
        end)

        local contentResizeTween
        toggleChangelogs = function(collapsed)
            if collapsed == nil then
                collapsed = not isChangelogsCollapsed
            end
            if isChangelogsCollapsed == collapsed then
                return
            end
            isChangelogsCollapsed = collapsed

            if contentResizeTween then
                contentResizeTween:Cancel()
            end
            ConsoleFrame.Position = UDim2.new(1, -390, 0, 0)
            ConsoleFrame.Visible = not collapsed
            ExpandBtn.Visible = collapsed
            if changelogsDivider then
                changelogsDivider.Visible = not collapsed
            end
            contentResizeTween =
                TweenService:Create(ContentArea, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {
                    Size = collapsed and UDim2.new(1, -228, 1, 0) or UDim2.new(0, 550, 1, 0),
                })
            contentResizeTween:Play()
        end

        CollapseBtn.Activated:Connect(function()
            toggleChangelogs(true)
        end)
        ExpandBtn.Activated:Connect(function()
            toggleChangelogs(false)
        end)

        local smoke = Instance.new("Frame")
        smoke.Name = "OuterSmoke"
        smoke.BackgroundTransparency = 1
        smoke.ZIndex = 1
        smoke.Parent = MainFrame.Parent
        local smokeSeed = Random.new():NextInteger(1, 2147483646)
        smoke:SetAttribute("Seed", smokeSeed)
        local rng = Random.new(smokeSeed)
        for i = 1, 15 do
            local horizontal = i <= 10
            local x = horizontal and rng:NextNumber(0, 1200) or (i % 2 == 0 and -8 or 1190)
            local y = horizontal and (i % 2 == 0 and -9 or 622) or rng:NextNumber(0, 630)
            local radius = rng:NextNumber(55, 100)
            for layer = 1, 2 do
                local r = radius * (layer == 1 and 1 or 0.7)
                local puff = Instance.new("ImageLabel")
                puff.Name = "VioletSmokeWisp"
                puff.BackgroundTransparency = 1
                puff.Image = "rbxasset://textures/particles/smoke_main.dds"
                puff.ImageColor3 = layer == 1 and Color3.fromRGB(23, 13, 40) or Color3.fromRGB(92, 40, 142)
                puff.ImageTransparency = layer == 1 and 0.45 or 0.78
                puff.Rotation = rng:NextNumber(-180, 180)
                puff.AnchorPoint = Vector2.new(0.5, 0.5)
                puff.Position = UDim2.fromOffset(x, y)
                puff.Size = UDim2.fromOffset(r * 2, r * 1.5)
                puff.ZIndex = 1
                puff.Parent = smoke
            end
        end
        local function syncSmoke()
            smoke.Position = MainFrame.Position
            smoke.Size = MainFrame.Size
            smoke.Visible = MainFrame.Visible and not isMinimized and not smoke:GetAttribute("Disabled")
        end
        for _, property in ipairs({
            "Position",
            "Size",
            "Visible",
        }) do
            MainFrame:GetPropertyChangedSignal(property):Connect(syncSmoke)
        end
        syncSmoke()

        SidebarFooter.Size = UDim2.new(1, 0, 0, 110)
        SidebarFooter.Position = UDim2.new(0, 0, 1, -110)
        FootLove.Position = UDim2.fromOffset(0, 58)
        FootLove.Size = UDim2.new(1, 0, 0, 44)
        FootLove.Text = "Entervalov · developer\ndeflise · designer"
        FootLove.TextSize = 13
        FootLove.TextColor3 = THEME.TextMuted
        FootLove.TextWrapped = false

        local canvas = MainFrame.Parent
        local uiScale = canvas:FindFirstChildOfClass("UIScale")

        local fontSizes = {}
        for _, item in ipairs(MainFrame:GetDescendants()) do
            if item:IsA("TextLabel") or item:IsA("TextButton") or item:IsA("TextBox") then
                fontSizes[item] = item.TextSize
            end
        end
        local fontRevision = 0
        local function sharpenText()
            for item, size in pairs(fontSizes) do
                if item.Parent then
                    item.TextSize = math.max(1, math.round(size * uiScale.Scale)) / uiScale.Scale
                else
                    fontSizes[item] = nil
                end
            end
        end
        MainFrame.DescendantAdded:Connect(function(item)
            if item:IsA("TextLabel") or item:IsA("TextButton") or item:IsA("TextBox") then
                fontSizes[item] = item.TextSize
                item.TextSize = math.max(1, math.round(item.TextSize * uiScale.Scale)) / uiScale.Scale
            end
        end)
        connect(uiScale:GetPropertyChangedSignal("Scale"), function()
            fontRevision = fontRevision + 1
            local revision = fontRevision
            task.delay(0.2, function()
                if revision == fontRevision and ScreenGui.Parent then
                    sharpenText()
                end
            end)
        end)
        sharpenText()
        local aligning = false
        local function alignWindow()
            if aligning then
                return
            end
            aligning = true
            local s = uiScale.Scale
            local pos = MainFrame.AbsolutePosition
            local dx, dy = math.floor(pos.X + 0.5) - pos.X, math.floor(pos.Y + 0.5) - pos.Y
            if math.abs(dx) > 0.01 or math.abs(dy) > 0.01 then
                MainFrame.Position = MainFrame.Position + UDim2.fromOffset(dx / s, dy / s)
            end
            aligning = false
        end

        alignWindow()

        local loading = Instance.new("Frame")
        loading.Name = "StartupWindow"
        loading.AnchorPoint = Vector2.new(0.5, 0.5)
        loading.Position = UDim2.fromScale(0.5, 0.5)
        loading.Size = UDim2.fromOffset(400, 180)
        loading.BackgroundColor3 = THEME.BgMain
        loading.BorderSizePixel = 0
        loading.ZIndex = 50
        loading.Parent = ScreenGui
        local round = Instance.new("UICorner")
        round.CornerRadius = UDim.new(0, 16)
        round.Parent = loading
        local stroke = Instance.new("UIStroke")
        stroke.Color = THEME.PrimaryPurp
        stroke.Transparency = 0.35
        stroke.Parent = loading
        local loaderScale = Instance.new("UIScale")
        loaderScale.Scale = 0.94
        loaderScale.Parent = loading
        local title = Instance.new("TextLabel")
        title.BackgroundTransparency = 1
        title.Position = UDim2.fromOffset(28, 25)
        title.Size = UDim2.new(1, -56, 0, 44)
        title.Text = "NightFall"
        title.Font = Enum.Font.Code
        title.TextSize = 32
        title.TextColor3 = THEME.AccentPurp
        title.ZIndex = 51
        title.Parent = loading
        local status = title:Clone()
        status.Position = UDim2.fromOffset(28, 81)
        status.Size = UDim2.new(1, -56, 0, 24)
        status.TextSize = 14
        status.TextColor3 = THEME.TextMuted
        status.Text = "Preparing the interface..."
        status.Parent = loading
        local track = Instance.new("Frame")
        track.Position = UDim2.fromOffset(30, 132)
        track.Size = UDim2.new(1, -60, 0, 4)
        track.BackgroundColor3 = THEME.Border
        track.BorderSizePixel = 0
        track.ZIndex = 51
        track.Parent = loading
        local fill = track:Clone()
        fill.Position = UDim2.fromOffset(0, 0)
        fill.Size = UDim2.fromScale(0, 1)
        fill.BackgroundColor3 = THEME.AccentPurp
        fill.ZIndex = 52
        fill.Parent = track
        MainFrame.Visible = false
        task.spawn(function()
            local started = os.clock()
            TweenService:Create(loaderScale, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
                Scale = 1,
            }):Play()
            TweenService:Create(fill, TweenInfo.new(0.4), {
                Size = UDim2.fromScale(0.45, 1),
            }):Play()
            local content = game:GetService("ContentProvider")
            pcall(function()
                content:PreloadAsync({
                    TitleLabel,
                    WelcomeTitle,
                    ConsoleTitle,
                    smoke,
                })
            end)
            if not ScreenGui.Parent then
                return
            end
            status.Text = "Finalizing NightFall..."
            local progress = TweenService:Create(fill, TweenInfo.new(0.45), {
                Size = UDim2.fromScale(1, 1),
            })
            progress:Play()
            progress.Completed:Wait()
            task.wait(math.max(0, 1.1 - (os.clock() - started)))
            if not ScreenGui.Parent then
                return
            end
            status.Text = "Ready"
            local close = TweenService:Create(loading, TweenInfo.new(0.2), {
                BackgroundTransparency = 1,
            })
            close:Play()
            for _, child in ipairs(loading:GetDescendants()) do
                if child:IsA("TextLabel") then
                    TweenService:Create(child, TweenInfo.new(0.2), {
                        TextTransparency = 1,
                    }):Play()
                end
            end
            close.Completed:Wait()
            loading:Destroy()
            if not ScreenGui.Parent then
                return
            end
            MainFrame.Visible = true
            local target = MainFrame.Position
            MainFrame.Position = target + UDim2.fromOffset(0, 12 / uiScale.Scale)
            TweenService
                :Create(MainFrame, TweenInfo.new(0.32, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Position = target,
                })
                :Play()
        end)
    end

    GameVer.Visible = false
    FootVer.Visible = false
    GameTitle.Text = options.GameTitle or "Prison Life"

    for _, child in ipairs(SidebarFooter:GetChildren()) do
        child:Destroy()
    end
    SidebarFooter.Size = UDim2.new(1, 0, 0, 96)
    SidebarFooter.Position = UDim2.new(0, 0, 1, -100)

    local creatorsCard = Instance.new("Frame")
    creatorsCard.Name = "CreatorsCard"
    creatorsCard.Size = UDim2.new(1, -20, 0, 84)
    creatorsCard.Position = UDim2.new(0, 10, 0, 6)
    creatorsCard.BackgroundColor3 = Color3.fromRGB(37, 26, 51)
    creatorsCard.BackgroundTransparency = 0.2
    creatorsCard.ZIndex = 8
    creatorsCard.Parent = SidebarFooter

    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 9)
    cardCorner.Parent = creatorsCard

    local cardStroke = Instance.new("UIStroke")
    cardStroke.Thickness = 1
    cardStroke.Color = Color3.fromRGB(48, 30, 68)
    cardStroke.Transparency = 0.3
    cardStroke.Parent = creatorsCard

    local cardGrad = Instance.new("UIGradient")
    cardGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(24, 15, 38)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 8, 20)),
    })
    cardGrad.Rotation = 45
    cardGrad.Parent = creatorsCard

    local cardLayout = Instance.new("UIListLayout")
    cardLayout.SortOrder = Enum.SortOrder.LayoutOrder
    cardLayout.Padding = UDim.new(0, 4)
    cardLayout.Parent = creatorsCard

    local cardPad = Instance.new("UIPadding")
    cardPad.PaddingLeft = UDim.new(0, 10)
    cardPad.PaddingRight = UDim.new(0, 10)
    cardPad.PaddingTop = UDim.new(0, 8)
    cardPad.PaddingBottom = UDim.new(0, 8)
    cardPad.Parent = creatorsCard

    local devRow = Instance.new("Frame")
    devRow.Size = UDim2.new(1, 0, 0, 30)
    devRow.BackgroundTransparency = 1
    devRow.LayoutOrder = 1
    devRow.ZIndex = 9
    devRow.Parent = creatorsCard

    local devBadge = Instance.new("Frame")
    devBadge.Size = UDim2.fromOffset(36, 18)
    devBadge.Position = UDim2.new(0, 0, 0.5, -9)
    devBadge.BackgroundColor3 = Color3.fromRGB(42, 20, 68)
    devBadge.ZIndex = 9
    devBadge.Parent = devRow

    local devBadgeCorner = Instance.new("UICorner")
    devBadgeCorner.CornerRadius = UDim.new(0, 4)
    devBadgeCorner.Parent = devBadge

    local devBadgeStroke = Instance.new("UIStroke")
    devBadgeStroke.Thickness = 1
    devBadgeStroke.Color = Color3.fromRGB(147, 69, 232)
    devBadgeStroke.Transparency = 0.3
    devBadgeStroke.Parent = devBadge

    local devBadgeText = Instance.new("TextLabel")
    devBadgeText.Size = UDim2.fromScale(1, 1)
    devBadgeText.BackgroundTransparency = 1
    devBadgeText.Text = "DEV"
    devBadgeText.Font = Enum.Font.GothamBold
    devBadgeText.TextSize = 9
    devBadgeText.TextColor3 = Color3.fromRGB(192, 132, 252)
    devBadgeText.ZIndex = 10
    devBadgeText.Parent = devBadge

    local devName = Instance.new("TextLabel")
    devName.Size = UDim2.new(1, -44, 0, 16)
    devName.Position = UDim2.new(0, 44, 0, 0)
    devName.BackgroundTransparency = 1
    devName.Text = "Entervalov"
    devName.Font = Enum.Font.GothamBold
    devName.TextSize = 15
    devName.TextColor3 = Color3.fromRGB(240, 230, 252)
    devName.TextXAlignment = Enum.TextXAlignment.Left
    devName.ZIndex = 10
    devName.Parent = devRow

    local devRole = Instance.new("TextLabel")
    devRole.Size = UDim2.new(1, -44, 0, 12)
    devRole.Position = UDim2.new(0, 44, 0, 16)
    devRole.BackgroundTransparency = 1
    devRole.Text = "lead developer"
    devRole.Font = Enum.Font.Gotham
    devRole.TextSize = 12
    devRole.TextColor3 = Color3.fromRGB(130, 112, 150)
    devRole.TextXAlignment = Enum.TextXAlignment.Left
    devRole.ZIndex = 10
    devRole.Parent = devRow

    local devDiv = Instance.new("Frame")
    devDiv.Size = UDim2.new(1, 0, 0, 1)
    devDiv.BackgroundColor3 = Color3.fromRGB(38, 24, 54)
    devDiv.BorderSizePixel = 0
    devDiv.LayoutOrder = 2
    devDiv.ZIndex = 9
    devDiv.Parent = creatorsCard

    local dsgRow = Instance.new("Frame")
    dsgRow.Size = UDim2.new(1, 0, 0, 30)
    dsgRow.BackgroundTransparency = 1
    dsgRow.LayoutOrder = 3
    dsgRow.ZIndex = 9
    dsgRow.Parent = creatorsCard

    local dsgBadge = Instance.new("Frame")
    dsgBadge.Size = UDim2.fromOffset(36, 18)
    dsgBadge.Position = UDim2.new(0, 0, 0.5, -9)
    dsgBadge.BackgroundColor3 = Color3.fromRGB(34, 18, 58)
    dsgBadge.ZIndex = 9
    dsgBadge.Parent = dsgRow

    local dsgBadgeCorner = Instance.new("UICorner")
    dsgBadgeCorner.CornerRadius = UDim.new(0, 4)
    dsgBadgeCorner.Parent = dsgBadge

    local dsgBadgeStroke = Instance.new("UIStroke")
    dsgBadgeStroke.Thickness = 1
    dsgBadgeStroke.Color = Color3.fromRGB(168, 85, 247)
    dsgBadgeStroke.Transparency = 0.4
    dsgBadgeStroke.Parent = dsgBadge

    local dsgBadgeText = Instance.new("TextLabel")
    dsgBadgeText.Size = UDim2.fromScale(1, 1)
    dsgBadgeText.BackgroundTransparency = 1
    dsgBadgeText.Text = "DSGN"
    dsgBadgeText.Font = Enum.Font.GothamBold
    dsgBadgeText.TextSize = 9
    dsgBadgeText.TextColor3 = Color3.fromRGB(216, 180, 254)
    dsgBadgeText.ZIndex = 10
    dsgBadgeText.Parent = dsgBadge

    local dsgName = Instance.new("TextLabel")
    dsgName.Size = UDim2.new(1, -44, 0, 16)
    dsgName.Position = UDim2.new(0, 44, 0, 0)
    dsgName.BackgroundTransparency = 1
    dsgName.Text = "deflise"
    dsgName.Font = Enum.Font.GothamBold
    dsgName.TextSize = 15
    dsgName.TextColor3 = Color3.fromRGB(240, 230, 252)
    dsgName.TextXAlignment = Enum.TextXAlignment.Left
    dsgName.ZIndex = 10
    dsgName.Parent = dsgRow

    local dsgRole = Instance.new("TextLabel")
    dsgRole.Size = UDim2.new(1, -44, 0, 12)
    dsgRole.Position = UDim2.new(0, 44, 0, 16)
    dsgRole.BackgroundTransparency = 1
    dsgRole.Text = "ui/ux design"
    dsgRole.Font = Enum.Font.Gotham
    dsgRole.TextSize = 12
    dsgRole.TextColor3 = Color3.fromRGB(130, 112, 150)
    dsgRole.TextXAlignment = Enum.TextXAlignment.Left
    dsgRole.ZIndex = 10
    dsgRole.Parent = dsgRow

    creatorsCard.MouseEnter:Connect(function()
        TweenService:Create(cardStroke, TweenInfo.new(0.2), {
            Color = THEME.AccentPurp,
        }):Play()
        TweenService:Create(creatorsCard, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(22, 14, 34),
        }):Play()
    end)
    creatorsCard.MouseLeave:Connect(function()
        TweenService:Create(cardStroke, TweenInfo.new(0.2), {
            Color = Color3.fromRGB(48, 30, 68),
        }):Play()
        TweenService:Create(creatorsCard, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(15, 10, 24),
        }):Play()
    end)

    SectionTitle:Destroy()
    Grid:Destroy()
    MiscSectionTitle:Destroy()
    MiscCard:Destroy()
    for _, name in ipairs({
        "Player",
        "Visuals",
        "Settings",
        "Changelogs",
    }) do
        if tabs[name] then
            if tabs[name].Button then
                tabs[name].Button:Destroy()
            end
            if tabs[name].Page then
                tabs[name].Page:Destroy()
            end
            tabs[name] = nil
        end
    end

    local window = {}
    do
        local bubble = Instance.new("TextButton")
        bubble.Name = "NightFallOrb"
        bubble.Size = UDim2.fromOffset(64, 64)
        bubble.Position = UDim2.new(0, 24, 0.5, -32)
        bubble.BackgroundColor3 = Color3.fromRGB(15, 11, 23)
        bubble.Text = ""
        bubble.Visible = false
        bubble.AutoButtonColor = false
        bubble.ZIndex = 80
        bubble.Parent = ScreenGui
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(1, 0)
        corner.Parent = bubble
        local border = Instance.new("UIStroke")
        border.Color = THEME.AccentPurp
        border.Transparency = 0.35
        border.Parent = bubble
        local emblem = LogoBox:Clone()
        emblem.Position = UDim2.fromOffset(4, 3)
        emblem.Parent = bubble
        local emblemScale = Instance.new("UIScale")
        emblemScale.Scale = 0.43
        emblemScale.Parent = emblem
        local busy = false
        local storedPosition
        local transition = Instance.new("Frame")
        transition.Name = "WindowTransition"
        transition.BackgroundColor3 = THEME.BgMain
        transition.BackgroundTransparency = 0.15
        transition.BorderSizePixel = 0
        transition.Visible = false
        transition.ZIndex = 79
        transition.Parent = ScreenGui
        local transitionCorner = Instance.new("UICorner")
        transitionCorner.CornerRadius = UDim.new(0, 16)
        transitionCorner.Parent = transition
        local transitionBorder = Instance.new("UIStroke")
        transitionBorder.Color = THEME.AccentPurp
        transitionBorder.Transparency = 0.5
        transitionBorder.Parent = transition
        local storedBoundsPos, storedBoundsSize
        local function bounds()
            local inset = ScreenGui.IgnoreGuiInset and Vector2.zero or game:GetService("GuiService"):GetGuiInset()
            return MainFrame.AbsolutePosition - inset, MainFrame.AbsoluteSize
        end
        local function quietDecor()
            for _, child in ipairs(MainFrame.Parent:GetChildren()) do
                if child:IsA("GuiObject") and child ~= MainFrame and child ~= transition then
                    child.Visible = false
                end
            end
        end
        local function restoreDecor()
            for _, child in ipairs(MainFrame.Parent:GetChildren()) do
                if child:IsA("GuiObject") and child ~= MainFrame and child ~= transition then
                    child.Visible = true
                end
            end
        end
        local dragged = false
        local press, bubbleStart, tracking
        bubble.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                press = input.Position
                bubbleStart = bubble.Position
                tracking = input
                dragged = false
            end
        end)
        connect(UserInputService.InputChanged, function(input)
            if not tracking or busy then return end
            if input.UserInputType ~= Enum.UserInputType.MouseMovement and input ~= tracking then return end
            local delta = input.Position - press
            if math.abs(delta.X) + math.abs(delta.Y) > 5 then dragged = true end
            if dragged then
                local viewport = workspace.CurrentCamera.ViewportSize
                local x = bubbleStart.X.Scale * viewport.X + bubbleStart.X.Offset + delta.X
                local y = bubbleStart.Y.Scale * viewport.Y + bubbleStart.Y.Offset + delta.Y
                bubble.Position = UDim2.fromOffset(math.clamp(x, 8, viewport.X - 72), math.clamp(y, 8, viewport.Y - 100))
            end
        end)
        connect(UserInputService.InputEnded, function(input)
            if input == tracking or input.UserInputType == Enum.UserInputType.MouseButton1 then tracking = nil end
        end)
        local function orbPosition()
            local canvas = MainFrame.Parent
            local s = canvas:FindFirstChildOfClass("UIScale").Scale
            local p = bubble.AbsolutePosition + Vector2.new(32, 32)
            local origin = canvas.AbsolutePosition
            return UDim2.fromOffset((p.X - origin.X) / s - 30, (p.Y - origin.Y) / s - 16)
        end
        minimizeWindow = function()
            if busy or isMinimized then
                return
            end
            busy = true
            storedPosition = MainFrame.Position
            storedBoundsPos, storedBoundsSize = bounds()
            transition.Position = UDim2.fromOffset(storedBoundsPos.X, storedBoundsPos.Y)
            transition.Size = UDim2.fromOffset(storedBoundsSize.X, storedBoundsSize.Y)
            transition.Visible = true
            isMinimized = true
            MainFrame.Visible = false
            quietDecor()
            local tween = TweenService:Create(transition, TweenInfo.new(0.32, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {
                Position = bubble.Position,
                Size = UDim2.fromOffset(64, 64),
            })
            tween:Play()
            tween.Completed:Once(function()
                if not ScreenGui.Parent then
                    return
                end
                transition.Visible = false
                MainFrame.Position = storedPosition
                bubble.Size = UDim2.fromOffset(48, 48)
                bubble.Visible = true
                TweenService:Create(bubble, TweenInfo.new(0.25, Enum.EasingStyle.Back), {
                    Size = UDim2.fromOffset(64, 64),
                }):Play()
                busy = false
            end)
        end
        bubble.Activated:Connect(function()
            if busy or dragged then
                dragged = false
                return
            end
            busy = true
            bubble.Visible = false
            transition.Position = bubble.Position
            transition.Size = UDim2.fromOffset(64, 64)
            transition.Visible = true
            local targetPos = storedBoundsPos
            local targetSize = storedBoundsSize
            if not targetPos or not targetSize then
                targetPos, targetSize = bounds()
            end
            local tween = TweenService:Create(
                transition,
                TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                {
                    Position = UDim2.fromOffset(targetPos.X, targetPos.Y),
                    Size = UDim2.fromOffset(targetSize.X, targetSize.Y),
                }
            )
            tween:Play()
            tween.Completed:Once(function()
                if not ScreenGui.Parent then return end
                transition.Visible = false
                isMinimized = false
                MainFrame.Visible = true
                restoreDecor()
                busy = false
            end)
        end)
    end
    NavContainer.ScrollBarThickness = 3
    NavContainer.ScrollBarImageColor3 = Color3.fromRGB(75, 63, 91)
    NavContainer.ScrollBarImageTransparency = 0.35
    local navPadding = Instance.new("UIPadding")
    navPadding.PaddingRight = UDim.new(0, 8)
    navPadding.PaddingLeft = UDim.new(0, 3)
    navPadding.PaddingTop = UDim.new(0, 3)
    navPadding.PaddingBottom = UDim.new(0, 8)
    navPadding.Parent = NavContainer
    local aliases = {
        skull = ICONS.Skull,
        user = ICONS.User,
        move = ICONS.Speed,
        crosshair = ICONS.Target,
        target = ICONS.Target,
        sword = ICONS.Weapon,
        weapon = ICONS.Weapon,
        map = ICONS.Map,
        eye = ICONS.Eye,
        ["map-pin"] = ICONS.Map,
        sun = ICONS.Sun,
        layers = ICONS.Layers,
        palette = ICONS.Palette,
        heart = ICONS.Heart,
        box = ICONS.Box,
        globe = ICONS.Package,
        package = ICONS.Package,
        configs = ICONS.Package,
        config = ICONS.Package,
        settings = ICONS.Settings,
        shield = ICONS.Shield,
        trash = ICONS.Trash,
        home = ICONS.Home,
        moon = ICONS.Moon,
        keyboard = ICONS.Keyboard,
        keybinds = ICONS.Keyboard,
        keybind = ICONS.Keyboard,
        binds = ICONS.Keyboard,
    }

    local function callback(fn, ...)
        if not fn then
            return
        end
        local success, message = pcall(fn, ...)
        if not success then
            warn("NightFall callback: " .. tostring(message))
        end
    end

    local function text(parent, value, size)
        local label = Instance.new("TextLabel")
        label.BackgroundTransparency = 1
        label.Size = UDim2.new(1, -24, 0, size + 8)
        label.Position = UDim2.fromOffset(12, 8)
        label.Text = value or ""
        label.TextSize = size
        label.Font = Enum.Font.Code
        label.TextColor3 = THEME.TextPrimary
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.ZIndex = 9
        label.Parent = parent
        return label
    end

    local function card(parent, config, height)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, height or 76)
        frame.BackgroundColor3 = THEME.BgPanel
        frame.ZIndex = 8
        frame.Parent = parent
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 9)
        corner.Parent = frame
        local stroke = Instance.new("UIStroke")
        stroke.Color = THEME.Border
        stroke.Transparency = 0.5
        stroke.Parent = frame
        local title = text(frame, config.Title, 17)
        if config.Desc then
            local desc = text(frame, config.Desc, 12)
            desc.Position = UDim2.fromOffset(12, 34)
            desc.Size = UDim2.new(1, -24, 0, 30)
            desc.TextWrapped = true
            desc.TextColor3 = THEME.TextMuted
        end
        return frame, title
    end

    local function choose(data)
        for _, tab in pairs(tabs) do
            tab.Page.Visible = tab == data
            tab.Button.BackgroundTransparency = tab == data and 0.78 or 1
            tab.Label.TextColor3 = tab == data and THEME.TextPrimary or THEME.TextMuted
            tab.Icon.ImageColor3 = tab == data and THEME.AccentPurp or THEME.TextMuted
            tab.ActiveBar.BackgroundTransparency = tab == data and 0 or 1
        end
        activeTab = data
    end

    function window:Tab(config)
        local name = config.Title or "Tab"
        local page = tabs[name] and tabs[name].Page or createTab(name, aliases[config.Icon] or ICONS.Package)
        local tab = {}
        local sectionBody = page
        local functionGroup
        local groups = {}
        local function settingsParent(config)
            local owner = config.Parent and groups[config.Parent]
            if not owner then
                return sectionBody
            end
            if owner.Settings then
                return owner.Settings
            end
            local indent = Instance.new("Frame")
            indent.Name = "FunctionSettings"
            indent.Size = UDim2.new(1, 0, 0, 0)
            indent.AutomaticSize = Enum.AutomaticSize.Y
            indent.BackgroundTransparency = 0.1
            indent.BackgroundColor3 = Color3.fromRGB(23, 19, 32)
            indent.Visible = false
            indent.ZIndex = 8
            indent.Parent = sectionBody
            local padding = Instance.new("UIPadding")
            padding.PaddingLeft = UDim.new(0, 12)
            padding.PaddingRight = UDim.new(0, 12)
            padding.PaddingTop = UDim.new(0, 12)
            padding.PaddingBottom = UDim.new(0, 12)
            padding.Parent = indent
            local list = Instance.new("UIListLayout")
            list.Padding = UDim.new(0, 6)
            list.SortOrder = Enum.SortOrder.LayoutOrder
            list.Parent = indent
            local number = 0
            indent.ChildAdded:Connect(function(child)
                if child:IsA("GuiObject") then
                    number = number + 1
                    child.LayoutOrder = number
                end
            end)
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = indent
            local border = Instance.new("UIStroke")
            border.Color = Color3.fromRGB(65, 51, 82)
            border.Transparency = 0.4
            border.Parent = indent
            local hovered, pinned, revision = false, false, 0
            local function enter()
                hovered = true
                revision = revision + 1
                indent.Visible = true
            end
            local function leave()
                hovered = false
                revision = revision + 1
                local current = revision
                task.delay(0.3, function()
                    if current == revision and not hovered and not pinned and not UserInputService:GetFocusedTextBox() then
                        indent.Visible = false
                    end
                end)
            end
            owner.Frame.MouseEnter:Connect(enter)
            owner.Frame.MouseLeave:Connect(leave)
            indent.MouseEnter:Connect(enter)
            indent.MouseLeave:Connect(leave)
            local reveal = Instance.new("TextButton")
            reveal.Text = "···"
            reveal.TextSize = 22
            reveal.TextColor3 = THEME.TextMuted
            reveal.BackgroundTransparency = 1
            reveal.Size = UDim2.fromOffset(28, 28)
            reveal.Position = UDim2.new(1, -87, 0.5, -14)
            reveal.ZIndex = 12
            reveal.Parent = owner.Frame
            reveal.Activated:Connect(function()
                pinned = not pinned
                indent.Visible = pinned
            end)
            owner.Settings = indent
            return indent
        end
        local sectionCount = 0
        local elementOrder = #page:GetChildren()
        local function orderElement(child)
            if child:IsA("GuiObject") then
                elementOrder = elementOrder + 1
                child.LayoutOrder = elementOrder
            end
        end
        page.ChildAdded:Connect(orderElement)

        function tab:Select()
            choose(tabs[name])
        end

        function tab:Section(config)
            functionGroup = nil
            sectionCount = sectionCount + 1
            local group = Instance.new("Frame")
            group.Name = "Section_" .. (config.Title or sectionCount)
            group.Size = UDim2.new(1, -4, 0, 0)
            group.AutomaticSize = Enum.AutomaticSize.Y
            group.BackgroundTransparency = 1
            group.ZIndex = 8
            group.Parent = page
            local groupList = Instance.new("UIListLayout")
            groupList.SortOrder = Enum.SortOrder.LayoutOrder
            groupList.Padding = UDim.new(0, 8)
            groupList.Parent = group
            local header = Instance.new("TextButton")
            header.Size = UDim2.new(1, 0, 0, 44)
            header.Text = ""
            header.AutoButtonColor = false
            header.BackgroundColor3 = Color3.fromRGB(20, 17, 28)
            header.ZIndex = 8
            header.LayoutOrder = 0
            header.Parent = group
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 6)
            corner.Parent = header
            local heading = text(header, config.Title, 17)
            heading.Position = UDim2.fromOffset(14, 9)
            heading.Size = UDim2.new(1, -54, 0, 26)
            local mark = text(header, "−", 20)
            mark.Position = UDim2.new(1, -35, 0, 7)
            mark.Size = UDim2.fromOffset(24, 28)
            mark.TextColor3 = THEME.TextMuted
            local line = Instance.new("Frame")
            line.Size = UDim2.new(1, -28, 0, 1)
            line.Position = UDim2.new(0, 14, 1, -1)
            line.BackgroundColor3 = THEME.Border
            line.ZIndex = 9
            line.Parent = header
            local content = Instance.new("Frame")
            content.Name = "SectionContent"
            content.Size = UDim2.new(1, 0, 0, 0)
            content.AutomaticSize = Enum.AutomaticSize.Y
            content.BackgroundTransparency = 1
            content.ZIndex = 8
            content.LayoutOrder = 1
            content.Parent = group
            local layout = Instance.new("UIListLayout")
            layout.SortOrder = Enum.SortOrder.LayoutOrder
            layout.Padding = UDim.new(0, 8)
            layout.Parent = content
            local order = 0
            content.ChildAdded:Connect(function(child)
                if child:IsA("GuiObject") then
                    order = order + 1
                    child.LayoutOrder = order
                end
            end)
            content.Visible = config.Collapsed == false or (config.Collapsed == nil and sectionCount <= 2)
            mark.Text = content.Visible and "−" or "+"
            header.Activated:Connect(function()
                content.Visible = not content.Visible
                mark.Text = content.Visible and "−" or "+"
            end)
            sectionBody = content
            return tab
        end

        local function getToggleIcon(title, iconArg)
            if iconArg and aliases[iconArg] then
                return aliases[iconArg]
            end
            if iconArg and ICONS[iconArg] then
                return ICONS[iconArg]
            end
            local t = (title or ""):lower()
            local exact = {
                ["quickrespawn"] = ICONS.Respawn,
                ["returnondeath"] = ICONS.Return,
                ["autocriminal"] = ICONS.Criminal,
                ["feinvisible"] = ICONS.Ghost,
                ["invisible"] = ICONS.Ghost,
                ["noclip"] = ICONS.Noclip,
                ["consecutiveboost"] = ICONS.Boost,
                ["preservemomentum"] = ICONS.Momentum,
                ["bhop"] = ICONS.Bhop,
                ["autohop"] = ICONS.Bhop,
                ["autosprint"] = ICONS.Sprint,
                ["antijump"] = ICONS.AntiJump,
                ["infjump"] = ICONS.InfJump,
                ["hitbox"] = ICONS.Hitbox,
                ["hitboxexpander"] = ICONS.Hitbox,
                ["antiinvis"] = ICONS.Reveal,
                ["tasebypass"] = ICONS.Taser,
                ["antifling"] = ICONS.Anchor,
                ["spinbot"] = ICONS.Spin,
                ["autokilltarget"] = ICONS.Hunt,
                ["customweaponvisual"] = ICONS.WeaponStyle,
                ["customweaponvisuals"] = ICONS.WeaponStyle,
            }
            local normalized = t:gsub("[^%w]", "")
            if exact[normalized] then
                return exact[normalized]
            end
            if t:find("color") then
                return ICONS.Palette
            end
            if t:find("highlight") or t:find("chams") then
                return ICONS.Layers
            end
            if t:find("bright") or t:find("light") then
                return ICONS.Sun
            end
            if t:find("hitbox") then
                return ICONS.Box
            end
            if t:find("damage") then
                return ICONS.Cross
            end
            if t:find("jump") or t:find("hop") or t:find("gravity") then
                return ICONS.Arrow
            end
            if t:find("respawn") or t:find("death") or t:find("revive") or t:find("heal") then
                return ICONS.Heart
            elseif
                t:find("speed")
                or t:find("sprint")
                or t:find("fast")
                or t:find("bhop")
                or t:find("walk")
            then
                return ICONS.Speed
            elseif
                t:find("aim")
                or t:find("target")
                or t:find("kill")
                or t:find("combat")
                or t:find("silent")
            then
                return ICONS.Target
            elseif
                t:find("esp")
                or t:find("visual")
                or t:find("wall")
                or t:find("tracer")
                or t:find("chams")
                or t:find("see")
            then
                return ICONS.Eye
            elseif t:find("noclip") or t:find("fly") or t:find("invis") or t:find("player") then
                return ICONS.User
            elseif
                t:find("tase")
                or t:find("shield")
                or t:find("god")
                or t:find("anti")
                or t:find("safe")
            then
                return ICONS.Shield
            elseif
                t:find("gun")
                or t:find("weapon")
                or t:find("fire")
                or t:find("ammo")
                or t:find("shoot")
            then
                return ICONS.Electricity
            elseif t:find("setting") or t:find("config") then
                return ICONS.Settings
            elseif t:find("night") or t:find("moon") or t:find("dark") then
                return ICONS.Moon
            end
            return ICONS.Package
        end

        function tab:Toggle(config)
            functionGroup = {}
            local iconChoice = getToggleIcon(config.Title, config.Icon)
            local control = createToggleCard(
                sectionBody,
                config.Title,
                config.Desc or "",
                iconChoice,
                config.Value == true,
                function(value)
                    callback(config.Callback, value)
                end
            )
            control.Frame.Size = UDim2.new(1, 0, 0, 64)
            groups[config.Title] = control
            for _, child in ipairs(control.Frame:GetChildren()) do
                if child:IsA("TextLabel") then
                    child.Size = UDim2.new(1, -122, 0, 22)
                    child.TextWrapped = true
                end
            end
            function control:Destroy()
                self.Frame:Destroy()
            end
            return control
        end

        function tab:Slider(config)
            local range = config.Value or {}
            local minimum = tonumber(range.Min) or 0
            local maximum = math.max(minimum + 0.000001, tonumber(range.Max) or 100)
            local frame = card(settingsParent(config), config, config.Desc and 112 or 82)
            local holder = Instance.new("Frame")
            holder.BackgroundTransparency = 1
            holder.Size = UDim2.new(1, 0, 0, 34)
            holder.Position = UDim2.new(0, 0, 1, -40)
            holder.ZIndex = 8
            holder.Parent = frame
            return createSlider(
                holder,
                "",
                minimum,
                maximum,
                math.clamp(tonumber(range.Default) or minimum, minimum, maximum),
                function(value)
                    callback(config.Callback, value)
                end,
                config.Step
            )
        end

        function tab:Button(config)
            local hasDesc = config.Desc and config.Desc ~= ""
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 0, hasDesc and 64 or 50)
            frame.BackgroundColor3 = THEME.BgPanel
            frame.BackgroundTransparency = 0.25
            frame.ZIndex = 8
            frame.Parent = sectionBody

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = frame

            local stroke = Instance.new("UIStroke")
            stroke.Color = THEME.Border
            stroke.Transparency = 0.4
            stroke.Thickness = 1
            stroke.Parent = frame

            local iconId = config.Icon and (aliases[config.Icon] or ICONS[config.Icon])
            if not iconId then
                local tLow = (config.Title or ""):lower()
                if
                    tLow:find("teleport")
                    or tLow:find("📍")
                    or tLow:find("base")
                    or tLow:find("yard")
                    or tLow:find("prison")
                    or tLow:find("guard")
                then
                    iconId = ICONS.Pin
                elseif
                    tLow:find("weapon")
                    or tLow:find("gun")
                    or tLow:find("shotgun")
                    or tLow:find("ak")
                    or tLow:find("m4")
                    or tLow:find("🔫")
                then
                    iconId = ICONS.Weapon
                elseif tLow:find("notif") or tLow:find("test") then
                    iconId = ICONS.Terminal
                elseif tLow:find("unload") then
                    iconId = ICONS.Trash
                else
                    iconId = ICONS.Electricity
                end
            end

            local iconBox = Instance.new("Frame")
            iconBox.Size = UDim2.fromOffset(30, 30)
            iconBox.Position = UDim2.new(0, 10, 0.5, -15)
            iconBox.BackgroundColor3 = Color3.fromRGB(24, 16, 36)
            iconBox.BackgroundTransparency = 0.2
            iconBox.ZIndex = 9
            iconBox.Parent = frame

            local ibCorner = Instance.new("UICorner")
            ibCorner.CornerRadius = UDim.new(0, 7)
            ibCorner.Parent = iconBox

            local ibStroke = Instance.new("UIStroke")
            ibStroke.Color = Color3.fromRGB(54, 34, 76)
            ibStroke.Thickness = 1
            ibStroke.Parent = iconBox

            createVectorIcon(
                iconBox,
                iconId,
                UDim2.fromOffset(15, 15),
                THEME.AccentPurp,
                UDim2.fromScale(0.5, 0.5),
                Vector2.new(0.5, 0.5)
            )

            local titleLabel = Instance.new("TextLabel")
            titleLabel.Size = UDim2.new(1, -165, 0, 18)
            titleLabel.Position = UDim2.new(0, 48, hasDesc and 0 or 0.5, hasDesc and 12 or -9)
            titleLabel.BackgroundTransparency = 1
            titleLabel.Text = sanitizeRichText(config.Title or "Button")
            titleLabel.Font = Enum.Font.GothamBold
            titleLabel.TextSize = 13
            titleLabel.TextColor3 = THEME.TextPrimary
            titleLabel.TextXAlignment = Enum.TextXAlignment.Left
            titleLabel.TextWrapped = true
            titleLabel.ZIndex = 9
            titleLabel.Parent = frame

            if hasDesc then
                local descLabel = Instance.new("TextLabel")
                descLabel.Size = UDim2.new(1, -165, 0, 16)
                descLabel.Position = UDim2.new(0, 48, 0, 32)
                descLabel.BackgroundTransparency = 1
                descLabel.Text = sanitizeRichText(config.Desc)
                descLabel.Font = Enum.Font.Gotham
                descLabel.TextSize = 11
                descLabel.TextColor3 = THEME.TextMuted
                descLabel.TextXAlignment = Enum.TextXAlignment.Left
                descLabel.TextWrapped = true
                descLabel.ZIndex = 9
                descLabel.Parent = frame
            end

            local bText = config.ButtonText
            if not bText or bText == "" then
                local tLow = (config.Title or ""):lower()
                if
                    tLow:find("📍")
                    or tLow:find("teleport")
                    or tLow:find("base")
                    or tLow:find("yard")
                    or tLow:find("prison")
                    or tLow:find("guard")
                then
                    bText = "Teleport"
                elseif
                    tLow:find("🔫")
                    or tLow:find("grab")
                    or tLow:find("shotgun")
                    or tLow:find("ak")
                    or tLow:find("m4")
                    or tLow:find("weapon")
                then
                    bText = "Grab"
                else
                    bText = "Execute"
                end
            end

            local actionBtn = Instance.new("TextButton")
            actionBtn.Name = "ActionBtn"
            actionBtn.Size = UDim2.fromOffset(105, 30)
            actionBtn.Position = UDim2.new(1, -115, 0.5, -15)
            actionBtn.BackgroundColor3 = Color3.fromRGB(36, 29, 47)
            actionBtn.AutoButtonColor = false
            actionBtn.Text = bText
            actionBtn.Font = Enum.Font.GothamBold
            actionBtn.TextSize = 11
            actionBtn.TextColor3 = Color3.fromRGB(250, 245, 255)
            actionBtn.ZIndex = 10
            actionBtn.Parent = frame

            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 7)
            btnCorner.Parent = actionBtn

            local btnStroke = Instance.new("UIStroke")
            btnStroke.Color = Color3.fromRGB(73, 61, 89)
            btnStroke.Transparency = 0.3
            btnStroke.Thickness = 1
            btnStroke.Parent = actionBtn

            local btnGrad = Instance.new("UIGradient")
            btnGrad.Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(210, 205, 220))
            btnGrad.Rotation = 45
            btnGrad.Parent = actionBtn

            local clickCatcher = Instance.new("TextButton")
            clickCatcher.Name = "ClickCatcher"
            clickCatcher.Size = UDim2.fromScale(1, 1)
            clickCatcher.BackgroundTransparency = 1
            clickCatcher.Text = ""
            clickCatcher.AutoButtonColor = false
            clickCatcher.ZIndex = 11
            clickCatcher.Parent = frame

            local isDebounced = false
            local function trigger()
                if isDebounced then
                    return
                end
                isDebounced = true
                task.delay(0.2, function()
                    isDebounced = false
                end)

                TweenService:Create(actionBtn, TweenInfo.new(0.08), {
                    BackgroundColor3 = Color3.fromRGB(52, 42, 67),
                    Size = UDim2.fromOffset(101, 28),
                    Position = UDim2.new(1, -113, 0.5, -14),
                }):Play()
                TweenService:Create(frame, TweenInfo.new(0.08), {
                    BackgroundColor3 = Color3.fromRGB(24, 18, 38),
                }):Play()

                task.delay(0.1, function()
                    TweenService
                        :Create(actionBtn, TweenInfo.new(0.15), {
                            BackgroundColor3 = Color3.fromRGB(36, 29, 47),
                            Size = UDim2.fromOffset(105, 30),
                            Position = UDim2.new(1, -115, 0.5, -15),
                        })
                        :Play()
                    TweenService:Create(frame, TweenInfo.new(0.15), {
                        BackgroundColor3 = THEME.BgPanel,
                    }):Play()
                end)
                callback(config.Callback)
            end

            clickCatcher.MouseButton1Click:Connect(trigger)
            clickCatcher.Activated:Connect(trigger)
            actionBtn.MouseButton1Click:Connect(trigger)
            actionBtn.Activated:Connect(trigger)

            clickCatcher.MouseEnter:Connect(function()
                TweenService:Create(btnStroke, TweenInfo.new(0.18), {
                    Color = Color3.fromRGB(98, 85, 116),
                }):Play()
                TweenService:Create(actionBtn, TweenInfo.new(0.18), {
                    BackgroundColor3 = Color3.fromRGB(43, 35, 56),
                }):Play()
                TweenService:Create(stroke, TweenInfo.new(0.18), {
                    Color = THEME.Border,
                    Transparency = 0.3,
                }):Play()
            end)
            clickCatcher.MouseLeave:Connect(function()
                TweenService:Create(btnStroke, TweenInfo.new(0.18), {
                    Color = Color3.fromRGB(73, 61, 89),
                }):Play()
                TweenService:Create(actionBtn, TweenInfo.new(0.18), {
                    BackgroundColor3 = Color3.fromRGB(36, 29, 47),
                }):Play()
                TweenService:Create(stroke, TweenInfo.new(0.18), {
                    Color = THEME.Border,
                    Transparency = 0.4,
                }):Play()
            end)

            return {
                Frame = frame,
                Fire = trigger,
                Destroy = function()
                    frame:Destroy()
                end,
            }
        end

        function tab:Dropdown(config)
            local frame = card(settingsParent(config), config, config.Desc and 110 or 80)
            local baseHeight = frame.Size.Y.Offset
            local selected = config.Value
            local values = config.Values or {}
            local open = false
            local button = Instance.new("TextButton")
            button.Position = UDim2.fromOffset(12, baseHeight - 38)
            button.Size = UDim2.new(1, -24, 0, 30)
            button.BackgroundColor3 = THEME.BgInner
            button.TextColor3 = THEME.TextPrimary
            button.TextSize = 15
            button.ZIndex = 10
            button.Parent = frame
            local list = Instance.new("ScrollingFrame")
            list.Position = UDim2.fromOffset(12, baseHeight)
            list.Size = UDim2.new(1, -24, 0, math.min(150, #values * 30))
            list.BackgroundTransparency = 1
            list.AutomaticCanvasSize = Enum.AutomaticSize.Y
            list.CanvasSize = UDim2.new()
            list.ScrollBarThickness = 3
            list.Visible = false
            list.ZIndex = 10
            list.Parent = frame
            local layout = Instance.new("UIListLayout")
            layout.Parent = list
            local control = {}
            local function display()
                button.Text = type(selected) == "table" and table.concat(selected, ", ")
                    or tostring(selected or "Select...")
            end
            function control:Set(value)
                selected = value
                display()
                callback(config.Callback, selected)
            end
            function control:Get()
                return selected
            end
            function control:Refresh(items)
                values = items or {}
                list.Size = UDim2.new(1, -24, 0, math.min(150, #values * 30))
                frame.Size = UDim2.new(1, 0, 0, baseHeight + (open and math.min(150, #values * 30) + 8 or 0))
                for _, child in ipairs(list:GetChildren()) do
                    if child:IsA("TextButton") then
                        child:Destroy()
                    end
                end
                for _, value in ipairs(values) do
                    local option = button:Clone()
                    option.Position = UDim2.new()
                    option.Size = UDim2.new(1, -4, 0, 30)
                    option.Text = tostring(value)
                    option.Parent = list
                    option.Activated:Connect(function()
                        if config.Multi then
                            local nextValues = type(selected) == "table" and table.clone(selected) or {}
                            local index = table.find(nextValues, value)
                            if index then
                                table.remove(nextValues, index)
                            else
                                table.insert(nextValues, value)
                            end
                            control:Set(nextValues)
                        else
                            control:Set(value)
                            open = false
                            list.Visible = false
                            frame.Size = UDim2.new(1, 0, 0, baseHeight)
                        end
                    end)
                end
            end
            button.Activated:Connect(function()
                open = not open
                list.Visible = open
                frame.Size = UDim2.new(1, 0, 0, baseHeight + (open and math.min(150, #values * 30) + 8 or 0))
            end)
            control:Refresh(values)
            display()
            return control
        end

        function tab:Keybind(config)
            local value = config.Value or Enum.KeyCode.Unknown
            if type(value) == "string" then
                value = (value ~= "None" and Enum.KeyCode[value]) or Enum.KeyCode.Unknown
            end
            local waiting = false
            local frame = card(settingsParent(config), config, config.Desc and 78 or 48)
            local button = Instance.new("TextButton")
            button.Size = UDim2.fromOffset(94, 28)
            button.Position = UDim2.new(1, -106, 0, 8)
            button.BackgroundColor3 = THEME.BgInner
            button.TextColor3 = THEME.AccentPurp
            button.Text = (value == Enum.KeyCode.Unknown and "[ None ]") or value.Name
            button.TextSize = 13
            button.Font = Enum.Font.Code
            button.ZIndex = 10
            button.Parent = frame
            local bCorner = Instance.new("UICorner")
            bCorner.CornerRadius = UDim.new(0, 6)
            bCorner.Parent = button
            local bStroke = Instance.new("UIStroke")
            bStroke.Color = THEME.Border
            bStroke.Transparency = 0.5
            bStroke.Parent = button
            button.Activated:Connect(function()
                waiting = true
                button.Text = "[ ... ]"
            end)
            local control = {}
            function control:Set(key)
                if not key or key == "None" or key == "Unknown" or key == Enum.KeyCode.Unknown then
                    value = Enum.KeyCode.Unknown
                    button.Text = "[ None ]"
                    if config.Changed then
                        callback(config.Changed, value)
                    end
                    return
                end
                local nextKey = type(key) == "string" and Enum.KeyCode[key] or key
                if not nextKey or nextKey.EnumType ~= Enum.KeyCode then
                    return
                end
                value = nextKey
                button.Text = (value == Enum.KeyCode.Unknown and "[ None ]") or value.Name
                if config.Changed then
                    callback(config.Changed, value)
                end
            end
            function control:Get()
                return value
            end
            connect(UserInputService.InputBegan, function(input, processed)
                if UserInputService:GetFocusedTextBox() then
                    return
                end
                if waiting and input.UserInputType == Enum.UserInputType.Keyboard then
                    waiting = false
                    if input.KeyCode == Enum.KeyCode.Escape or input.KeyCode == Enum.KeyCode.Backspace or input.KeyCode == Enum.KeyCode.Delete then
                        control:Set(Enum.KeyCode.Unknown)
                    elseif input.KeyCode ~= Enum.KeyCode.Unknown then
                        control:Set(input.KeyCode)
                    end
                elseif not processed and input.UserInputType == Enum.UserInputType.Keyboard and value ~= Enum.KeyCode.Unknown and input.KeyCode == value then
                    callback(config.Callback, value)
                end
            end)
            return control
        end

        function tab:Paragraph(config)
            return card(sectionBody, {
                Title = config.Title,
                Desc = config.Content or config.Desc,
            }, 90)
        end

        function tab:Input(config)
            local frame = card(sectionBody, config, 110)
            local input = Instance.new("TextBox")
            input.Size = UDim2.new(1, -24, 0, 30)
            input.Position = UDim2.fromOffset(12, 72)
            input.BackgroundColor3 = THEME.BgInner
            input.TextColor3 = THEME.TextPrimary
            input.TextSize = 15
            input.Text = tostring(config.Value or "")
            input.PlaceholderText = config.Placeholder or ""
            input.ClearTextOnFocus = false
            input.ZIndex = 10
            input.Parent = frame
            input.FocusLost:Connect(function()
                callback(config.Callback, input.Text)
            end)
            return {
                Set = function(_, value)
                    input.Text = tostring(value)
                    callback(config.Callback, input.Text)
                end,
                Get = function()
                    return input.Text
                end,
            }
        end
        return tab
    end

    function window:ToggleChangelogs(state)
        if toggleChangelogs then
            toggleChangelogs(state)
        end
    end

    function window:IsChangelogsCollapsed()
        return isChangelogsCollapsed
    end

    function window:SetSmoke(enabled)
        local smoke = MainFrame.Parent:FindFirstChild("OuterSmoke")
        if smoke then
            smoke:SetAttribute("Disabled", not enabled)
            smoke.Visible = enabled and MainFrame.Visible and not isMinimized
        end
    end

    function window:SetScale(value)
        local scale = MainFrame.Parent:FindFirstChildOfClass("UIScale")
        local viewport = workspace.CurrentCamera.ViewportSize
        scale.Scale =
            math.clamp(value, 0.5, math.max(0.5, math.min((viewport.X - 48) / 1200, (viewport.Y - 70) / 630)))
    end

    function window:Center()
        MainFrame.Parent.Position = UDim2.fromScale(0.5, 0.5)
        MainFrame.Position = UDim2.new(0.5, -600, 0.5, -315)
    end

    function window:SetChangelogs(source)
        for _, child in ipairs(ConsoleScroll:GetChildren()) do
            if child:IsA("GuiObject") then
                child:Destroy()
            end
        end
        ConsoleScroll.CanvasPosition = Vector2.new(0, 0)
        ConsoleLayout.Padding = UDim.new(0, 0)
        local order = 0
        for raw in tostring(source):gmatch("[^\r\n]+") do
            local line = raw:match("^%s*(.-)%s*$")
            if line ~= "" then
                order = order + 1
                local heading = line:match("^#+%s*(.+)")
                local cleanText = line:gsub("^#+%s*", ""):gsub("^%s*%[[^%]]+%]%s*", ""):gsub("^%s*%d+%.%s*", "")

                local row = Instance.new("Frame")
                row.Name = "ReleaseEntry"
                row.Size = UDim2.new(1, -12, 0, 0)
                row.AutomaticSize = Enum.AutomaticSize.Y
                row.BackgroundTransparency = 1
                row.LayoutOrder = order
                row.ZIndex = 8
                row.Parent = ConsoleScroll

                local pad = Instance.new("UIPadding")
                pad.PaddingTop = UDim.new(0, heading and 14 or 10)
                pad.PaddingBottom = UDim.new(0, 10)
                pad.PaddingLeft = UDim.new(0, 6)
                pad.PaddingRight = UDim.new(0, 6)
                pad.Parent = row

                local label = text(row, heading or cleanText, heading and 15 or 13)
                label.Position = UDim2.fromOffset(0, 0)
                label.Size = UDim2.new(1, 0, 0, 0)
                label.AutomaticSize = Enum.AutomaticSize.Y
                label.TextWrapped = true
                label.RichText = false
                label.TextYAlignment = Enum.TextYAlignment.Top
                label.TextColor3 = heading and THEME.TextPrimary or Color3.fromRGB(185, 175, 205)

                local divider = Instance.new("Frame")
                divider.Size = UDim2.new(1, 0, 0, 1)
                divider.Position = UDim2.fromOffset(0, -5)
                divider.BackgroundColor3 = THEME.Border
                divider.BackgroundTransparency = 0.65
                divider.ZIndex = 8
                divider.Parent = row
            end
        end
    end

    function window:Destroy()
        ScreenGui:Destroy()
    end

    function window:Toggle()
        MainFrame.Visible = not MainFrame.Visible
    end

    local notifOrder = 0
    function window:Notify(config)
        config = config or {}
        notifOrder = notifOrder + 1

        local titleText = config.Title or "NightFall"
        local descText = config.Content or config.Desc or ""
        local duration = tonumber(config.Duration) or 3.5
        local notifType = (config.Type or ""):lower()

        local accentColor = THEME.AccentPurp
        local iconChoice = ICONS.Diamond

        local lowerTitle = titleText:lower()
        if
            notifType == "error"
            or lowerTitle:find("error")
            or lowerTitle:find("fail")
            or lowerTitle:find("cancel")
        then
            accentColor = Color3.fromRGB(244, 63, 94)
            iconChoice = ICONS.Shield
        elseif notifType == "success" or lowerTitle:find("success") or lowerTitle:find("complete") then
            accentColor = Color3.fromRGB(54, 216, 137)
            iconChoice = ICONS.Shield
        elseif notifType == "warn" or notifType == "warning" or lowerTitle:find("warn") then
            accentColor = Color3.fromRGB(251, 191, 36)
            iconChoice = ICONS.Shield
        elseif
            notifType == "combat"
            or lowerTitle:find("kill")
            or lowerTitle:find("target")
            or lowerTitle:find("aim")
        then
            accentColor = Color3.fromRGB(180, 85, 255)
            iconChoice = ICONS.Target
        end

        if config.Icon then
            local customIcon = aliases[config.Icon] or ICONS[config.Icon]
            if customIcon then
                iconChoice = customIcon
            end
        end

        local holder = Instance.new("Frame")
        holder.Name = "NotifHolder_" .. notifOrder
        holder.Size = UDim2.new(1, 0, 0, 0)
        holder.AutomaticSize = Enum.AutomaticSize.Y
        holder.BackgroundTransparency = 1
        holder.ClipsDescendants = false
        holder.LayoutOrder = notifOrder
        holder.ZIndex = 500
        holder.Parent = NotificationContainer

        local card = Instance.new("Frame")
        card.Name = "NotifCard"
        card.Size = UDim2.new(1, 0, 0, 0)
        card.AutomaticSize = Enum.AutomaticSize.Y
        card.Position = UDim2.fromOffset(380, 0)
        card.BackgroundColor3 = Color3.fromRGB(13, 9, 21)
        card.BackgroundTransparency = 0.12
        card.ZIndex = 501
        card.Parent = holder

        local cardCorner = Instance.new("UICorner")
        cardCorner.CornerRadius = UDim.new(0, 10)
        cardCorner.Parent = card

        local cardStroke = Instance.new("UIStroke")
        cardStroke.Thickness = 1
        cardStroke.Color = Color3.fromRGB(52, 34, 74)
        cardStroke.Transparency = 0.25
        cardStroke.Parent = card

        local accentStrip = Instance.new("Frame")
        accentStrip.Size = UDim2.new(0, 3, 1, -16)
        accentStrip.Position = UDim2.new(0, 0, 0, 8)
        accentStrip.BackgroundColor3 = accentColor
        accentStrip.BorderSizePixel = 0
        accentStrip.ZIndex = 503
        accentStrip.Parent = card

        local stripCorner = Instance.new("UICorner")
        stripCorner.CornerRadius = UDim.new(0, 2)
        stripCorner.Parent = accentStrip

        local iconBox = Instance.new("Frame")
        iconBox.Size = UDim2.fromOffset(32, 32)
        iconBox.Position = UDim2.fromOffset(12, 12)
        iconBox.BackgroundColor3 = Color3.fromRGB(22, 15, 34)
        iconBox.BackgroundTransparency = 0.1
        iconBox.ZIndex = 503
        iconBox.Parent = card

        local iconCorner = Instance.new("UICorner")
        iconCorner.CornerRadius = UDim.new(0, 7)
        iconCorner.Parent = iconBox

        local iconStroke = Instance.new("UIStroke")
        iconStroke.Thickness = 1
        iconStroke.Color = accentColor
        iconStroke.Transparency = 0.5
        iconStroke.Parent = iconBox

        createVectorIcon(
            iconBox,
            iconChoice,
            UDim2.fromOffset(16, 16),
            accentColor,
            UDim2.fromScale(0.5, 0.5),
            Vector2.new(0.5, 0.5)
        )

        local textContainer = Instance.new("Frame")
        textContainer.Position = UDim2.new(0, 52, 0, 10)
        textContainer.Size = UDim2.new(1, -80, 0, 0)
        textContainer.AutomaticSize = Enum.AutomaticSize.Y
        textContainer.BackgroundTransparency = 1
        textContainer.ZIndex = 503
        textContainer.Parent = card

        local textLayout = Instance.new("UIListLayout")
        textLayout.SortOrder = Enum.SortOrder.LayoutOrder
        textLayout.Padding = UDim.new(0, 3)
        textLayout.Parent = textContainer

        local titleLabel = Instance.new("TextLabel")
        titleLabel.Name = "Title"
        titleLabel.Size = UDim2.new(1, 0, 0, 0)
        titleLabel.AutomaticSize = Enum.AutomaticSize.Y
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = titleText
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 13
        titleLabel.TextColor3 = Color3.fromRGB(242, 235, 252)
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.TextWrapped = true
        titleLabel.LayoutOrder = 1
        titleLabel.ZIndex = 504
        titleLabel.Parent = textContainer

        if descText and descText ~= "" then
            local descLabel = Instance.new("TextLabel")
            descLabel.Name = "Desc"
            descLabel.Size = UDim2.new(1, 0, 0, 0)
            descLabel.AutomaticSize = Enum.AutomaticSize.Y
            descLabel.BackgroundTransparency = 1
            descLabel.Text = descText
            descLabel.Font = Enum.Font.Gotham
            descLabel.TextSize = 11
            descLabel.TextColor3 = Color3.fromRGB(168, 155, 188)
            descLabel.TextXAlignment = Enum.TextXAlignment.Left
            descLabel.TextWrapped = true
            descLabel.LayoutOrder = 2
            descLabel.ZIndex = 504
            descLabel.Parent = textContainer
        end

        local cardPad = Instance.new("UIPadding")
        cardPad.PaddingTop = UDim.new(0, 2)
        cardPad.PaddingBottom = UDim.new(0, 14)
        cardPad.Parent = textContainer

        local closeBtn = Instance.new("TextButton")
        closeBtn.Name = "CloseBtn"
        closeBtn.Size = UDim2.fromOffset(20, 20)
        closeBtn.Position = UDim2.new(1, -26, 0, 8)
        closeBtn.BackgroundTransparency = 1
        closeBtn.Text = ""
        closeBtn.AutoButtonColor = false
        closeBtn.ZIndex = 505
        closeBtn.Parent = card

        local closeIcon = createVectorIcon(
            closeBtn,
            ICONS.Close,
            UDim2.fromOffset(11, 11),
            Color3.fromRGB(130, 115, 150),
            UDim2.fromScale(0.5, 0.5),
            Vector2.new(0.5, 0.5)
        )

        closeBtn.MouseEnter:Connect(function()
            TweenService:Create(closeIcon, TweenInfo.new(0.15), {
                ImageColor3 = Color3.fromRGB(240, 230, 250),
            }):Play()
        end)
        closeBtn.MouseLeave:Connect(function()
            TweenService:Create(closeIcon, TweenInfo.new(0.15), {
                ImageColor3 = Color3.fromRGB(130, 115, 150),
            }):Play()
        end)

        local progressTrack = Instance.new("Frame")
        progressTrack.Name = "ProgressTrack"
        progressTrack.Size = UDim2.new(1, -16, 0, 2)
        progressTrack.Position = UDim2.new(0, 8, 1, -4)
        progressTrack.BackgroundColor3 = Color3.fromRGB(24, 16, 36)
        progressTrack.BorderSizePixel = 0
        progressTrack.ZIndex = 504
        progressTrack.Parent = card

        local progressBar = Instance.new("Frame")
        progressBar.Name = "ProgressBar"
        progressBar.Size = UDim2.new(1, 0, 1, 0)
        progressBar.BackgroundColor3 = accentColor
        progressBar.BorderSizePixel = 0
        progressBar.ZIndex = 505
        progressBar.Parent = progressTrack

        TweenService:Create(card, TweenInfo.new(0.38, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.fromOffset(0, 0),
        }):Play()

        local progressTween =
            TweenService:Create(progressBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
                Size = UDim2.new(0, 0, 1, 0),
            })
        progressTween:Play()

        local dismissed = false
        local function dismiss()
            if dismissed then
                return
            end
            dismissed = true
            progressTween:Cancel()
            local outTween = TweenService:Create(
                card,
                TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                {
                    Position = UDim2.fromOffset(380, 0),
                    BackgroundTransparency = 1,
                }
            )
            outTween:Play()
            outTween.Completed:Connect(function()
                holder:Destroy()
            end)
        end

        closeBtn.Activated:Connect(dismiss)
        task.delay(duration, dismiss)

        return holder
    end

    window:SetChangelogs(
        options.Changelogs
            or table.concat({
                "Added Noclip",
                "Fix QuickRespawn",
                "Redesigned UI",
                "Fix Auto Kill Target",
                "Added Config Manager",
                "Expanded Config Profiles",
                "Added Silent Aim",
                "Added Weapon Scroll"
            }, "\n")
    )
    do
        local devLookup = {}
        local devTags = {}
        local devCharConns = {}

        local function addDev(entry)
            if type(entry) == "string" and entry ~= "" then
                devLookup[entry:lower()] = true
            elseif type(entry) == "number" then
                devLookup[entry] = true
            end
        end

        for _, list in ipairs({ DEV_USERS, options.Developers }) do
            if type(list) == "table" then
                for k, v in pairs(list) do
                    addDev(v == true and k or v)
                end
            end
        end

        local function isDevPlayer(player)
            if not player then return false end
            return devLookup[player.Name:lower()] == true or devLookup[player.UserId] == true
        end

        local function removeDevTag(player)
            local tag = devTags[player]
            if tag then
                devTags[player] = nil
                if tag.gui then pcall(function() tag.gui:Destroy() end) end
            end
        end

        local function attachDevTag(player, char)
            removeDevTag(player)
            if not char or not isDevPlayer(player) then return end
            task.spawn(function()
                local head = char:FindFirstChild("Head") or char:WaitForChild("Head", 6)
                if not head or not head.Parent or player.Character ~= char or not ScreenGui.Parent then return end
                removeDevTag(player)

                local bb = Instance.new("BillboardGui")
                bb.Name = "NightFall_DevTag"
                bb.Adornee = head
                bb.Size = UDim2.fromOffset(108, 34)
                bb.StudsOffset = Vector3.new(0, 2.45, 0)
                bb.AlwaysOnTop = true
                bb.MaxDistance = 100
                bb.LightInfluence = 0
                bb.ResetOnSpawn = false
                bb.Parent = head

                local lbl = Instance.new("TextLabel")
                lbl.Name = "DevLabel"
                lbl.Size = UDim2.fromScale(1, 1)
                lbl.BackgroundTransparency = 1
                lbl.Text = "DEV"
                lbl.Font = Enum.Font.GothamBlack
                pcall(function()
                    lbl.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.ExtraBold)
                end)
                lbl.TextScaled = true
                lbl.TextColor3 = Color3.new(1, 1, 1)
                lbl.ZIndex = 2
                lbl.Parent = bb

                local stroke = Instance.new("UIStroke")
                stroke.Color = Color3.fromRGB(4, 28, 34)
                stroke.Thickness = 2.2
                stroke.Transparency = 0.15
                stroke.Parent = lbl

                local grad = Instance.new("UIGradient")
                grad.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 175, 195)),
                    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(45, 245, 225)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(175, 255, 250)),
                    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(20, 225, 200)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 175, 195)),
                })
                grad.Rotation = 12
                grad.Parent = lbl

                devTags[player] = { gui = bb, grad = grad, head = head }
            end)
        end

        local function watchDevPlayer(player)
            if not isDevPlayer(player) or devCharConns[player] then return end
            devCharConns[player] = connect(player.CharacterAdded, function(char)
                attachDevTag(player, char)
            end)
            if player.Character then
                attachDevTag(player, player.Character)
            end
        end

        for _, player in ipairs(Players:GetPlayers()) do
            watchDevPlayer(player)
        end
        connect(Players.PlayerAdded, watchDevPlayer)
        connect(Players.PlayerRemoving, function(player)
            removeDevTag(player)
            if devCharConns[player] then
                devCharConns[player]:Disconnect()
                devCharConns[player] = nil
            end
        end)

        connect(game:GetService("RunService").RenderStepped, function()
            if not next(devTags) then return end
            local t = os.clock()
            local shift = Vector2.new(math.sin(t * 2.2) * 0.72, 0)
            local bob = Vector3.new(0, 2.45 + math.sin(t * 2.5) * 0.12, 0)
            for player, tag in pairs(devTags) do
                if tag.gui and tag.gui.Parent and tag.head and tag.head.Parent then
                    tag.grad.Offset = shift
                    tag.gui.StudsOffset = bob
                else
                    devTags[player] = nil
                end
            end
        end)

        ScreenGui.Destroying:Connect(function()
            for player in pairs(devTags) do
                removeDevTag(player)
            end
            devCharConns = {}
        end)

        function window:AddDeveloper(nameOrId)
            addDev(nameOrId)
            for _, player in ipairs(Players:GetPlayers()) do
                watchDevPlayer(player)
            end
        end
    end

    self.Window = window
    return window
end

function Nightfall:Notify(config)
    if self.Window then
        return self.Window:Notify(config)
    end
end

return Nightfall
