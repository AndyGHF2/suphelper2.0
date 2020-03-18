local dlstatus = require('moonloader').download_status

function update()
  local fpath = os.getenv('TEMP') .. '\\testing_version.json' -- ���� ����� �������� ��� ������ ��� ��������� ������
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
          sampAddChatMessage(('����������� ��������� ������'), color)
        end
      end
    end
  end
end)
end

function goupdate()
sampAddChatMessage(('���������� ����������'), color)
sampAddChatMessage(('���������� � '..thisScript().version.." �� "..version), color)
wait(300)
downloadUrlToFile(updatelink, thisScript().path, function(id3, status1, p13, p23) -- ������ ��� ������ � latest version
  if status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
  sampAddChatMessage(('���������� ���������!'), color)
  thisScript():reload()
end
end)
end
