/* eslint no-unused-vars: "off" */
const global = require("./global")
const os_name = global.OS_NAME
const total_memory = global.TOTAL_MEMORY
const available_parallelism = global.AVAILABLE_PARALLELISM
const basic_human_rights = {
  memory_windows: global.BASIC_HUMAN_RIGHTS.memory.windows,
  memory_linux: global.BASIC_HUMAN_RIGHTS.memory.linux,
  available_parallelism: global.BASIC_HUMAN_RIGHTS.available_parallelism
}

// CHECK MEMORY
function checkMemory () {
  switch (os_name) {
    case 'win32':
      return (total_memory> basic_human_rights.memory_windows)
    case 'linux':
      return (total_memory> basic_human_rights.memory_linux)
    case 'darwin':
      return true
    default:
      return false
  }
}

// CHECK CPU
function checkCpu () {
  switch (os_name) {
    case 'win32':
      // TODO:
      break
    case 'linux':
      // TODO:
      break
    case 'darwin':
      return true
    default:
      return false
  }
}

// CHECK DISK
function checkDisk () {
  switch (os_name) {
    case 'win32':
      // TODO:
      break
    case 'linux':
      // TODO:
      break
    case 'darwin':
      return true
    default:
      return false
  }
}
//local media_type
//if is_windows then
//    -- Windows
//    -- NOTE: VERY SLOW
//    local raw_cmd = "(Get-PhysicalDisk | Select-Object MediaType).MediaType"
//    local pwsh_cmd = 'pwsh.exe -Command "' .. raw_cmd .. '"'
//
//    local tmp = vim.fn.system(pwsh_cmd)
//    tmp = string.gsub(tmp, "%s+", "")
//    media_type = tmp == HUMAN_RIGHTS.media_type
//elseif is_mac then
//    -- Mac
//    media_type = true
//else
//    -- Linux
//    local tmp = vim.fn.systemlist("lsblk -o ROTA | sed -e 's/\\s//g'")
//    media_type = find(tmp, 0)
//end

// CHECK PARALLELISM
function checkParallelism () {
  switch (os_name) {
    case 'win32':
      return (available_parallelism> basic_human_rights.available_parallelism)
    case 'linux':
      return (available_parallelism> basic_human_rights.available_parallelism)
    case 'darwin':
      return true
    default:
      return false
  }
}

// CHECK HUMAN RIGHTS
function checkHumanRights () {
  return (checkMemory() && checkCpu() && checkDisk() && checkParallelism())
}
