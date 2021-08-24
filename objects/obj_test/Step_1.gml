input_tick();
input_hotswap_tick();

var _size    = gamepad_get_device_count();
var _delta   = (input_keyboard_check_pressed(vk_down) - input_keyboard_check_pressed(vk_up));
var _gamepad = 0;

repeat(gamepad_get_device_count())
{
    if gamepad_is_connected(_gamepad) break;
    ++_gamepad;
}

if (__INPUT_ON_CONSOLE || __INPUT_ON_MOBILE)
    _delta = (input_mouse_check_pressed(mb_left) 
             || (gamepad_is_connected(_gamepad) && input_gamepad_check_pressed(_gamepad, gp_face1) && input_gamepad_check(_gamepad, gp_shoulderr)));

test_index = (test_index + _delta + _size) mod max(1, _size);