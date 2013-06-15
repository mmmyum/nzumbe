//yum_findMidPos = compile preprocessfilelinenumbers "mmmyum/radio/_compile/yum_findMidPos.sqf"
//call like - _posC = [_posA,_posB,_mX] call yum_findMidPos;
// calcualte posC that is mX distance from posA 
// in the direction of posB 

_posA = _this select 0;
_posB = _this select 1;
_mX = _this select 2;

// unit vector representing the direction of posB at posA 
_dirVector = [_posA,_posB] call BIS_fnc_vectorFromXToY; 
// multiply by desired magnitude mX 
_transform = [_dirVector,_mX] call BIS_fnc_vectorMultiply; 
// add transform vector to posA 
_posC = [_posA,_transform] call BIS_fnc_vectorAdd;  
_posC