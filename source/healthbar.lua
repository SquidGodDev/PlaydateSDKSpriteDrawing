local pd <const> = playdate
local gfx <const> = pd.graphics

class('Healthbar').extends(gfx.sprite)

function Healthbar:init(x, y, maxHealth)
    Healthbar.super.init(self)
    self.maxHealth = maxHealth
    self.health = maxHealth
    self:moveTo(x, y)
    self:updateHealth(maxHealth)
    self:add()
end

function Healthbar:updateHealth(newHealth)
    local maxWidth = 40
    local height = 5
    local healthbarWidth = (newHealth / self.maxHealth) * maxWidth
    local healthbarImage = gfx.image.new(maxWidth, height)
    gfx.pushContext(healthbarImage)
        gfx.fillRect(0, 0, healthbarWidth, height)
    gfx.popContext()
    self:setImage(healthbarImage)
end

function Healthbar:damage(amount)
    self.health -= amount
    if self.health <= 0 then
        self.health = 0
    end
    self:updateHealth(self.health)
end
