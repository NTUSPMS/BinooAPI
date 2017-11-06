-- saves data into local temporary dictionary
-- note: all dictionary data is erased on mode change!
b = BinooAPI

id = "golden-key"

-- try enabling next line
--b:SaveInt(id,999)

if b:KeyExists(id) then
    -- get current keys amount
    keys = b:GetInt(id)
    -- use one key
    b:SaveInt(id, keys-1)
    b:ShowMessage("Have keys: "..tostring(keys))
else
    -- returns nil if key is not in dictionary
    keys = b:GetInt(id)
    b:ShowMessage("no keys: "..tostring(keys))
end

