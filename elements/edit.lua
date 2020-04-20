function dxCreateEdit(x, y, w, h, placeholder, text)
    if not x or y or w or h then
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
end