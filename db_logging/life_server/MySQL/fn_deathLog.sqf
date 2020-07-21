/*
    File: fn_deathLog.sqf
    Author: Feziyk
    Teamspeak 3: ts.heavenlife.fr
    Web site: https://heavenlife.fr

    Description:
    Log death to database.
*/
params [
  "_killed",
  "_killer",
  "_weapon",
  "_distance"
];

diag_log "Death !";

_query = format ["INSERT INTO death (killed, killer, weapon, distance) VALUES ('%1','%2','%3','%4')",_killed,_killer,_weapon,[_distance] call DB_fnc_numberSafe];
[_query,1] call DB_fnc_asyncCall;
