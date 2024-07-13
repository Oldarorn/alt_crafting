function getLabelFromData(table, dataValue)
    for i = 1, #table do
        if table[i].value == dataValue then
            return table[i].label
        end
    end
    return nil
end

function checkArray (tab, val)
	for index, value in ipairs(tab) do
			if value == val then
					return true
			end
	end
	return false
end