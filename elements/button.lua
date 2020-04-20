function dxCreateButton(x, y, w, h, color, lineColor, fontColor, placeholder)
    if not x or not y or not w or not h then
        return outputDebugString("Missing arguments", 3, 255, 0, 0)
    end
    local id = #dxElements.buttons + 1
    dxElements.buttons[id] = {}
    dxElements.buttons[id].x = x
    dxElements.buttons[id].y = y
    dxElements.buttons[id].w = w
    dxElements.buttons[id].h = h
    dxElements.buttons[id].color = color or tocolor(0, 0, 0, 255)
    dxElements.buttons[id].lineColor = lineColor or tocolor(255, 255, 255, 255)
    dxElements.buttons[id].fontColor = fontColor or tocolor(255, 255, 255, 255)
    dxElements.buttons[id].placeholder = placeholder
    dxElements.buttons[id].func = function() outputDebugString("Hook a function") end
    showCursor(true)
    return dxElements.buttons[id]
end

button1 = dxCreateButton(500, 500, 1000, 200, tocolor(0, 0, 0, 255), tocolor(255, 0, 0, 255), tocolor(255, 255, 255, 255), "Login")

function renderButtons()
    if #dxElements.buttons > 0 then
        for k, button in pairs(dxElements.buttons) do
            local textWidth = dxGetTextWidth(button.placeholder)
            dxDrawOutlinedRectangle(button.x, button.y, button.w, button.h, button.color, button.lineColor)
            dxDrawText(button.placeholder, (button.w/2) + button.x - textWidth/2, (button.h)/2 + button.y - textWidth/2, button.x, button.y, button.fontColor, 1, "default-bold")
        end
    end
end
addEventHandler("onClientRender", root, renderButtons)

function dxOnButtonClicked(button, state)
    if #dxElements.buttons > 0 then
        if button == "left" and state == "down" then
            for k, button in pairs(dxElements.buttons) do
                if (isCursorOnElement(button)) then
                    button.func()
                end
            end
        end
    end
end
addEventHandler("onClientClick", getRootElement(), dxOnButtonClicked)