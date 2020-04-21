dxElements = {
    buttons = {},
    edits = {}
}

local sX, sY = guiGetScreenSize()

function isCursorOnElement(element)
    local pX, pY = getCursorPosition()
    local cX, cY = sX*pX, sY*pY

    -- Check if cursor is on element
    if cX >= element.x and cX <= element.x+element.w and cY >= element.y and cY <= element.y+element.h then
        return true
    else
        return false
    end
end

function dxDrawOutlinedRectangle(x, y, width, height, color, lineColor)
    local lineColor = lineColor or tocolor(255, 255, 255, 255)
    dxDrawRectangle(x, y, width, height, color or tocolor(0, 0, 0, 255))
    dxDrawLine(x, y, x + width, y, lineColor) -- Top
    dxDrawLine(x, y + height, x + width, y + height, lineColor) -- Bottom
    dxDrawLine(x, y, x, y + height, lineColor) -- Left
    dxDrawLine(x + width, y, x + width, y + height, lineColor) -- Right
end

--[[ DX ELEMENTS
    dxCreateButton(x, y, w, h, color, lineColor, fontColor, placeholder)
    isCursorOnElement(element)
]]--