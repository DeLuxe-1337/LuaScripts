task.spawn(
    function()
        while wait() do
            if _G.HOUR >= 1 or _G.MINUTE >= 1 or _G.SECOND >= 1 then
                local final_time = (_G.HOUR * 3600) + (_G.MINUTE * 60) + _G.SECOND
                local current_time = os.time()

                while os.time() - current_time < final_time and wait() do
                    final_time = (_G.HOUR * 3600) + (_G.MINUTE * 60) + _G.SECOND
                    
                    local elapsed = os.time() - current_time
                    _G.ElapsedText.Text = "Elapsed: " .. elapsed .. "/" .. final_time
                end

                if _G.HOUR >= 1 or _G.MINUTE >= 1 or _G.SECOND >= 1 then
                    print("Finished!")
                    game:Shutdown()
                end
            end
        end
    end
)
