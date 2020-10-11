
_convoy_spawn_bearing = 231;
_convoy_spacing_sleep = 9;
_convoy_speed = 20;

//creates a convoyWayPoint 
createConvoyWP={
  private ["markerPos", "group"];
  _markerPos = _this select 0;
  _group = _this select 1;
  
  _wp = (_group) addWaypoint [(getmarkerpos _markerPos), 0];
  _wp setWaypointType "MOVE";
  _wp setWaypointSpeed "LIMITED";
  _wp setWaypointFormation "COLUMN";
  _wp setWaypointBehaviour "COMBAT";
  _wp setWaypointCombatMode "RED";
  
  //return the new waypoint
  _wp;
};

//creates a convoy vehicle
createConvoyUnit ={
    private ["_type"];
    _type = _this select 0;
    
    _tmpGrp = createGroup [EAST, true];
    
    private _localData = [];
    private _vehicle = [];
    switch (_type) do {
      case "tek": { 
        _localData = [getMarkerPos "_convoySpawn", _convoy_spawn_bearing, "rhsgref_tla_offroad_armed", _tmpGrp] call BIS_fnc_spawnVehicle
      };
      case "troop": {
        _localData = [getMarkerPos "_convoySpawn", _convoy_spawn_bearing, "rhsgref_tla_offroad", _tmpGrp] call BIS_fnc_spawnVehicle; 
        _guardGrp = [getmarkerpos "_guardSpawn", EAST, ["rhsgref_tla_rifleman", "rhsgref_tla_rifleman", "rhsgref_tla_rifleman", "rhsgref_tla_rifleman"],[],[],[],[],[],_convoy_spawn_bearing] call BIS_fnc_spawnGroup;
        _guardGrp enableAttack true;
        sleep .5;
        _vehicle = _localData select 0;
        { _x assignAsCargo _vehicle; _x moveInAny _vehicle;} foreach units _guardGrp;
      };
      default { //cargo truck
        _localData = [getMarkerPos "_convoySpawn", _convoy_spawn_bearing, "rhsgref_tla_offroad", _tmpGrp] call BIS_fnc_spawnVehicle;
        _cargo = "CargoNet_01_barrels_F" createVehicle (getMarkerPos "_guardSpawn");
        _cargo setDir 90;
        sleep .5;
        _vehicle = _localData select 0;
        _cargo attachTo [_vehicle,[.1,-2,-.05]]
      };
    };
    
    //handy vars if not set above
   _vehicle = _localData select 0;    
   _vhlGrp = _localData select 2;
  
    //limit vehicle speeds
   _vehicle limitSpeed _convoy_speed;
   
   //stay on the road
   _vehicle forceFollowRoad true;
   
   //enable combat responses
   _vhlGrp enableAttack true;
   _vehicle setUnloadInCombat [true, false];
   
  //give convoy members a set of waypoints
  ["_cwp1", _vhlGrp] call createConvoyWP;
  ["_cwp2", _vhlGrp] call createConvoyWP;
  ["_cwp3", _vhlGrp] call createConvoyWP;
  ["_cwp4", _vhlGrp] call createConvoyWP;
  ["_cwp5", _vhlGrp] call createConvoyWP;
  ["_cwp6", _vhlGrp] call createConvoyWP;
  ["_cwp7", _vhlGrp] call createConvoyWP;
  ["_cwp8", _vhlGrp] call createConvoyWP;
  ["_cwp9", _vhlGrp] call createConvoyWP;
  ["_cwp10", _vhlGrp] call createConvoyWP;
  ["_cwp11", _vhlGrp] call createConvoyWP;
  ["_cwp12", _vhlGrp] call createConvoyWP;
  
  //return the [vehicle,crew,group] from the spawn function
  _vhlGrp;  
};

//only run on the serving machine, not each local game instance
if (isServer) then {
  _tekLead = ["tek"] call createConvoyUnit;
  sleep _convoy_spacing_sleep;
  _truck1 = ["troop"] call createConvoyUnit;
  sleep _convoy_spacing_sleep;
  _truck2 = ["troop"] call createConvoyUnit;
  sleep _convoy_spacing_sleep;
  _truck3 = ["troop"] call createConvoyUnit;
  sleep _convoy_spacing_sleep;
  _truckCargo = ["cargo"] call createConvoyUnit;
  sleep _convoy_spacing_sleep;
  _truck4 = ["troop"] call createConvoyUnit;
  sleep _convoy_spacing_sleep +3;
  _truck4 = ["troop"] call createConvoyUnit;
  sleep _convoy_spacing_sleep + 6;
  _truck6 = ["troop"] call createConvoyUnit;
  sleep _convoy_spacing_sleep + 9;
  _tekFollow = ["tek"] call createConvoyUnit;
};

