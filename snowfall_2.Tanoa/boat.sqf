
if (isServer) then {

  _crewboat1 = creategroup EAST; 
  _boatDat1 = [getMarkerPos "_boat_spawn", 90, "O_T_Boat_Armed_01_hmg_F", _crewboat1] call BIS_fnc_spawnVehicle;

  _wpe1 = _crewboat1 addWaypoint [(getmarkerpos "_wpb1"), 0];
  _wpe1 setWaypointType "MOVE";
  _wpe1 setWaypointSpeed "FULL";
  _wpe1 setWaypointBehaviour "COMBAT";
  _wpe1 setWaypointCombatMode "RED";

  _wpe2 = _crewboat1 addWaypoint [(getmarkerpos "_wpb2"), 0];
  _wpe2 setWaypointType "MOVE";
  _wpe2 setWaypointSpeed "FULL";
  _wpe2 setWaypointBehaviour "COMBAT";
  _wpe2 setWaypointCombatMode "RED";

  _wpe3 = _crewboat1 addWaypoint [(getmarkerpos "_wpb3"), 0];
  _wpe3 setWaypointType "MOVE";
  _wpe3 setWaypointSpeed "FULL";
  _wpe3 setWaypointBehaviour "COMBAT";
  _wpe3 setWaypointCombatMode "RED";
  
  _wpe4 = _crewboat1 addWaypoint [(getmarkerpos "_wpb4"), 0];
  _wpe4 setWaypointType "MOVE";
  _wpe4 setWaypointSpeed "FULL";
  _wpe4 setWaypointBehaviour "COMBAT";
  _wpe4 setWaypointCombatMode "RED";
  
  _wpe5 = _crewboat1 addWaypoint [(getmarkerpos "_wpb5"), 0];
  _wpe5 setWaypointType "CYCLE";
  _wpe5 setWaypointSpeed "FULL";
  _wpe5 setWaypointBehaviour "COMBAT";
  _wpe5 setWaypointCombatMode "RED";
}