Add at the end:

if (LIFE_SETTINGS(getNumber,"transfer_dbLogging") isEqualTo 1) then {
  [(getPlayerUID player),(getPlayerUID _unit),_value,BANK,CASH] remoteExecCall["DB_fnc_bankTransferLog",RSERV];
}
