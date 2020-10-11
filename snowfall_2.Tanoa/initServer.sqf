
_canRun = true;
if (isServer) then {
  waitUntil{daytime >= 7.5 && _canRun};
  _canRun = false:
  execVM "convoy.sqf";
};