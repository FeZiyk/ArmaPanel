/*
    File: fn_whoDineIt.sqf
    Author: Feziyk
    Teamspeak 3: ts.heavenlife.fr
    Web site: https://heavenlife.fr

    Description:
    Log death to database.
*/
params [
    ["_victim",objNull,[objNull]],
    ["_killer",objNull,[objNull]]
];

if (isServer) then {
    private ["_killerWep","_killerVeh","_distance","_message"];
    if (isNull _victim || isNull _killer) exitWith {};

    _killerWep = currentWeapon _killer;
    _killerVeh = vehicle _killer;
    _distance = _killer distance _victim;
    _distance = floor(_distance);

    if (_victim == _killer) then {
        [(getPlayerUID _victim),(getPlayerUID _victim),"Suicide",0] call DB_fnc_deathLog;
    } else {
        if (_killerVeh isKindOf "Car" || _killerVeh isKindOf "Air") then {
            if (_killerVeh isKindOf "Car") then {
                [(getPlayerUID _victim),(getPlayerUID _killer),(getText(configFile >> "CfgVehicles" >> (typeOf _killerVeh) >> "displayName")),0] call DB_fnc_deathLog;
            };
            if (_killerVeh isKindOf "Air") then {
                [(getPlayerUID _victim),(getPlayerUID _killer),(getText(configFile >> "CfgVehicles" >> (typeOf _killerVeh) >> "displayName")),0] call DB_fnc_deathLog;
            };
        } else {
            if (_killerWep != "") then {
                [(getPlayerUID _victim),(getPlayerUID _killer),(getText(configFile >> "cfgWeapons" >> _killerWep >> "displayName")),_distance] call DB_fnc_deathLog;
            } else {
                [(getPlayerUID _victim),(getPlayerUID _killer),"Inconnu",0] call DB_fnc_deathLog;
            }
        };
    };
};
