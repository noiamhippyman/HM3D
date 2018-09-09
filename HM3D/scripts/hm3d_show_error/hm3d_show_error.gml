/// @desc hm3d_show_error(eHM3DError,msg);
/// @arg eHM3DError,msg
var errLevel = argument0;
var msg = argument1;

switch (errLevel) {
	case eHM3DError.Warning:
		show_debug_message(string(msg))
	break;
	
	case eHM3DError.Error:
		show_error(string(msg),true);
	break;
	
	default:
		hm3d_show_error(eHM3DError.Error,"Bad error call! \nMissed error: " + string(msg));
	break;
}