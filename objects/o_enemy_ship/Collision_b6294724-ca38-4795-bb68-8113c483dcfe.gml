//bounce off other ships
_bounce_direction = point_direction(other.x, other.y, x, y)
motion_add(_bounce_direction, 1)

