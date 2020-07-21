/*
    File: fn_bankWithdrawLog.sqf
    Author: Feziyk
    Teamspeak 3: ts.heavenlife.fr
    Web site: https://heavenlife.fr

    Description:
    Log bank withdraw to database.
*/
params [
  "_pid",
  "_value",
  "_bankacc",
  "_cash"
];

_query = format ["INSERT INTO transactions (pid, receiver, action, amount, bankacc, cash) VALUES ('%1','%2','%3','%4','%5','%6')",_pid,_pid,2,[_value] call DB_fnc_numberSafe,[_bankacc] call DB_fnc_numberSafe,[_cash] call DB_fnc_numberSafe];
[_query,1] call DB_fnc_asyncCall;
