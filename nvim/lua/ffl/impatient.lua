local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
	return
end

if impatient ~= nil then impatient.enable_profile() end
