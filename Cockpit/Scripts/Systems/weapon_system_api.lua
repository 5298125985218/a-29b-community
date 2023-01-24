dofile(LockOn_Options.common_script_path.."../../../Database/wsTypes.lua")

local count = -1
local function counter()
	count = count + 1
	return count
end

WPN_MASS_IDS = {
    SIM          = -1,
    SAFE         = 0,
    LIVE         = 1,
}

WPN_LATEARM_IDS = {
    GUARD        = -1,
    SAFE         = 0,
    ON           = 1,
}

WPN_AA_SIGHT_IDS = {
    LCOS         = 0,
    SSLC         = 1,
    SNAP         = 2,
}

WPN_AA_RR_SRC_IDS = {
    DL          = 0,
    MAN         = 1,
}

WPN_AA_SLV_SRC_IDS = {
    BST         = 0,
    DL          = 1,
}

WPN_AA_COOL_IDS = {
    COOL        = 0,
    WARM        = 1,
}

WPN_AA_SCAN_IDS = {
    SCAN        = 0,
    SPOT        = 1,
}

WPN_AA_LIMIT_IDS = {
    TD          = 0,
    BP          = 1,
}

WPN_WEAPON_TYPE_IDS = {
    NO_WEAPON = 0,
    AA_MISSILE = 1,
    AG_BOMB = 2,
    AG_ROCKET = 3,
    AG_WEAPON_END = 4,
}

count = -1
WPN_LAUNCH_OP_IDS = {
    SGL         = counter(),
    PAIR    = counter(),
    SALVO    = counter(),
}


WPN_MASS = get_param_handle("WPN_MASS")
WPN_LATEARM = get_param_handle("WPN_LATEARM")

WPN_STO_1_JET = get_param_handle("WPN_STO_1_JET")
WPN_STO_2_JET = get_param_handle("WPN_STO_2_JET")
WPN_STO_3_JET = get_param_handle("WPN_STO_3_JET")
WPN_STO_4_JET = get_param_handle("WPN_STO_4_JET")
WPN_STO_5_JET = get_param_handle("WPN_STO_5_JET")
WPN_AA_SEL = get_param_handle("WPN_AA_SEL")
WPN_AG_SEL = get_param_handle("WPN_AG_SEL")
WPN_READY = get_param_handle("WPN_READY")
WPN_SIM_READY = get_param_handle("WPN_SIM_READY")
WPN_GUNS_1 = get_param_handle("WPN_GUNS_1")
WPN_GUNS_2 = get_param_handle("WPN_GUNS_2")
WPN_MSL_CAGED = get_param_handle("WPN_MSL_CAGED")

WPN_RELEASE = get_param_handle("WPN_RELEASE")
WPN_AA_SIGHT = get_param_handle("WPN_AA_SIGHT")
WPN_LAUNCH_OP = get_param_handle("WPN_LAUNCH_OP")

WS_IR_MISSILE_LOCK = get_param_handle("WS_IR_MISSILE_LOCK")
WS_IR_MISSILE_TARGET_AZIMUTH = get_param_handle("WS_IR_MISSILE_TARGET_AZIMUTH")
WS_IR_MISSILE_TARGET_ELEVATION = get_param_handle("WS_IR_MISSILE_TARGET_ELEVATION")
WS_ROCKET_PIPER_AVAILABLE = get_param_handle("WS_ROCKET_PIPER_AVAILABLE")
WS_ROCKET_PIPER_AZIMUTH = get_param_handle("WS_ROCKET_PIPER_AZIMUTH")
WS_ROCKET_PIPER_ELEVATION = get_param_handle("WS_ROCKET_PIPER_ELEVATION")
WS_GUN_PIPER_AVAILABLE = get_param_handle("WS_GUN_PIPER_AVAILABLE")
WS_GUN_PIPER_AZIMUTH = get_param_handle("WS_GUN_PIPER_AZIMUTH")
WS_GUN_PIPER_ELEVATION = get_param_handle("WS_GUN_PIPER_ELEVATION")
WS_GUN_PIPER_SPAN = get_param_handle("WS_GUN_PIPER_SPAN")


WPN_CCIP_PIPER_ELEVATION = get_param_handle("WPN_CCIP_PIPER_ELEVATION")
WPN_CCIP_PIPER_AZIMUTH = get_param_handle("WPN_CCIP_PIPER_AZIMUTH")
WPN_CCIP_PIPER_AVAILABLE = get_param_handle("WPN_CCIP_PIPER_AVAILABLE")

WPN_SELECTED_TYPE = get_param_handle("WPN_SELECTED_TYPE")
WPN_RP = get_param_handle("WPN_RP")
WPN_RP_TOTAL = get_param_handle("WPN_RP_TOTAL")
WPN_IS_M = get_param_handle("WPN_IS_M")
WPN_IS_TIME = get_param_handle("WPN_IS_TIME")
WPN_SD = get_param_handle("WPN_SD")
WPN_GUNS_1_SEL = get_param_handle("WPN_GUNS_1_SEL")
WPN_GUNS_2_SEL = get_param_handle("WPN_GUNS_2_SEL")
WPN_VENTRAL_FREE = get_param_handle("WPN_VENTRAL_FREE")


function get_wpn_aa_sel()
    return WPN_AA_SEL:get()
end

function set_wpn_aa_sel(sto)
    return WPN_AA_SEL:set(sto)
end

function get_wpn_ag_sel()
    return WPN_AG_SEL:get()
end

function set_wpn_ag_sel(sto)
    return WPN_AG_SEL:set(sto)
end


function get_wpn_sto_jet(index)
    if index == 1 then return WPN_STO_1_JET:get()
    elseif index == 2 then return WPN_STO_2_JET:get()
    elseif index == 3 then return WPN_STO_3_JET:get()
    elseif index == 4 then return WPN_STO_4_JET:get()
    elseif index == 5 then return WPN_STO_5_JET:get()
    end
end

function set_wpn_sto_jet(index, value)
    if index == 1 then return WPN_STO_1_JET:set(value)
    elseif index == 2 then return WPN_STO_2_JET:set(value)
    elseif index == 3 then return WPN_STO_3_JET:set(value)
    elseif index == 4 then return WPN_STO_4_JET:set(value)
    elseif index == 5 then return WPN_STO_5_JET:set(value)
    end
end

function get_wpn_mass()
    return WPN_MASS:get()
end

function get_wpn_latearm()
    return WPN_LATEARM:get()
end

function set_wpn_selected_storage(pos)
    local wpn = GetDevice(devices.WEAPON_SYSTEM)
    if wpn then wpn:performClickableAction(device_commands.WPN_SELECT_STO, pos) end
end

function get_wpn_ag_sim_ready()
    return get_avionics_master_mode_ag() and not get_avionics_master_mode_ag_gun() and not get_avionics_onground() and (get_wpn_mass() == WPN_MASS_IDS.SIM and get_wpn_latearm() == WPN_LATEARM_IDS.ON and WPN_AG_SEL:get() ~= 0)
end

function get_wpn_ag_ready()
    return get_avionics_master_mode_ag() and not get_avionics_master_mode_ag_gun() and not get_avionics_onground() and (get_wpn_mass() == WPN_MASS_IDS.LIVE and get_wpn_latearm() == WPN_LATEARM_IDS.ON and WPN_AG_SEL:get() ~= 0)
end

function get_wpn_aa_msl_sim_ready()
    return get_avionics_master_mode_aa() and get_wpn_aa_sel() > 0 and get_wpn_mass() == WPN_MASS_IDS.SIM and get_wpn_latearm() == WPN_LATEARM_IDS.ON and not get_avionics_onground()
end

function get_wpn_aa_msl_ready()
    return get_avionics_master_mode_aa() and get_wpn_aa_sel() > 0 and get_wpn_mass() == WPN_MASS_IDS.LIVE and get_wpn_latearm() == WPN_LATEARM_IDS.ON and not get_avionics_onground()
end

function get_wpn_msl_caged()
    return WPN_MSL_CAGED:get()
end

function get_wpn_aa_ready()
    return get_wpn_aa_msl_ready() or get_wpn_guns_ready()
end

function get_wpn_guns_ready()
    local master_mode = get_avionics_master_mode()
    return (master_mode == AVIONICS_MASTER_MODE_ID.DGFT_B or master_mode == AVIONICS_MASTER_MODE_ID.DGFT_L or get_avionics_master_mode_ag_gun(master_mode)) and
    get_wpn_latearm() == WPN_LATEARM_IDS.ON and get_wpn_mass() == WPN_MASS_IDS.LIVE and (WPN_GUNS_1:get() + WPN_GUNS_2:get()) > 0 and not get_avionics_onground()
end

function get_wpn_guns_sim_ready()
    local master_mode = get_avionics_master_mode()
    return (master_mode == AVIONICS_MASTER_MODE_ID.DGFT_B or master_mode == AVIONICS_MASTER_MODE_ID.DGFT_L or get_avionics_master_mode_ag_gun(master_mode)) and
    get_wpn_latearm() == WPN_LATEARM_IDS.ON and get_wpn_mass() == WPN_MASS_IDS.SIM and (WPN_GUNS_1:get() + WPN_GUNS_2:get()) > 0 and not get_avionics_onground()
end

function get_wpn_ventral_free()
    return WPN_VENTRAL_FREE:get() == 1
end