/*
 * Author: Katalam
 * Overstretch the head of the patient for airway management without items
 *
 * Arguments:
 * 0: The soldier <OBJECT>
 * 1: The patient <OBJECT>
 *
 *
 * Return Value:
 * True
 *
 * Example:
 * [bob1, bob2] call kat_aceAirway_fnc_treatmentAdvanced_overstretchHead
 *
 * Public: No
 */

params ["_player", "_target"];

if (_target getVariable ["kat_aceAirway_overstretch", false]) exitWith {
   _output = localize "STR_kat_aceAirway_Airway_already";
   [_output, 2, _caller] call ace_common_fnc_displayTextStructured;
   false;
};
if !(_target getVariable ["ace_medical_airwayCollapsed", false]) exitWith {
   _output = localize "STR_kat_aceAirway_Airway_NA";
   [_output, 2, _caller] call ace_common_fnc_displayTextStructured;
   false;
};

_target setVariable ["kat_aceAirway_overstretch", true, true];

_output = localize "STR_kat_aceAirway_overstretch_info";
[_output, 2, _player] call ace_common_fnc_displayTextStructured;

[{
  params ["_player", "_target"];
  (_target distance2D _player) > 5;
}, {
  params ["_player", "_target"];
  _target setVariable ["kat_aceAirway_overstretch", false, true];
  _output = localize "STR_kat_aceAirway_overstretch_cancel";
  [_output, 1.5, _player] call ace_common_fnc_displayTextStructured;
}, [_player, _target], 120, {
  params ["_player", "_target"];
  _target setVariable ["kat_aceAirway_overstretch", false, true];
  _output = localize "STR_kat_aceAirway_overstretch_cancel";
  [_output, 1.5, _player] call ace_common_fnc_displayTextStructured;
}] call CBA_fnc_waitUntilAndExecute;
