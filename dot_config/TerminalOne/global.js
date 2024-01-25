/* eslint no-unused-vars: "off" */
const os = require('os')

/* GLOBAL */
const OS_NAME = os.platform()
const AVAILABLE_PARALLELISM = os.availableParallelism()
const TOTAL_MEMORY = os.totalmem()
// 4GB
const LINUX_HUMAN_RIGHTS_MEMORY_SIZE = 4294967296
// 9GB
const WINDOWS_HUMAN_RIGHTS_MEMORY_SIZE = 9663676416

const CPU_NAME = os.cpus()[0].model
const HOST_NAME = os.hostname()
const OS_ARCH = os.arch()
const OS_MACHINE = os.machine()
const OS_NETWORK_INTERFACES = os.networkInterfaces()
const OS_RELEASE = os.release()
const OS_TYPE = os.type()

/* DEBUG */
function printDebugInfo () {
  console.log('os_platform: %s', OS_NAME)
  console.log('os_available_parallelism: %s', AVAILABLE_PARALLELISM)
  console.log('os_totalmem: %s', TOTAL_MEMORY)
  console.log('os_cpus: %s', CPU_NAME)
  console.log('os_hostname: %s', HOST_NAME)
  console.log('os_arch: %s', OS_ARCH)
  console.log('os_machine: %s', OS_MACHINE)
  console.log('os_network_interfaces: %s', OS_NETWORK_INTERFACES)
  console.log('os_release: %s', OS_RELEASE)
  console.log('os_type: %s', OS_TYPE)
  console.log('------------------------')
  console.log('linux_human_rights_memory_size: %d', LINUX_HUMAN_RIGHTS_MEMORY_SIZE)
  console.log('windows_human_rights_memory_size: %d', WINDOWS_HUMAN_RIGHTS_MEMORY_SIZE)
}

/* BASIC HUMAN RIGHTS */
const BASIC_HUMAN_RIGHTS = {
  cpu: ['Ryzen 9 3900X', 'i5-13500H'],
  memory: {
    // 4GB
    linux: LINUX_HUMAN_RIGHTS_MEMORY_SIZE,
    // 9GB
    windows: WINDOWS_HUMAN_RIGHTS_MEMORY_SIZE
  },
  available_parallelism: 14,
  media_type: 'SSD'
}

/* CHECK MEMORY */
function checkMemory () {
  switch (OS_NAME) {
    case 'win32':
      return (TOTAL_MEMORY > BASIC_HUMAN_RIGHTS.memory.windows)
    case 'linux':
      return (TOTAL_MEMORY > BASIC_HUMAN_RIGHTS.memory.linux)
    case 'darwin':
      return true
    default:
      return false
  }
}

/* CHECK CPU */
function checkCpu () {
  switch (OS_NAME) {
    case 'win32':
      break
    case 'linux':
      break
    case 'darwin':
      return true
    default:
      return false
  }
}

/* CHECK DISK */
function checkDisk () {
  switch (OS_NAME) {
    case 'win32':
      break
    case 'linux':
      break
    case 'darwin':
      return true
    default:
      return false
  }
}

/* CHECK PARALLELISM */
function checkParallelism () {
  switch (OS_NAME) {
    case 'win32':
      return (AVAILABLE_PARALLELISM > BASIC_HUMAN_RIGHTS.available_parallelism)
    case 'linux':
      return (AVAILABLE_PARALLELISM > BASIC_HUMAN_RIGHTS.available_parallelism)
    case 'darwin':
      return true
    default:
      return false
  }
}

/* CHECK HUMAN RIGHTS */
function checkHumanRights () {
  return (checkMemory() && checkCpu() && checkDisk() && checkParallelism())
}

/*
----------
-- Disk --
----------
local media_type
if is_windows then
    -- Windows
    -- NOTE: VERY SLOW
    local raw_cmd = "(Get-PhysicalDisk | Select-Object MediaType).MediaType"
    local pwsh_cmd = 'pwsh.exe -Command "' .. raw_cmd .. '"'

    local tmp = vim.fn.system(pwsh_cmd)
    tmp = string.gsub(tmp, "%s+", "")
    media_type = tmp == HUMAN_RIGHTS.media_type
elseif is_mac then
    -- Mac
    media_type = true
else
    -- Linux
    local tmp = vim.fn.systemlist("lsblk -o ROTA | sed -e 's/\\s//g'")
    media_type = find(tmp, 0)
end
*/
