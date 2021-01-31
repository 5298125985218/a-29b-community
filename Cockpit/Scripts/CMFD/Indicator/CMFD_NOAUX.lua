dofile(LockOn_Options.script_path .. "CMFD/CMFD_defs.lua")
dofile(LockOn_Options.script_path .. "CMFD/CMFD_pageID_defs.lua")

local page_root = create_page_root()
page_root.element_params = {"CMFD2Format"}
page_root.controllers = {{"parameter_in_range",0,SUB_PAGE_ID.NOAUX - 0.05, SUB_PAGE_ID.END + 0.05}}


local Poly_Text        = CreateElement "ceStringPoly"
Poly_Text.material    = CMFD_FONT_DEF
Poly_Text.stringdefs= CMFD_STRINGDEFS_DEF_X2
Poly_Text.init_pos    = {0, 0, 0}
Poly_Text.alignment    = "CenterCenter"
Poly_Text.value        = "AVAILABLE IN\nTWO WEEKS"
Poly_Text.parent_element    = page_root.name
AddToUpper(Poly_Text)
Poly_Text = nil

