_crew1 = [];
_crew2 = [];
_airframe1 = [];
_airframe2 = [];
_qrf_group1 = [];
_qrf_group2 = [];

if (isServer) then {

  _crew1 = creategroup EAST; 
  _airframe1 = [getMarkerPos "_heli_spawn", 180, "rhsgref_ins_Mi8amt", _crew1] call BIS_fnc_spawnVehicle;

  _wp1 = _crew1 addWaypoint [(getmarkerpos "_heli_land1"), 0];
  _wp1 setWaypointType "TR UNLOAD";
  _wp1 setWaypointSpeed "Full";
  _wp1 setwaypointstatements ["this land 'land'"];

  _wp2 = _crew1 addWaypoint [(getmarkerpos "_heli_2"), 0];
  _wp2 setWaypointType "MOVE";
  _wp2 setWaypointSpeed "LIMITED";

  _wp3 = _crew1 addWaypoint [(getmarkerpos "_heli_3"), 0];
  _wp3 setWaypointType "LOITER";
  _wp3 setWaypointSpeed "FULL";
  
  
  _qrf_group1 = [getmarkerpos "_heli_spawn", EAST, ["rhsgref_tla_rifleman", "rhsgref_tla_rifleman", "rhsgref_tla_rifleman", "rhsgref_tla_rifleman",
  "rhsgref_tla_rifleman","rhsgref_tla_rifleman"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
  _wp4 = _qrf_group1 addWaypoint [getmarkerpos "_block_pos1", 0];
  _wp5 = _qrf_group1 addWaypoint [getmarkerpos "_block_pos2", 0];
  _wp6 = _qrf_group1 addWaypoint [getmarkerpos "_block_pos3", 0];
  _wp7 = _qrf_group1 addWaypoint [getmarkerpos "_block_pos4", 0];

  sleep .5;
  _qrf_group1 = _qrf_group1;
  { _x assignAsCargo (_airframe1 select 0); _x moveIncargo (_airframe1 select 0);} foreach units _qrf_group1;
  
  sleep 10;
    _crew2 = creategroup EAST; 
  _airframe2 = [getMarkerPos "_heli_spawn", 180, "rhsgref_ins_Mi8amt", _crew2] call BIS_fnc_spawnVehicle;

  _wp8 = _crew2 addWaypoint [(getmarkerpos "_heli_land2"), 0];
  _wp8 setWaypointType "TR UNLOAD";
  _wp8 setWaypointSpeed "FULL";
  _wp8 setwaypointstatements ["this land 'land'"];

  _wp9 = _crew2 addWaypoint [(getmarkerpos "_heli_2"), 0];
  _wp9 setWaypointType "MOVE";
  _wp9 setWaypointSpeed "LIMITED";

  _wp10 = _crew2 addWaypoint [(getmarkerpos "_heli_3"), 0];
  _wp10 setWaypointType "LOITER";
  _wp10 setWaypointSpeed "FULL";
  
  
  _qrf_group2 = [getmarkerpos "_heli_spawn", EAST, ["rhsgref_tla_rifleman", "rhsgref_tla_rifleman", "rhsgref_tla_rifleman", "rhsgref_tla_rifleman",
  "rhsgref_tla_rifleman","rhsgref_tla_rifleman"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
  _wp11 = _qrf_group2m addWaypoint [getmarkerpos "_block_pos5", 0];

  sleep .5;
  _qrf_group2 = _qrf_group2;
  { _x assignAsCargo (_airframe2 select 0); _x moveIncargo (_airframe2 select 0);} foreach units _qrf_group2;
};

