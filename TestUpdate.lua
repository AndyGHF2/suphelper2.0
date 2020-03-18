script_version("0.3")
local dlstatus = require('moonloader').download_status
local color = 0x348cb2
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

function main()
	update()
	while true do
	    wait(0)
		end
end

function update()
  local fpath = os.getenv('TEMP') .. '\\test.json' -- куда будет качаться наш файлик для сравнения версии
  downloadUrlToFile('https://github.com/AndyGHF2/suphelper2.0/raw/master/test.json', fpath, function(id, status, p1, p2)
    if status == dlstatus.STATUS_ENDDOWNLOADDATA then
    local f = io.open(fpath, 'r')
    if f then
      local info = decodeJson(f:read('*a'))
      updatelink = info.updateurl
      if info and info.latest then
        version = tonumber(info.latest)
        if version > tonumber(thisScript().version) then
          lua_thread.create(goupdate)
        else
          update = false
          sampAddChatMessage(('Установлена последняя версия'), color)
        end
      end
    end
  end
end)
end

function goupdate()
sampAddChatMessage(('Обнаружено обновление'), color)
sampAddChatMessage(('Обновление с '..thisScript().version.." до "..version), color)
wait(300)
downloadUrlToFile(updatelink, thisScript().path, function(id3, status1, p13, p23) -- качает ваш файлик с latest version
  if status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
  sampAddChatMessage(('Обновление завершено!'), color)
  thisScript():reload()
end
end)
end
