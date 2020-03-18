script_version '1.0.0'
local dlstatus = require "moonloader".download_status

function main()
	while true do
		wait(0)
	end
end

function update()
    local updatePath = os.getenv('TEMP')..'\\Update.json'
    downloadUrlToFile("https://github.com/AndyGHF2/suphelper2.0/raw/master/test.json", updatePath, function(id, status, p1, p2)
        if status == dlstatus.STATUS_ENDDOWNLOADDATA then
            local file = io.open(updatePath, 'r')
            if file and doesFileExist(updatePath) then
                local info = decodeJson(file:read("*a"))
                file:close(); os.remove(updatePath)
                if info.version ~= thisScript().version then
                    lua_thread.create(function()
                        wait(2000)
                        sampAddChatMessage('Обнаружена новая версия. Попытка скачивания')
                        downloadUrlToFile("https://github.com/AndyGHF2/suphelper2.0/raw/master/TestUpdate.lua", thisScript().path, function(id, status, p1, p2)
                            if status == dlstatus.STATUS_ENDDOWNLOADDATA then
                                sampAddChatMessage('Обновление завершено. Версия:'..info.version)
                                thisScript():reload()
                            end
                        end)
                    end)
                else
                    sampAddChatMessage('Используется последняя версия')
                end
            end
        end
    end)
end
