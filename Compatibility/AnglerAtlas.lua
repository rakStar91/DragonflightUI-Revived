local DF = LibStub('AceAddon-3.0'):GetAddon('DragonflightUI')

function DF.Compatibility:AnglerAtlas()
    -- print('DF.Compatibility:AnglerAtlas()')

    local base = 'Interface/Addons/DragonflightUI/Textures/UI/'

    local tab = _G['angler-show-button-tab']
    if not tab then return end
    -- AnglerAtlas hides the tab itself when its option is off, do not reserve a slot then
    if AnglerAtlasSettings and not AnglerAtlasSettings.showSpellbookButton then return end

    tab.texture:SetTexture(base .. 'spellbook-skilllinetab')

    -- the frame is bigger than the 32x32 button, offset to line it up with the other tabs
    DF.Compatibility:AddSpellbookTab('AnglerAtlas', tab, -3, 11)
end
