local DF = LibStub('AceAddon-3.0'):GetAddon('DragonflightUI')

-- Shared layout for tabs that other addons add to the SpellBook (WhatsTraining, AnglerAtlas, ...).
-- They are stacked below the Blizzard skill line tabs, starting at this slot, sorted by name so the
-- order is the same on every login no matter which addon loads first.
local START_SLOT = 6
-- distance between two tabs: button height (32) + Blizzard spacing (17)
local TAB_STEP = 49

local tabs = {}

local function Layout()
    local anchor = _G['SpellBookSkillLineTab' .. START_SLOT]
    if not anchor then return end

    table.sort(tabs, function(a, b) return a.name < b.name end)

    for i, entry in ipairs(tabs) do
        entry.frame:ClearAllPoints()
        entry.frame:SetPoint('TOPLEFT', anchor, 'TOPLEFT', entry.x, entry.y - (i - 1) * TAB_STEP)
    end
end

---@param name string unique name, also decides the order
---@param frame table the tab to place
---@param x number|nil offset of the frame's TOPLEFT to the slot (for frames bigger than the 32x32 button)
---@param y number|nil
function DF.Compatibility:AddSpellbookTab(name, frame, x, y)
    for _, entry in ipairs(tabs) do if entry.name == name then return end end

    table.insert(tabs, {name = name, frame = frame, x = x or 0, y = y or 0})
    Layout()
end
