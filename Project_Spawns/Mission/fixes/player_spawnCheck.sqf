private ["_position","_nearestLoc","_yum","_city","_tempZedNum","_radius","_cityTypes","_name"];

//Zombie Cleanup

if ((time - player_lastZombieDespawn) > 33) then {
	if (count client_despawnLocs > 0) then {
		{
			_city = _x select 0;
			_tempNum = _city getVariable ["numZombies", 0];
			
			//if (_tempNum > 0) then {
				_city setVariable ["numZombies", ((_tempNum + (_x select 1)) max 0), true];
				diag_log (format["Despawning %1 zeds into %2", ((_tempNum + (_x select 1)) max 0), _city]);
			//};
			//sleep 0.1;
		} forEach client_despawnLocs;
		
		client_despawnLocs = [];
	};
	

	player_lastZombieDespawn = time;


} else {

// Zombie Spawn


	//_isAir = vehicle player iskindof "Air";
	//_inVehicle = vehicle player isKindOf "player";
	_position = getPosATL player;
	_radius = 200;
	_cityTypes = ["NameCityCapital","NameCity","NameVillage","NameLocal","Airport"];

	_nearestLoc = (nearestLocations [_position, _cityTypes, 600] select 0);
	yum_playerLoc = _nearestLoc;
	if (!(isNil "_nearestLoc")) then {
		_name = text _nearestLoc;
		yum_playerCurrentLoc = _name;
		if (sleepingZeds < 100) then {
			//pick nearest city from array and store it in _city
			_yum = yum_locations_index find _name;
			if (_yum == -1) exitwith {
				diag_log format ["MMMYUM: ZEDSYSTEM: No Location | PlayerPos: %1",_position];
				yum_playerCurrentLoc = "nolocation";
			};
			_city = yum_locations select _yum;
			yum_playerLastCity = _city;
			//get var and check to see if the location should spawn zeds
			
			_tempZedNum = _city getVariable ["numZombies", 0];

			if (_tempZedNum > 0) then {
				_radius = _city getVariable ["spawnRadius", 200];
				_density = _city getVariable ["spawnDensity", 40];
				dayz_maxLocalZombies = _density;
				diag_log format ["MMMYUM: ZEDSYSTEM: player_spawnCheck | NearLocation = %1 | ToSpawn = %2 Zeds | PlayerPos = %3 | Radius = %4 | Density = %5",_name,_tempZedNum,locationPosition _nearestLoc,_radius,dayz_maxLocalZombies];
				[_city,10,_nearestLoc,_name,_radius] spawn building_spawnZombies;//no need for this, call zombie_generate modified for city level spawning
			};
		};
	} else {
	yum_playerCurrentLoc = "nolocation"; //this is not getting executed. 
	};
};