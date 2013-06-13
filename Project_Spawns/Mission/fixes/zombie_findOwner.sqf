private ["_unit","_foundLocation","_tempZedNum","_tempDist","_lastLoc","_nearestLoc","_tempDistNew","_position","_cityTypes","_name","_yum","_city"];
_unit = _this select 0;

if (alive _unit) then {
	_nearestLoc = "";
	////locality issue cause we don't transmit the variable originLoc so the server doesn't get anything

	//_city = _unit getVariable "originLoc";
		
	_position = getPosATL _unit;
	//_radius = 500;
	_cityTypes = ["NameCityCapital","NameCity","NameVillage","NameLocal","Airport"];
	
	_nearestLoc = (nearestLocations [_position, _cityTypes, 800]) select 0; //alternative to try
	
	if (!(isNil "_nearestLoc")) then {
		_name = text _nearestLoc;

		if (count server_zedDespawnPool > 0) then {
			_foundLocation = false;
			_counter = 0;
			{
				if ((_x select 0) == _name) exitWith {
					_tempZeds = _x select 1;
					server_zedDespawnPool set [_counter, [_name, _tempZeds + 1]];
					_foundLocation = true;
				};
				_counter = _counter + 1;
			} forEach server_zedDespawnPool;
			if (!_foundLocation) then {
				server_zedDespawnPool set [(count server_zedDespawnPool), [_name,1]];
			};
		} else {
			server_zedDespawnPool set [0, [_name,1]];
		};
	};
};

diag_log ("MMMYUM: ZEDSYSTEM: CLEANUP: DELETE UNCONTROLLED ZOMBIE: " + (typeOf _unit) + " OF: " + str(_unit) );

deleteVehicle _unit;