////////////////////////////////////////////////////////////////////////////////mmmyum
private ["_center","_allBldngs","_type","_config","_canLoot","_handle","_debugA","_countBldngs","_debugB","_debugC"];
	
	diag_log("MMMYUM: INIT: BEGIN PermaLootSpawn...");
	_debugC = 1;
	_center = [6143.6,7721.5,1];//stary coords, centerish
	_debugA = count _center;
	_debugB = _center select 0;
	
	diag_log format ["MMMYUM: INIT: CENTER:| %1 | COUNT:| %2 | POS 0:| %3",_center,_debugA,_debugB];
	_allBldngs = _center nearObjects ["building",20000];
	_countBldngs = count _allBldngs;
	
	diag_log format ["MMMYUM: INIT: BLDNGS:| COUNT:| %1 | ",_countBldngs];
	{
		_type = typeOf _x;
		_config = configFile >> "CfgBuildingLoot" >> _type;
		_canLoot = isClass (_config);
		if (_canLoot) then {
			_handle = [_x] execVM "fixes\building_spawnLoot.sqf";
			waitUntil{scriptDone _handle};
			_x setVariable ["permaLoot",true];
		};
		_debugC = _debugC + 1;
	} forEach _allBldngs;
	
	//use this line for all locations? "" call bis_fnc_locations
	yum_locations = [["NameCityCapital","NameCity","NameVillage","NameLocal"],[_center,25000]] call BIS_fnc_locations; 
	publicVariable "yum_locations";
	
	_num = 200;
	_radius = 200;
	_density = 40;
	
	{
		_nearestLoc = (nearestLocations [getPos _x, ["NameCityCapital","NameCity","NameVillage","NameLocal","Airport"], 50]) select 0;
		switch (type _nearestLoc) do {
			case "NameCityCapital": {
				_num = 800;
				_radius = 1200;
				_density = 80;
			};
			case "NameCity": {
				_num = 400;
				_radius = 800;
				_density = 60;
			};
			case "NameVillage": {
				_num = 200;
				_radius = 400;
				_density = 40;
			};
			case "NameLocal": {
				_num = 100;
				_radius = 400;
				_density = 30;
			};
			case "Airport": {
				_num = 400;
				_radius = 600;
				_density = 60;
			};
		};
		_tempName = _x getVariable ["name","nil"];
		Diag_log (format ["Assigning %1 zombies to %2 with spawn radius of %3 m and density %4 ...", _num, _tempName, _radius, _density]);
		_x setVariable ["numZombies", _num, true];
		_x setVariable ["spawnRadius", _radius, true];
		_x setVariable ["spawnDensity", _density, true];

		sleep 0.01;
	} foreach yum_locations;
	
	yum_locations_index = [];
	_iCnt = 0;
	{
		_tempName = _x getVariable ["name","nil"];
		yum_locations_index set [_iCnt,_tempName];
		_iCnt = _iCnt + 1;
	} forEach yum_locations;
	publicVariable "yum_locations_index";
	
	diag_log format ["MMMYUM: INIT: END: PermaSpawn INIT loot times cycled:| %1 | locations count %2",_debugC,(count yum_locations)];
	exit
////////////////////////////////////////////////////////////////////////////////mmmyum
