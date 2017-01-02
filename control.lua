function on_put_item_handler(t)
  local player = game.players[t.player_index]
  local place_result = player.cursor_stack.prototype.place_result
  if place_result then
    -- player.print({"", "(name = ", place_result.name, ")"})
    local placed = player.surface.find_entities_filtered{position = t.position}[1]
    if placed then
      -- player.print({"", "(name = ", placed.name, ")"})
      -- player.print({"", "(position.x = ", placed.position.x, ")"})
      -- player.print({"", "(position.y = ", placed.position.y, ")"})
      if placed.name == "entity-ghost" then
        -- player.print({"", "(name = ", placed.ghost_name, ")"})
        if placed.ghost_name == place_result.name then
          player.remove_item({name = player.cursor_stack.name})
          placed.revive()
        end
      end
    else
      -- player.print({"", "(entity_already_placed = nil)"})
    end
  else
    -- player.print({"", "(place_result = nil)"})
  end
end
script.on_event(defines.events.on_put_item, on_put_item_handler)
