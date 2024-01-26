const global = require("./global")

function printDebugInfo() {
  console.log('os_platform: %s', global.OS_NAME)
  console.log('os_available_parallelism: %s', global.AVAILABLE_PARALLELISM)
  console.log('os_totalmem: %s', global.TOTAL_MEMORY)
  console.log('os_cpus: %s', global.CPU_NAME)
  console.log('os_hostname: %s', global.HOST_NAME)
  console.log('os_arch: %s', global.OS_ARCH)
  console.log('os_machine: %s', global.OS_MACHINE)
  console.log('os_network_interfaces: %s', global.OS_NETWORK_INTERFACES)
  console.log('os_release: %s', global.OS_RELEASE)
  console.log('os_type: %s', global.OS_TYPE)
  console.log('------------------------')
  console.log('linux_human_rights_memory_size: %d', global.BASIC_HUMAN_RIGHTS.memory.linux)
  console.log('windows_human_rights_memory_size: %d', global.BASIC_HUMAN_RIGHTS.memory.windows)
}

module.exports = printDebugInfo()
