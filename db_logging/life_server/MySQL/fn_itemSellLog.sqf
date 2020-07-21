/*
    File: fn_itemSellLog.sqf
    Author: Feziyk
    Teamspeak 3: ts.heavenlife.fr
    Web site: https://heavenlife.fr

    Description:
    Log sell of items to database.
*/
params [
  "_pid",
  "_item",
  "_amount",
  "_price"
];

_query = format ["INSERT INTO items (pid, action, item, amount, price) VALUES ('%1','%2','%3','%4','%5')",_pid,1,_item,[_amount] call DB_fnc_numberSafe,[_price] call DB_fnc_numberSafe];
[_query,1] call DB_fnc_asyncCall;
