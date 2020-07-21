add to the end :

if (LIFE_SETTINGS(getNumber,"items_dbLogging") isEqualTo 1) then {
  [(getPlayerUID player),_type,_amount,_price] remoteExecCall["DB_fnc_itemBuyLog",RSERV];
}
