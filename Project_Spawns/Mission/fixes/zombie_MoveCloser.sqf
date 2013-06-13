//private [];

_position = getPosATL player;
_cityTypes = ["NameCityCapital","NameCity","NameVillage","NameLocal"];
_nearestLoc = (nearestLocations [_position, _cityTypes, 800] select 0);

_agent = _this;
//_returnBool = false;

if (!(isNil "_nearestLoc")) then {
	_oldLoc = _agent getVariable "originLoc";

		_namedLocation = yum_locations_index find (text _nearestLoc);

		if (_namedLocation != -1) then {
			_city = yum_locations select _namedLocation;
			_zedCount = _city getVariable ["numZombies", 0];
			
			if (_zedCount > 0) then {
				_radius = _city getVariable ["spawnRadius", 200];
				_pos = [locationPosition _nearestLoc, 10, _radius, 5, 0, 20, 0] call BIS_fnc_findSafePos;
				_agent setPosATL [_pos select 0, _pos select 1, 0];
				
				if (count client_despawnLocs > 0) then {
					_foundLocation = false;
					_counter = 0;

					{
						if ((_x select 0) == _city) exitWith {
							_tempZeds = _x select 1;
							client_despawnLocs set [_counter, [_city, _tempZeds - 1]];
							_foundLocation = true;
						};
						_counter = _counter + 1;
					} forEach client_despawnLocs;

					if (!_foundLocation) then {
						client_despawnLocs set [(count client_despawnLocs), [_city,-1]];
					};
				} else {
					client_despawnLocs set [0, [_city,-1]];
				};
				_agent setVariable ["originLoc",text _nearestLoc];
				
				Diag_log (format ["Moving zombie to %1", _pos]);
				//_agent setVariable ["readyToWake",true];
				//_returnBool = true;
			};
		};
		
		if (!(isNil "_oldLoc")) then {
			_namedLocation = yum_locations_index find _oldLoc;

			if (_namedLocation != -1) then {
				_city = yum_locations select _namedLocation;
				_zedCount = _city getVariable ["numZombies", 0];
				
				if (_zedCount > 0) then {
					//_radius = _city getVariable ["spawnRadius", 200];
					
					if (count client_despawnLocs > 0) then {
						_foundLocation = false;
						_counter = 0;

						{
							if ((_x select 0) == _city) exitWith {
								_tempZeds = _x select 1;
								client_despawnLocs set [_counter, [_city, _tempZeds + 1]];
								_foundLocation = true;
							};
							_counter = _counter + 1;
						} forEach client_despawnLocs;

						if (!_foundLocation) then {
							client_despawnLocs set [(count client_despawnLocs), [_city,1]];
						};
					} else {
						client_despawnLocs set [0, [_city,1]];
					};
					//_agent setVariable ["originLoc",text _oldLoc];
					//_agent setVariable ["readyToWake",true];
					//_returnBool = true;
				};
			};
		};

};