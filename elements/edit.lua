function dxCreateEdit(x, y, w, h, placeholder, text)
    if not x or not y or not w or not h then
        return outputDebugString("Missing arguments")
    end

    local id = #dxElements.edits + 1
    dxElements.edits[id] = {}
    dxElements.edits[id].x = x
    dxElements.edits[id].y = y
    dxElements.edits[id].w = w
    dxElements.edits[id].h = h
    dxElements.edits[id].placeholder = placeholder
    dxElements.edits[id].text = text
    dxElements.edits[id].active = false
    return dxElements.edits[id]
end

dxCreateEdit(200, 200, 200, 200)

function renderEdits()
    if #dxElements.edits > 0 then
        for k, edit in pairs(dxElements.edits) do
            dxDrawText(edit.text, 500, 500)
        end
    end
end
addEventHandler("onClientRender", root, renderEdits)