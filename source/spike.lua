local pd <const> = playdate
local gfx <const> = pd.graphics

class('Spike').extends(gfx.sprite)

function Spike:init(x, y)
    Spike.super.init(self)
    self:moveTo(x, y)
    local spikeImage = gfx.image.new("images/spike")
    self:setImage(spikeImage)
    self:setCollideRect(0, 0, self:getSize())
    self.damaged = false
end

function Spike:update()
    Spike.super.update(self)
    local overlappingSprites = self:overlappingSprites()
    if #overlappingSprites == 0 then
        self.damaged = false
    else
        if not self.damaged then
            self.damaged = true
            local circle = overlappingSprites[1]
            circle:damage(5)
        end
    end
end