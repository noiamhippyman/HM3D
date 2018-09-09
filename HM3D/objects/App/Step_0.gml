#region Moving Around
var cameraSpeed = 10 * (delta_time / 1000000);
if (keyboard_check(ord("W"))) {
	camera.position = vec3_add(camera.position,vec3_multiply(camera.forward,cameraSpeed));
}

if (keyboard_check(ord("S"))) {
	camera.position = vec3_subtract(camera.position,vec3_multiply(camera.forward,cameraSpeed));
}

if (keyboard_check(ord("A"))) {
	var camInvFront = vec3_cross(camera.forward,camera.up);
	camera.position = vec3_add(camera.position,vec3_multiply(vec3_normalize(camInvFront),cameraSpeed));
}
if (keyboard_check(ord("D"))) {
	var camInvFront = vec3_cross(camera.forward,camera.up);
	camera.position = vec3_subtract(camera.position,vec3_multiply(vec3_normalize(camInvFront),cameraSpeed));
}

if (keyboard_check(ord("E"))) {
	camera.position = vec3_subtract(camera.position,vec3_multiply(camera.up,cameraSpeed));
}

if (keyboard_check(ord("Q"))) {
	camera.position = vec3_add(camera.position,vec3_multiply(camera.up,cameraSpeed));
}
#endregion

#region Looking around
if (mouse_check_button_pressed(mb_left)) {
	window_mouse_set(mouseCenterX,mouseCenterY);
	firstMouse = true;
} else {

	if (firstMouse) {
		var mx = window_mouse_get_x();
		var my = window_mouse_get_y();
		var diffx = mx - mouseCenterX;
		var diffy = my - mouseCenterY;
		window_mouse_set(mouseCenterX,mouseCenterY);
		
		var baseMultiplier = 0.5;
		var mouseSensitivity = 0.5;
		camera.rotation[0] -= diffx * baseMultiplier * mouseSensitivity;
		camera.rotation[1] = clamp(camera.rotation[1] - diffy * baseMultiplier * mouseSensitivity,-89,89);
	
		if (mouse_check_button_released(mb_left)) {
			firstMouse = false;
		}
	}
	
}
#endregion

skin.spotLight[@0] = camera.position;
eyes.spotLight[@0] = camera.position;
keratin.spotLight[@0] = camera.position;

skin.spotLight[@1] = camera.forward;
eyes.spotLight[@1] = camera.forward;
keratin.spotLight[@1] = camera.forward;