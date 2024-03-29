private["_unit","_targets","_move","_damage","_wound","_index","_cnt","_sound","_local","_dir","_hpList","_hp","_strH","_dam","_total","_vehicle","_tPos","_zPos","_cantSee","_inAngle"];
_unit = _this select 0;
_type = _this select 1;
_vehicle = (vehicle player);

_targets = _unit getVariable ["targets",[]];
//if (!(_vehicle in _targets)) exitWith {};

//Do the attack
if (r_player_unconscious && _vehicle == player && _type == "zombie") then {
	_rnd = round(random 4) + 1;
	_move = "ZombieFeed" + str(_rnd);
} else {
	if (_type == "zombie") then {
		_rnd = round(random 9) + 1;
		_move = "ZombieStandingAttack" + str(_rnd);
	} else {
		_move = "Dog_Attack";
	};
};
_dir = [_unit,_vehicle] call BIS_Fnc_dirTo;
_unit setDir _dir;
_unit playMove _move;

//Wait
sleep 0.3;

if (_vehicle != player) then {
	_hpList = 	_vehicle call vehicle_getHitpoints;
	_hp = 		_hpList call BIS_fnc_selectRandom;
	_wound = 	getText(configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "HitPoints" >> _hp >> "name");
	_damage = 	random 0.08;
	_chance =	round(random 12);
	
	if ((_chance % 4) == 0) then {
		_openVehicles = ["ATV_Base_EP1", "Motorcycle", "Bicycle"];
		{
			if (_vehicle isKindOf _x) exitWith {
				player action ["eject", _vehicle];
			};
		} forEach _openVehicles;
	};

	if ((_wound == "Glass1") or (_wound == "Glass2") or (_wound == "Glass3") or (_wound == "Glass4") or (_wound == "Glass5") or (_wound == "Glass6")) then {
		[_unit,"hit",4,false] call dayz_zombieSpeak;
		_strH = "hit_" + (_wound);
		_dam = _vehicle getVariable [_strH,0];
		_total = (_dam + _damage);

		//diag_log ("Hitpoints " +str(_wound) +str(_total));

		//["dayzHitV",[_vehicle, _wound,_total, _unit,"zombie"]] call broadcastRpcCallAll;
		if (_total >= 1) then {
			if (r_player_blood < (r_player_bloodTotal * 0.8)) then {
				_cnt = count (DAYZ_woundHit select 1);
				_index = floor (random _cnt);
				_index = (DAYZ_woundHit select 1) select _index;
				_wound = (DAYZ_woundHit select 0) select _index; 
			} else {
				_cnt = count (DAYZ_woundHit_ok select 1);
				_index = floor (random _cnt);
				_index = (DAYZ_woundHit_ok select 1) select _index;
				_wound = (DAYZ_woundHit_ok select 0) select _index; 
			};
			_damage = 0.2 + random (1.8);
			//diag_log ("START DAM: Player Hit on " + _wound + " for " + str(_damage));
			[player, _wound, _damage, _unit,"zombie"] call fnc_usec_damageHandler;
			//dayzHit =	[player,_wound, _damage, _unit,"zombie"];
			//publicVariable "dayzHit";
			[_unit,"hit",2,false] call dayz_zombieSpeak;	
		} else {
			//["dayzHitV",[_vehicle, _wound, _total, _unit,"zombie"]] call broadcastRpcCallAll;
			dayzHitV =	[_vehicle, _wound, _total, _unit,"zombie"];
			publicVariable "dayzHitV";
		};
	};
} else {
	//Did he hit?
	//_currentAnim = animationState _unit;
	//diag_log ("Animation state: " +(_currentAnim));
	//"amovpercmstpsnonwnondnon",
	_attackanimations = ["zombiestandingattack1","zombiestandingattack2","zombiestandingattack3","zombiestandingattack4","zombiestandingattack5","zombiestandingattack6","zombiestandingattack7","zombiestandingattack8","zombiestandingattack9","zombiestandingattack10","zombiefeed1","zombiefeed2","zombiefeed3","zombiefeed4","zombiefeed5"];
	if (((_unit distance player) <= 4) and ((animationState _unit) in _attackanimations)) then {
		/*
		//yum zombies hit you go prone
		if (!r_player_unconscious) then {
			_neckPos = (_vehicle selectionPosition "Neck") select 2;
			if (_neckPos < 0.6) then {
				//_isProne = true;
				cutText ["Knocked Down!", "PLAIN DOWN"];
				player playActionNow "Die";
				player switchMove "AmovPpneMstpSnonWnonDnon_healed";
			};
		}; */
		/* old attempt
		_playWeapo = currentWeapon player;
		if (_playWeapo != "") then {
			//type of weap find out then play appropriate prone move
			_typePlayWeapo = inheritsFrom (configFile >> "CfgWeapons" >> _playWeapo);
			_rifType = (configFile >> "CfgWeapons" >> "RifleCore");
			_pisType = (configFile >> "CfgWeapons" >> "PistolCore");
			_mgType = (configFile >> "CfgWeapons" >> "MGunCore");
			_launchType = (configFile >> "CfgWeapons" >> "LauncherCore");
			if ((_typePlayWeapo == _rifType) or (_typePlayWeapo == _mgType) or (_typePlayWeapo == _launchType)) then {player playMove "AidlPpneMstpSrasWrflDnon01";};
			if (_typePlayWeapo == _pisType) then {player playMove "AidlPpneMstpSrasWpstDnon01";};
		} else { player playMove "AidlPpneMstpSnonWnonDnon01";};
		*/
		//check LOS
		//private[];
		_tPos = (getPosASL _vehicle);
		_zPos = (getPosASL _unit);
		_inAngle = [_zPos,(getdir _unit),50,_tPos] call fnc_inAngleSector;
		if (_inAngle) then {
			//LOS check
			_cantSee = [_unit,_vehicle] call dayz_losCheck;
			if (!_cantSee) then {
				if (r_player_blood < (r_player_bloodTotal * 0.8)) then {
					_cnt = count (DAYZ_woundHit select 1);
					_index = floor (random _cnt);
					_index = (DAYZ_woundHit select 1) select _index;
					_wound = (DAYZ_woundHit select 0) select _index; 
				} else {
					_cnt = count (DAYZ_woundHit_ok select 1);
					_index = floor (random _cnt);
					_index = (DAYZ_woundHit_ok select 1) select _index;
					_wound = (DAYZ_woundHit_ok select 0) select _index; 
				};
				_damage = 0.2 + random (1.9);
					
				//diag_log ("START DAM: Player Hit on " + _wound + " for " + str(_damage));
				[player, _wound, _damage, _unit,"zombie"] call fnc_usec_damageHandler;
				//dayzHit =	[player,_wound, _damage, _unit,"zombie"];
				//publicVariable "dayzHit";
				[_unit,"hit",2,false] call dayz_zombieSpeak;
			} else {
				/*
				_isZombieInside = [_unit,_building] call fnc_isInsideBuilding;
				if (_isPlayerInside) then {
					_damage = 0.2 + random (1.9);
					//diag_log ("START DAM: Player Hit on " + _wound + " for " + str(_damage));
					[player, _wound, _damage, _unit,"zombie"] call fnc_usec_damageHandler;
					//dayzHit =	[player,_wound, _damage, _unit,"zombie"];
					//publicVariable "dayzHit";
					[_unit,"hit",2,false] call dayz_zombieSpeak;	
				};
				*/
			};
		};
	};
};