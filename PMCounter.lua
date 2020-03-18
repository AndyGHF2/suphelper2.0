script_name("PM Counter")
script_author("AndyG/Raduga")
script_version(0.1)
require "lib.moonloader"
local sampev = require "lib.samp.events"
local imgui = require 'imgui'
local key = require 'vkeys'
local inicfg = require 'inicfg'
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

local iniDir = "moonloader\\config\\PMCounter.ini"
local iniData = inicfg.load(nil, iniDir)
--local checkbox1 = imgui.ImBool(iniData.Data.countPM)
local addCounter = 0
local main_window_state = imgui.ImBool(false)

--[[ imgui.OnDrawFrame()
  if main_window_state.v then
    imgui.SetNextWindowSize(imgui.ImVec2(390, 250), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowPos(imgui.ImVec2(1094, 795), imgui.Cond.FirstUseEver)
		imgui.Begin(u8'PM Counter ', main_window_state, 2)


		if imgui.Checkbox(u8'Счетчик ответов', checkbox1) then
			iniData.Data.CountPM = not iniData.Data.CountPM
			inicfg.save(iniData, iniDir)
			if iniData.Data.CountPM then
				sampAddChatMessage('[{1E90FF}LUA{FFFFFF}] Счетчик ответов {33aa33}включен', -1)
			else
				sampAddChatMessage('[{1E90FF}LUA{FFFFFF}] Счетчик ответов {FF6347}отключен', -1)
			end
		end
		imgui.End()
	end
end
]]
function main()
	autoupdate("https://github.com/AndyGHF2/suphelper2.0/raw/master/PMCounterUpd.json", '['..string.upper(thisScript().name)..']: ', "https://github.com/AndyGHF2/suphelper2.0/raw/master/PMCounterUpd.json")
  while true do
    wait(0)
		if wasKeyPressed(66) and not sampIsChatInputActive() and not sampIsDialogActive() then
    	main_window_state.v = not main_window_state.v
		end
    imgui.Process = main_window_state.v
  end
end

--[[function sampev.onServerMessage(color, text)
	if color == ///// then
		if text:find('/////') then
			value=text:match('/////')
			addCounter = addCounter + 1
    		iniData.Settings.valueOfEditedAds = iniData.Settings.valueOfEditedAds + 1
    		inicfg.save(iniData, iniDir)
    	end
    end
end]]

--[[function apply_custom_style()
 imgui.SwitchContext()
 local style = imgui.GetStyle()
 local colors = style.Colors
 local clr = imgui.Col
 local ImVec4 = imgui.ImVec4

 style.WindowRounding = 2.0
 style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
 style.ChildWindowRounding = 2.0
 style.FrameRounding = 2.0
 style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
 style.ScrollbarSize = 13.0
 style.ScrollbarRounding = 0
 style.GrabMinSize = 8.0
 style.GrabRounding = 1.0

 colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
 colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
 colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
 colors[clr.TitleBg]                = ImVec4(0.16, 0.29, 0.48, 1.00)
 colors[clr.TitleBgActive]          = ImVec4(0.16, 0.29, 0.48, 1.00)
 colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
 colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
 colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
 colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
 colors[clr.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40)
 colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
 colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
 colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
 colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
 colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
 colors[clr.Separator]              = colors[clr.Border]
 colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
 colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
 colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
 colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
 colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
 colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
 colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
 colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
 colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
 colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
 colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
 colors[clr.ComboBg]                = colors[clr.PopupBg]
 colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
 colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
 colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
 colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
 colors[clr.ScrollbarGrab]          = ImVec4(0.11, 0.11, 0.11, 1.00)
 colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
 colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
 colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
 colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
 colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
 colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
 colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
 colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
 colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
 colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end
apply_custom_style()
]]
function autoupdate(json_url, prefix, url)
  local dlstatus = require('moonloader').download_status
  local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
  if doesFileExist(json) then os.remove(json) end
  downloadUrlToFile(json_url, json,
    function(id, status, p1, p2)
      if status == dlstatus.STATUSEX_ENDDOWNLOAD then
        if doesFileExist(json) then
          local f = io.open(json, 'r')
          if f then
            local info = decodeJson(f:read('*a'))
            updatelink = info.updateurl
            updateversion = info.latest
            f:close()
            os.remove(json)
            if updateversion ~= thisScript().version then
              lua_thread.create(function(prefix)
                local dlstatus = require('moonloader').download_status
                local color = -1
                sampAddChatMessage((prefix..'Обнаружено обновление. Начало обновивления c '..thisScript().version..' на '..updateversion), color)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('Загружено %d из %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      print('Загрузка обновления завершена.')
                      sampAddChatMessage((prefix..'Обновление завершено!'), color)
                      goupdatestatus = true
                      lua_thread.create(function() wait(500) thisScript():reload() end)
                    end
                    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                      if goupdatestatus == nil then
                        sampAddChatMessage((prefix..'Обновление прошло неудачно. Запуск устаревшей версии..'), color)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
              print('v'..thisScript().version..': Обновление не требуется.')
            end
          end
        else
          print('v'..thisScript().version..': Ошибка при проверке наличии обновления. Проверьте самостоятельно на '..url)
          update = false
        end
      end
    end
  )
  while update ~= false do wait(100) end
end
