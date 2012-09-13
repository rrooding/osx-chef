root_path                      = File.expand_path(File.join(File.dirname(__FILE__), '..'))
cookbook_path                    File.join root_path, 'cookbooks'
role_path                        File.join root_path, 'roles'

state_root_path                = File.expand_path '~/.chef/state'
file_cache_path                  File.join state_root_path, 'cache'
checksum_path                    File.join state_root_path, 'checksums'
sandbox_path                     File.join state_root_path, 'sandbox'
file_backup_path                 File.join state_root_path, 'backup'

cache_options[:path]           = file_cache_path

FileUtils.mkdir_p [file_cache_path, checksum_path, sandbox_path, file_backup_path]
