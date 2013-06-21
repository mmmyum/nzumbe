/*
INITILIZATION
*/
startLoadingScreen ["","DayZ_loadingScreen"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance = 1;//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;
_logistic = execVM "=BTC=_Logistic\=BTC=_Logistic_Init.sqf";

//Load in compiled functions
//call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
call compile preprocessFileLineNumbers "fixes\variables.sqf";  //YUM
//variables = compile preprocessFileLineNumbers "fixes\variables.sqf"; //YUM
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
//call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";				//Compile regular functions
//my changes /////////////////////////////////custom overrides
call compile preprocessFileLineNumbers "fixes\compiles.sqf"; //Compile regular functions
zombie_findTargetAgent = compile preprocessFileLineNumbers "fixes\zombie_findTargetAgent.sqf";
zombie_generate = compile preprocessFileLineNumbers "fixes\zombie_generate.sqf";
building_spawnZombies = compile preprocessFileLineNumbers "fixes\building_spawnZombies.sqf";
player_spawnCheck = compile preprocessFileLineNumbers "fixes\player_spawnCheck.sqf";
player_zombieCheck = compile preprocessFileLineNumbers "fixes\player_zombieCheck.sqf";
player_zombieAttack = compile preprocessFileLineNumbers "fixes\player_zombieAttack.sqf";
zombie_findOwner = compile preprocessFileLineNumbers "fixes\zombie_findOwner.sqf";
//building_REspawnZombies = compile preprocessFileLineNumbers "fixes\building_REspawnZombies.sqf";
stream_locationCheck = {};
player_wearClothes = compile preprocessFileLineNumbers "fixes\player_wearClothes.sqf";
//end
player_knockedDown = compile preprocessFileLineNumbers "fixes\player_knockedDown.sqf";
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";
player_spawn_2 = compile preprocessFileLineNumbers "fixes\player_spawn_2.sqf"; //YUM
yum_findMidPos = compile preprocessfilelinenumbers "fixes\yum_findMidPos.sqf";
if ((!isServer) && (isNull player) ) then
{
waitUntil {!isNull player};
waitUntil {time > 3};
};

if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
  waitUntil {time > 3};
};

if (isServer) then {
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
	//AI stuff
	_dayzFactions = [] execVM "Dayz_Factions\init.sqf";
    //diag_log format["Dayz Factions executed: %1",_dayzFactions];
    //Array to pass to .sqf: [[<worldspace>],radius of waypoints (in metres),number of waypoints,number of ai units]
    _aispawn = [[6689.49,2623.59,0],160,8,4] execVM "units\add_unit_server.sqf";//Chernogorsk
    //_aispawn = [[7622.51,7912.7,0],5000,20,6] execVM "units\add_unit_server.sqf";//Chernaurs (Whole map)
    //_aispawn = [[7625.51,7915.7,0],5000,20,6] execVM "units\add_unit_server.sqf";//Chernaurs (Whole map)
    _aispawn = [[4598.66,10197.7,0],650,12,4] execVM "units\add_unit_server.sqf";//NW Airfield
    _aispawn = [[10447.5,2246.96,0],180,3,3] execVM "units\add_unit_server.sqf";//Electrozavodsk
	_aispawn = [[1905.5612,6198.8955,0],80,3,8] execVM "units\add_unit_server_band.sqf";//banditbase EVIL	
	//lights
	axe_server_lampObjs =    compile preprocessFileLineNumbers "lights\fnc_returnLampWS.sqf";
	"axeLampObjects" addPublicVariableEventHandler {_id = (_this select 1) spawn axe_server_lampObjs};
};

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	//lights
	[] execVM "lights\street_lights.sqf";
	//weather
	[] execVM "Scripts\effects.sqf";
	//autorefuel
	[] execVM "Scripts\kh_actions.sqf";
	//radioplayeryum
	[] execVM "mmmyum_bomb.sqf";
	_playerMonitor = 	[] execVM "fixes\player_monitor.sqf";
	/*
	    "heliCrash" addPublicVariableEventHandler {
        _list = nearestObjects [_this select 1, ["CraterLong"], 100];
        {deleteVehicle _x;} foreach _list;
    };*/
	_devs = ["48467270","17419974","121875654","113609606","117308230"];
	 if (getPlayerUID player in _devs) then
		{
			[] execVM "mmmyum\radio\commsMenu.sqf";
		};

};


/*
////////////////////////YUM PORT GeneralCarver Pack Cow Script
//non-JIP player, someone who's went through role selection and briefing
if (!(isNull player)) then 
	{
	// =============================================================
	// GC Ammo Cow Script

	gc_script_pack_cow_client_object_manager = execVM "scripts\gc_pack_cow\client_object_manager.sqf";
	gc_script_pack_cow_client_action_manager = execVM "scripts\gc_pack_cow\action_manager.sqf";

	gc_pack_cow_move_request = false;
	gc_pack_cow_order_cow_stop = false;
	gc_pack_cow_move_point = [0,0,0];

	// End GC Ammo Cow Script
	// =============================================================
	};

//JIP player, role selection then right into mission.
if (!isServer && isNull player) then 
	{
	waitUntil {!isNull player};

	// =============================================================
	// GC Ammo Cow Script

	gc_script_pack_cow_client_object_manager = execVM "scripts\gc_pack_cow\client_object_manager.sqf";
	gc_script_pack_cow_client_action_manager = execVM "scripts\gc_pack_cow\action_manager.sqf";

	gc_pack_cow_move_request = false;
	gc_pack_cow_order_cow_stop = false;
	gc_pack_cow_move_point = [0,0,0];

	// End GC Ammo Cow Script
	// =============================================================
	};

//server
if (isServer) then 
	{
	gc_pack_cow_move_request = false;
	gc_pack_cow_order_cow_stop = false;
	gc_pack_cow_move_point = [0,0,0];

	gc_script_pack_cow_client_move_manager = execVM "scripts\gc_pack_cow\cow_move_manager.sqf";
	gc_script_pack_cow_client_ai_manager = execVM "scripts\gc_pack_cow\cow_ai_manager.sqf";
	};
	*/