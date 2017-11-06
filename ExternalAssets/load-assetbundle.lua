-- loads assetbundle and sets name for it, special $PLATFORM$ tag must be used in path
-- note: loading is asyncronous, so object wont be available in the next line of code
b = BinooAPI
id="skull"
b:LoadBundle(b:GetAssetURL("Fossils%20and%20Skeletons/Dinosaur%20skull"),id)
