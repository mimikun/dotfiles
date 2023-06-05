#set -l subcommands completion config confirm create delete edit encode export generate get import list lock login logout move receive restore send serve share status sync unlock update

# 補完候補にファイルが出てくるのを防ぐ
complete -c bw -f

#completion  -- Generate shell completions.
complete -c bw -n __fish_use_subcommand -a completion -d 'Generate shell completions.'
complete -c bw -n '__fish_seen_subcommand_from completion'  -l shell -d '<shell>  Shell to generate completions for.'
complete -c bw -n '__fish_seen_subcommand_from completion' -s h -l help -d 'display help for command'

#config      -- Configure CLI settings.
complete -c bw -n __fish_use_subcommand -a config -d 'Configure CLI settings.'
complete -c bw -n '__fish_seen_subcommand_from config'  -l web-vault -d '<url>      Provides a custom web vault URL that differs from the base URL.'
complete -c bw -n '__fish_seen_subcommand_from config'  -l api -d '<url>            Provides a custom API URL that differs from the base URL.'
complete -c bw -n '__fish_seen_subcommand_from config'  -l identity -d '<url>       Provides a custom identity URL that differs from the base URL.'
complete -c bw -n '__fish_seen_subcommand_from config'  -l icons -d '<url>          Provides a custom icons service URL that differs from the base URL.'
complete -c bw -n '__fish_seen_subcommand_from config'  -l notifications -d '<url>  Provides a custom notifications URL that differs from the base URL.'
complete -c bw -n '__fish_seen_subcommand_from config'  -l events -d '<url>         Provides a custom events URL that differs from the base URL.'
complete -c bw -n '__fish_seen_subcommand_from config'  -l key-connector -d '<url>  Provides the URL for your Key Connector server.'
complete -c bw -n '__fish_seen_subcommand_from config' -s h -l help -d 'display help for command'

#confirm     -- Confirm an object to the organization.
complete -c bw -n __fish_use_subcommand -a confirm -d 'Confirm an object to the organization.'
complete -c bw -n '__fish_seen_subcommand_from confirm'  -l organizationid -d '<organizationid>  Organization id for an organization object.'
complete -c bw -n '__fish_seen_subcommand_from confirm' -s h -l help -d 'display help for command'

#create      -- Create an object in the vault.
complete -c bw -n __fish_use_subcommand -a create -d 'Create an object in the vault.'
complete -c bw -n '__fish_seen_subcommand_from create'  -l file -d '<file>                      Path to file for attachment.'
complete -c bw -n '__fish_seen_subcommand_from create'  -l itemid -d '<itemid>                  Attachment\'s item id.'
complete -c bw -n '__fish_seen_subcommand_from create'  -l organizationid -d '<organizationid>  Organization id for an organization object.'
complete -c bw -n '__fish_seen_subcommand_from create' -s h -l help -d 'display help for command'

#delete      -- Delete an object from the vault.
complete -c bw -n __fish_use_subcommand -a delete -d 'Delete an object from the vault.'
complete -c bw -n '__fish_seen_subcommand_from delete'  -l itemid -d '<itemid>                  Attachment\'s item id.'
complete -c bw -n '__fish_seen_subcommand_from delete'  -l organizationid -d '<organizationid>  Organization id for an organization object.'
complete -c bw -n '__fish_seen_subcommand_from delete' -s p -l permanent -d 'Permanently deletes the item instead of soft-deleting it (item only).'
complete -c bw -n '__fish_seen_subcommand_from delete' -s h -l help -d 'display help for command'

#edit        -- Edit an object from the vault.
complete -c bw -n __fish_use_subcommand -a edit -d 'Edit an object from the vault.'
complete -c bw -n '__fish_seen_subcommand_from edit'  -l organizationid -d '<organizationid>  Organization id for an organization object.'
complete -c bw -n '__fish_seen_subcommand_from edit' -s h -l help -d 'display help for command'

#encode      -- Base 64 encode stdin.
complete -c bw -n __fish_use_subcommand -a encode -d 'Base 64 encode stdin.'
complete -c bw -n '__fish_seen_subcommand_from encode' -s h -l help -d 'display help for command'

#export      -- Export vault data to a CSV or JSON file.
complete -c bw -n __fish_use_subcommand -a export -d 'Export vault data to a CSV or JSON file.'
complete -c bw -n '__fish_seen_subcommand_from export'  -l output -d '<output>                  Output directory or filename.'
complete -c bw -n '__fish_seen_subcommand_from export'  -l format -d '<format>                  Export file format.'
complete -c bw -n '__fish_seen_subcommand_from export'  -l password -d 'Use password to encrypt instead of your Bitwarden account encryption key. Only applies to the encrypted_json format.'
complete -c bw -n '__fish_seen_subcommand_from export'  -l organizationid -d '<organizationid>  Organization id for an organization.'
complete -c bw -n '__fish_seen_subcommand_from export' -s h -l help -d 'display help for command'

#generate    -- Generate a password/passphrase.
complete -c bw -n __fish_use_subcommand -a generate -d 'Generate a password/passphrase.'
complete -c bw -n '__fish_seen_subcommand_from generate' -s u -l uppercase -d 'Include uppercase characters.'
complete -c bw -n '__fish_seen_subcommand_from generate' -s l -l lowercase -d 'Include lowercase characters.'
complete -c bw -n '__fish_seen_subcommand_from generate' -s n -l number -d 'Include numeric characters.'
complete -c bw -n '__fish_seen_subcommand_from generate' -s s -l special -d 'Include special characters.'
complete -c bw -n '__fish_seen_subcommand_from generate' -s p -l passphrase -d 'Generate a passphrase.'
complete -c bw -n '__fish_seen_subcommand_from generate'  -l length -d '<length>        Length of the password.'
complete -c bw -n '__fish_seen_subcommand_from generate'  -l words -d '<words>          Number of words.'
complete -c bw -n '__fish_seen_subcommand_from generate'  -l separator -d '<separator>  Word separator.'
complete -c bw -n '__fish_seen_subcommand_from generate' -s c -l capitalize -d 'Title case passphrase.'
complete -c bw -n '__fish_seen_subcommand_from generate'  -l includeNumber -d 'Passphrase includes number.'
complete -c bw -n '__fish_seen_subcommand_from generate' -s h -l help -d 'display help for command'

#get         -- Get an object from the vault.
complete -c bw -n __fish_use_subcommand -a get -d 'Get an object from the vault.'
complete -c bw -n '__fish_seen_subcommand_from get'  -l itemid -d '<itemid>                  Attachment\'s item id.'
complete -c bw -n '__fish_seen_subcommand_from get'  -l output -d '<output>                  Output directory or filename for attachment.'
complete -c bw -n '__fish_seen_subcommand_from get'  -l organizationid -d '<organizationid>  Organization id for an organization object.'
complete -c bw -n '__fish_seen_subcommand_from get' -s h -l help -d 'display help for command'

#import      -- Import vault data from a file.
complete -c bw -n __fish_use_subcommand -a import -d 'Import vault data from a file.'
complete -c bw -n '__fish_seen_subcommand_from import'  -l formats -d 'List formats'
complete -c bw -n '__fish_seen_subcommand_from import'  -l organizationid -d '<organizationid>  ID of the organization to import to.'
complete -c bw -n '__fish_seen_subcommand_from import' -s h -l help -d 'display help for command'

#list        -- List an array of objects from the vault.
complete -c bw -n __fish_use_subcommand -a list -d 'List an array of objects from the vault.'
complete -c bw -n '__fish_seen_subcommand_from list'  -l search -d '<search>                  Perform a search on the listed objects.'
complete -c bw -n '__fish_seen_subcommand_from list'  -l url -d '<url>                        Filter items of type login with a url-match search.'
complete -c bw -n '__fish_seen_subcommand_from list'  -l folderid -d '<folderid>              Filter items by folder id.'
complete -c bw -n '__fish_seen_subcommand_from list'  -l collectionid -d '<collectionid>      Filter items by collection id.'
complete -c bw -n '__fish_seen_subcommand_from list'  -l organizationid -d '<organizationid>  Filter items or collections by organization id.'
complete -c bw -n '__fish_seen_subcommand_from list'  -l trash -d 'Filter items that are deleted and in the trash.'
complete -c bw -n '__fish_seen_subcommand_from list' -s h -l help -d 'display help for command'

#lock        -- Lock the vault and destroy active session keys.
complete -c bw -n __fish_use_subcommand -a lock -d 'Lock the vault and destroy active session keys.'
complete -c bw -n '__fish_seen_subcommand_from lock' -s h -l help -d 'display help for command'

#login       -- Log into a user account.
complete -c bw -n __fish_use_subcommand -a login -d 'Log into a user account.'
complete -c bw -n '__fish_seen_subcommand_from login'  -l method -d '<method>              Two-step login method.'
complete -c bw -n '__fish_seen_subcommand_from login'  -l code -d '<code>                  Two-step login code.'
complete -c bw -n '__fish_seen_subcommand_from login'  -l sso -d 'Log in with Single-Sign On.'
complete -c bw -n '__fish_seen_subcommand_from login'  -l apikey -d 'Log in with an Api Key.'
complete -c bw -n '__fish_seen_subcommand_from login'  -l passwordenv -d '<passwordenv>    Environment variable storing your password'
complete -c bw -n '__fish_seen_subcommand_from login'  -l passwordfile -d '<passwordfile>  Path to a file containing your password as its first line'
complete -c bw -n '__fish_seen_subcommand_from login'  -l check -d 'Check login status.'
complete -c bw -n '__fish_seen_subcommand_from login' -s h -l help -d 'display help for command'

#logout      -- Log out of the current user account.
complete -c bw -n __fish_use_subcommand -a logout -d 'Log out of the current user account.'
complete -c bw -n '__fish_seen_subcommand_from logout' -s h -l help -d 'display help for command'

#move        -- Move an item to an organization.
complete -c bw -n __fish_use_subcommand -a move -d 'Move an item to an organization.'
complete -c bw -n '__fish_seen_subcommand_from move' -s h -l help -d 'display help for command'

#receive     -- Access a Bitwarden Send from a url
complete -c bw -n __fish_use_subcommand -a receive -d 'Access a Bitwarden Send from a url'
complete -c bw -n '__fish_seen_subcommand_from receive'  -l password -d '<password>          Password needed to access the Send.'
complete -c bw -n '__fish_seen_subcommand_from receive'  -l passwordenv -d '<passwordenv>    Environment variable storing the Send\'s password'
complete -c bw -n '__fish_seen_subcommand_from receive'  -l passwordfile -d '<passwordfile>  Path to a file containing the Sends password as its first line'
complete -c bw -n '__fish_seen_subcommand_from receive'  -l obj -d 'Return the Send\'s json object rather than the Send\'s content'
complete -c bw -n '__fish_seen_subcommand_from receive'  -l output -d '<location>            Specify a file path to save a File-type Send to'
complete -c bw -n '__fish_seen_subcommand_from receive' -s h -l help -d 'display help for command'

#restore     -- Restores an object from the trash.
complete -c bw -n __fish_use_subcommand -a restore -d 'Restores an object from the trash.'
complete -c bw -n '__fish_seen_subcommand_from restore' -s h -l help -d 'display help for command'

#send        -- Work with Bitwarden sends. A Send can be quickly created using this command or subcommands can be use
complete -c bw -n __fish_use_subcommand -a send -d 'Work with Bitwarden sends. A Send can be quickly created using this command or subcommands can be use'
complete -c bw -n '__fish_seen_subcommand_from send' -s f -l file -d 'Specifies that <data> is a filepath'
complete -c bw -n '__fish_seen_subcommand_from send' -s d -l deleteInDays -d '<days>       The number of days in the future to set deletion date, defaults to 7 (default: \'7\')'
complete -c bw -n '__fish_seen_subcommand_from send' -s a -l maxAccessCount -d '<amount>   The amount of max possible accesses.'
complete -c bw -n '__fish_seen_subcommand_from send'  -l hidden -d 'Hide <data> in web by default. Valid only if --file is not set.'
complete -c bw -n '__fish_seen_subcommand_from send' -s n -l name -d '<name>               The name of the Send. Defaults to a guid for text Sends and the filename for files.'
complete -c bw -n '__fish_seen_subcommand_from send'  -l notes -d '<notes>                 Notes to add to the Send.'
complete -c bw -n '__fish_seen_subcommand_from send'  -l fullObject -d 'Specifies that the full Send object should be returned rather than just the access url.'
complete -c bw -n '__fish_seen_subcommand_from send' -s h -l help -d 'display help for command'

#serve       -- Start a RESTful API webserver.
complete -c bw -n __fish_use_subcommand -a serve -d 'Start a RESTful API webserver.'
complete -c bw -n '__fish_seen_subcommand_from serve'  -l hostname -d '<hostname>        The hostname to bind your API webserver to.'
complete -c bw -n '__fish_seen_subcommand_from serve'  -l port -d '<port>                The port to run your API webserver on.'
complete -c bw -n '__fish_seen_subcommand_from serve'  -l disable-origin-protection -d 'If set, allows requests with origin header. Warning, this option exists for backwards compatibility reasons and exposes your environment to known CSRF attacks.'
complete -c bw -n '__fish_seen_subcommand_from serve' -s h -l help -d 'display help for command'

#share       -- --DEPRECATED-- Move an item to an organization.
# TODO
complete -c bw -n __fish_use_subcommand -a share -d '--DEPRECATED-- Move an item to an organization.'
complete -c bw -n '__fish_seen_subcommand_from share' -s h -l help -d 'display help for command'

#status      -- Show server, last sync, user information, and vault status.
complete -c bw -n __fish_use_subcommand -a status -d 'Show server, last sync, user information, and vault status.'
complete -c bw -n '__fish_seen_subcommand_from status' -s h -l help -d 'display help for command'

#sync        -- Pull the latest vault data from server.
complete -c bw -n __fish_use_subcommand -a sync -d 'Pull the latest vault data from server.'
complete -c bw -n '__fish_seen_subcommand_from sync' -s f -l force -d 'Force a full sync.'
complete -c bw -n '__fish_seen_subcommand_from sync'  -l last -d 'Get the last sync date.'
complete -c bw -n '__fish_seen_subcommand_from sync' -s h -l help -d 'display help for command'

#unlock      -- Unlock the vault and return a new session key.
complete -c bw -n __fish_use_subcommand -a unlock -d 'Unlock the vault and return a new session key.'
complete -c bw -n '__fish_seen_subcommand_from unlock'  -l check -d 'Check lock status.'
complete -c bw -n '__fish_seen_subcommand_from unlock'  -l passwordenv -d '<passwordenv>    Environment variable storing your password'
complete -c bw -n '__fish_seen_subcommand_from unlock'  -l passwordfile -d '<passwordfile>  Path to a file containing your password as its first line'
complete -c bw -n '__fish_seen_subcommand_from unlock' -s h -l help -d 'display help for command'

#update      -- Check for updates.
complete -c bw -n __fish_use_subcommand -a update -d 'Check for updates.'
complete -c bw -n '__fish_seen_subcommand_from update' -s h -l help -d 'display help for command'

#help        -- Print this message or the help of the given subcommand(s).
complete -c bw -n __fish_use_subcommand -a help -d 'Print this message or the help of the given subcommand(s).'
#TODO
#complete -c bw -n '__fish_seen_subcommand_from help'  -l pretty -d 'Format output. JSON is tabbed with two spaces.'
#complete -c bw -n '__fish_seen_subcommand_from help'  -l raw -d 'Return raw output instead of a descriptive message.'
#complete -c bw -n '__fish_seen_subcommand_from help'  -l response -d 'Return a JSON formatted version of response output.'
#complete -c bw -n '__fish_seen_subcommand_from help'  -l cleanexit -d 'Exit with a success exit code (0) unless an error is thrown.'
#complete -c bw -n '__fish_seen_subcommand_from help'  -l quiet -d 'Don\'t return anything to stdout.'
#complete -c bw -n '__fish_seen_subcommand_from help'  -l nointeraction -d 'Do not prompt for interactive user input.'
#complete -c bw -n '__fish_seen_subcommand_from help'  -l session -d '<session>                         Pass session key instead of reading from env.'
#complete -c bw -n '__fish_seen_subcommand_from help' -s v -l version -d 'output the version number'
#complete -c bw -n '__fish_seen_subcommand_from help' -s h -l help -d 'display help for command'
