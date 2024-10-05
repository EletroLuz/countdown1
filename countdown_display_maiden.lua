local countdown_display_maiden = {}

local color_red = color.new(255, 0, 0, 255)
local color_white = color.new(255, 255, 255, 255)

local countdown_active = false

function countdown_display_maiden.start_countdown()
    countdown_active = true
end

function countdown_display_maiden.stop_countdown()
    countdown_active = false
end

function countdown_display_maiden.is_active()
    return countdown_active
end

function countdown_display_maiden.update_and_draw(remaining_time)
    if not countdown_active then return end

    if remaining_time <= 0 then
        countdown_active = false
        return true -- Indica que a contagem regressiva terminou
    end

    local local_player = get_local_player()
    if not local_player then return false end

    local player_pos = local_player:get_position()
    local screen_pos = graphics.w2s(player_pos)

    if screen_pos then
        local text_pos = vec2.new(screen_pos.x - 80, screen_pos.y - 240)
        
        graphics.text_2d("Helltide termina em:", text_pos, 30, color_white)
        
        text_pos.y = text_pos.y + 40
        local minutes = math.floor(remaining_time / 60)
        local seconds = math.floor(remaining_time % 60)
        graphics.text_2d(string.format("%02d:%02d", minutes, seconds), text_pos, 40, color_red)
    end

    return false -- Indica que a contagem regressiva ainda está em andamento
end

return countdown_display_maiden