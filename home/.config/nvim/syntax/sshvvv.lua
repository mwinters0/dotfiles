-- For `ssh -vvv`

vim.api.nvim_set_hl(0, 'SshDebugLevel', { link = 'Comment' })

vim.api.nvim_set_hl(0, 'SshConstant', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'SshDefine', { link = 'Define' })
vim.api.nvim_set_hl(0, 'SshFunction', { link = 'Function' })
vim.api.nvim_set_hl(0, 'SshInclude', { link = 'Include' })
vim.api.nvim_set_hl(0, 'SshLabel', { link = 'Label' })
vim.api.nvim_set_hl(0, 'SshKeyword', { link = 'Keyword' })
vim.api.nvim_set_hl(0, 'SshStatement', { link = 'Statement' })
vim.api.nvim_set_hl(0, 'SshString', { link = 'String' })
vim.api.nvim_set_hl(0, 'SshSpecial', { link = 'Special' })

vim.api.nvim_set_hl(0, 'SshAction', { link = 'Special' })

vim.api.nvim_set_hl(0, 'SshSuccess', { link = 'String' })
vim.api.nvim_set_hl(0, 'SshError', { link = 'Error' })
vim.api.nvim_set_hl(0, 'SshWarning', { link = 'WarningMsg' })

vim.api.nvim_set_hl(0, 'SshIP', { link = 'Number' })
vim.api.nvim_set_hl(0, 'SshPort', { link = 'Number' })
vim.api.nvim_set_hl(0, 'SshHost', { link = 'String' })
vim.api.nvim_set_hl(0, 'SshAlgorithm', { link = 'Type' })
vim.api.nvim_set_hl(0, 'SshConfigKeyword', { link = 'Special' })
vim.api.nvim_set_hl(0, 'SshPath', { link = 'Directory' })
vim.api.nvim_set_hl(0, 'SshSocketOpt', { link = 'Type' })
vim.api.nvim_set_hl(0, 'SshMessageType', { link = 'Constant' })

vim.cmd([[
  syntax match SshDebugLevel /^debug[123]:/

  syntax keyword SshLabel add_identity_file
  syntax keyword SshLabel chan_shutdown_read
  syntax keyword SshLabel chan_shutdown_write
  syntax keyword SshLabel channel_clear_timeouts
  syntax keyword SshLabel channel_input_open_confirmation
  syntax keyword SshLabel channel_input_status_confirm
  syntax keyword SshLabel client_input_global_request
  syntax keyword SshLabel client_input_channel_req
  syntax keyword SshLabel client_repledge
  syntax keyword SshLabel client_session2_setup
  syntax keyword SshLabel compat_banner
  syntax keyword SshLabel kex_choose_conf
  syntax keyword SshLabel kex_exchange_identification
  syntax keyword SshLabel kex_ext_info_client_parse
  syntax keyword SshLabel kex_input_ext_info
  syntax keyword SshLabel load_hostkeys
  syntax keyword SshLabel load_hostkeys_file
  syntax keyword SshLabel order_hostkeyalgs
  syntax keyword SshLabel pkcs11_del_provider
  syntax keyword SshLabel pubkey_prepare
  syntax keyword SshLabel receive_packet send_packet
  syntax keyword SshLabel record_hostkey
  syntax keyword SshLabel service_accept
  syntax keyword SshLabel sign_and_send_pubkey
  syntax keyword SshLabel ssh_connect_direct set_sock_tos resolve_host
  syntax keyword SshLabel ssh_packet_read_poll2
  syntax keyword SshLabel ssh_packet_send2_wrapped
  syntax keyword SshLabel ssh_session2_open
  syntax keyword SshLabel ssh_set_newkeys
  syntax keyword SshLabel vdollar_percent_expand

  syntax keyword SshAction expand lookup fopen entering setting clearing resolving expecting sent received resetting checking proposal

  syntax match SshAction /Authenticating to/
  syntax match SshAction /Connecting to/
  syntax match SshAction /Entering interactive session/
  syntax match SshAction /Executing proxy command/
  syntax match SshAction /Offering public key/
  syntax match SshAction /Sending command/
  syntax match SshAction /Sending environment/
  syntax match SshAction /Server accepts key/
  syntax match SshAction /Trying private key/
  syntax match SshAction /\(receive packet\|send packet\)/
  syntax match SshAction /re-parsing configuration/
  syntax match SshAction /set socket/
  syntax match SshSpecial /->/

  syntax keyword SshConfigKeyword SetEnv
  syntax keyword SshConfigKeyword UserKnownHostsFile

  syntax match SshInclude /Reading configuration data/
  syntax match SshInclude /Including file/

  syntax keyword SshSuccess expanded matched
  syntax match SshSuccess /Connection established/
  syntax match SshSuccess /match found/
  syntax match SshSuccess /found key/
  syntax match SshSuccess /\cFound CA key/
  syntax match SshSuccess /Authenticated to/
  syntax match SshSuccess /request [a-z]\+ confirm/
  syntax match SshSuccess /loaded \d\+ keys/

  syntax match SshWarning /match not found/
  syntax match SshWarning /not matched/
  syntax match SshWarning /No such file or directory/
  syntax match SshWarning /No matching CA found/
  syntax match SshWarning /start over/
  syntax match SshWarning /type -1/

  syntax match SshError /No more authentication methods to try/

  syntax match SshPort /:\d\{1,5}\>/
  syntax match SshPort /port \d\{1,5}\>/
  syntax match SshPath /\/[a-zA-Z0-9_\-\/\.]\+/
  syntax match SshHost /\(\s\|\[\|\"\)\<[a-zA-Z0-9\-]\+\.[a-zA-Z0-9\-\.]\+\>/
  syntax match SshIP /\d\{1,3\}\.\d\{1,3\}\.\d\{1,3\}\.\d\{1,3\}/

  syntax keyword SshSocketOpt IP_TOS O_NONBLOCK
  syntax match SshSocketOpt /fd \d\+/

  syntax match SshMessageType /SSH2_MSG_[A-Z0-9_]\+/
  syntax keyword SshMessageType KEXINIT

]])
