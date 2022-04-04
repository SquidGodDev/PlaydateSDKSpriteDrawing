import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"

import "circle"
import "spike"

local pd <const> = playdate
local gfx <const> = pd.graphics

local function initialize()
    local circleSprite = Circle(100, 80, 20)
    circleSprite:add()
    local circleSprite2 = Circle(100, 160, 15)
    circleSprite2:add()
    local spike = Spike(250, 120)
    spike:add()
end

initialize()

function playdate.update()
    gfx.sprite.update()
end