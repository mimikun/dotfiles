/* eslint no-unused-vars: "off" */
const os = require('os')

module.exports = {
  // GLOBAL
  OS_NAME: os.platform(),
  AVAILABLE_PARALLELISM: os.availableParallelism(),
  TOTAL_MEMORY: os.totalmem(),
  CPU_NAME: os.cpus()[0].model,
  HOST_NAME: os.hostname(),
  OS_ARCH: os.arch(),
  OS_MACHINE: os.machine(),
  OS_NETWORK_INTERFACES: os.networkInterfaces(),
  OS_RELEASE: os.release(),
  OS_TYPE: os.type(),
  // BASIC HUMAN RIGHTS
  BASIC_HUMAN_RIGHTS: {
  cpu: ['Ryzen 9 3900X', 'i5-13500H'],
  memory: {
    // 4GB
    linux: 4294967296,
    // 9GB
    windows: 9663676416
  },
  available_parallelism: 14,
  media_type: 'SSD'
  }
}
