function RageUI.Info2(Title, RightText, LeftText)
    RightText = RightText or {}
    LeftText = LeftText or {}

    local LineCount = math.max(#RightText, #LeftText)

    local baseX, baseY = 0, 400

    if Title ~= nil then
        RenderText("~h~" .. Title .. "~s~", baseX + 20, baseY + 10, 0, 0.30, 255, 255, 255, 255, 0)
    end

    if #RightText > 0 then
        RenderText(table.concat(RightText, "\n"), baseX + 20, baseY + 35, 0, 0.25, 255, 255, 255, 255, 0)
    end

    if #LeftText > 0 then
        RenderText(table.concat(LeftText, "\n"), baseX + 220, baseY + 35, 0, 0.25, 255, 255, 255, 255, 0)
    end

    RenderRectangle(baseX, baseY - 3, 415, (Title ~= nil and 50 + (LineCount * 18) or ((LineCount + 1) * 20)), 22, 22, 22, 100)
end
