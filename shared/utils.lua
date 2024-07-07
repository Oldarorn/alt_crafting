function getLabelFromData(table, dataValue)
    for i = 1, #table do
        if table[i].value == dataValue then
            return table[i].label
        end
    end
    return nil
end