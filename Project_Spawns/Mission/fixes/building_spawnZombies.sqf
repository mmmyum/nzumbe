private ["_obj","_unitTypes","_num","_position","_nLoc"];

if (dayz_maxCurrentZeds > dayz_maxZeds) exitwith {};
if ((dayz_spawnZombies - sleepingZeds) > dayz_maxLocalZombies) exitwith {}; 
if (sleepingZeds > 100) exitWith {};

_obj = 			_this select 0;
_num = 			_this select 1;
_nLoc = 		_this select 2;
_locText = 		_this select 3;
_radius = 		_this select 4;

_position = locationPosition (_nLoc);

diag_log format ["MMMYUM: ZEDSYSTEM: building_spawnZombies start at %1",_position];

if (_num > 0) then {
	_unitTypes = [];
	if (_num > 20) then {
		_num = 20;
	};
	while {_num > 0} do {
		if ((dayz_spawnZombies - sleepingZeds) > dayz_maxLocalZombies) exitwith {};
		if (sleepingZeds > 100) exitWith {};
		[_position,_obj,_locText,_radius] call zombie_generate;
		_num = _num - 1;
		sleep 0.2;
	};
	diag_log("LOCATION ZOMBIE SPAWN...");
};