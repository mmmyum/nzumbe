private ["_position","_unitTypes","_isNoone","_loot","_agent","_type","_radius","_method","_myDest","_newDest","_id","_rnd","_loc"];

_position =    _this select 0;
_loc 	  = 	_this select 1;
_locTxt   = 	_this select 2;
_radius   = 	_this select 3;

_unitTypes = [];
_agent =    objNull;

if ((dayz_maxCurrentZeds - sleepingZeds) > dayz_maxZeds) exitwith {};
if ((dayz_CurrentZombies - sleepingZeds) > dayz_maxGlobalZombies) exitwith {}; 
if ((dayz_spawnZombies - sleepingZeds) > dayz_maxLocalZombies) exitwith {}; 

_unitTypes =    []+ getArray (configFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
_type = _unitTypes call BIS_fnc_selectRandom;
 
//Create the Group and populate it
if (isNil "_radius") then {
	_radius = 200;
};
_method = "CAN_COLLIDE";
_agent = createAgent [_type, _position, [], _radius, _method];
diag_log format ["MMMYUM: ZEDSYSTEM: zombie_generate SUCCESS! | PositionAgent = %1",_position];

_agent setVariable ["doLoiter",false,true];
_agent switchMove "AmovPpneMstpSnonWnonDnon_healed";      
     
_agent setDir round(random 180); //I ADDED THIS
_myDest = getPosATL _agent;
_newDest = getPosATL _agent;

_pos = [_position, 10, _radius, 5, 0, 20, 0] call BIS_fnc_findSafePos;
_agent setPosATL [_pos select 0, _pos select 1, 0];

_agent setVariable ["myDest",_myDest];
_agent setVariable ["newDest",_newDest];
_agent setVariable ["originLoc",_loc];

//Add some loot
_rnd = random 1;
if (_rnd > 0.3) then {
	_loot = ["Skin_Bandit2_DZ","Skin_GUE_Soldier_MG_DZ","Skin_GUE_Soldier_Sniper_DZ","Skin_GUE_Soldier_Crew_DZ","Skin_GUE_Soldier_CO_DZ","Skin_GUE_Soldier_2_DZ","Skin_Rocket_DZ","Skin_RU_Policeman_DZ","Skin_Pilot_EP1_DZ","Skin_Haris_Press_EP1_DZ","Skin_Ins_Soldier_GL_DZ","Skin_GUE_Commander_DZ","Skin_Functionary1_EP1_DZ","Skin_Priest_DZ","Skin_Rocker1_DZ","Skin_Rocker2_DZ","Skin_Rocker3_DZ","Skin_Rocker4_DZ","Skin_TK_INS_Warlord_EP1_DZ","Skin_TK_INS_Soldier_EP1_DZ","Skin_CZ_Special_Forces_GL_DES_EP1_DZ","Skin_Drake_Light_DZ","Skin_Soldier_Bodyguard_AA12_PMC_DZ","Skin_Soldier_Sniper_PMC_DZ","Skin_Soldier_TL_PMC_DZ","Skin_FR_OHara_DZ","Skin_FR_Rodriguez_DZ","Skin_CZ_Soldier_Sniper_EP1_DZ","Skin_Graves_Light_DZ"] select floor random 29;
//    _lootType = configFile >> "CfgVehicles" >> _type >> "zombieLoot";
//    if (isText _lootType) then {
//        _array = []+ getArray (configFile >> "cfgLoot" >> getText(_lootType));
//        if (count _array > 0) then {
//            _loot = _array call BIS_fnc_selectRandomWeighted;
//            if(!isNil "_array") then {
                _agent addMagazine _loot;
//            };
//        };
//    };
};
 
if (count client_despawnLocs > 0) then {
	_foundLocation = false;
	_counter = 0;
	{
		if ((_x select 0) == _loc) exitWith {
			_tempZeds = _x select 1;
			client_despawnLocs set [_counter, [_loc, _tempZeds - 1]];
			_foundLocation = true;
		};
		_counter = _counter + 1;
	} forEach client_despawnLocs;

	if (!_foundLocation) then {
		client_despawnLocs set [(count client_despawnLocs), [_loc,-1]];
	};
} else {
	client_despawnLocs set [0, [_loc,-1]];
};
 
//Start behavior
//_id = [_position,_agent] execFSM "\z\AddOns\dayz_code\system\zombie_agent.fsm"; //original
_id = [_position,_agent] execFSM "fixes\zombie_agent.fsm"; //new zombie agent