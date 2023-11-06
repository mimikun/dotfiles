-- ref:
-- https://trap.jp/post/524/
-- https://neovim.io/doc/user/options.html#option-summary

-- https://neovim.io/doc/user/options.html#'allowrevins'
vim.opt.allowrevins = false

-- https://neovim.io/doc/user/options.html#'arabic'
vim.opt.arabic = false

-- https://neovim.io/doc/user/options.html#'arabicshape'
vim.opt.arabicshape = true

-- https://neovim.io/doc/user/options.html#'autochdir'
vim.opt.autochdir = false

-- https://neovim.io/doc/user/options.html#'autoindent'
vim.opt.autoindent = true

-- https://neovim.io/doc/user/options.html#'autoread'
vim.opt.autoread = true

-- https://neovim.io/doc/user/options.html#'autowrite'
vim.opt.autowrite = false

-- https://neovim.io/doc/user/options.html#'autowriteall'
vim.opt.autowriteall = false

-- https://neovim.io/doc/user/options.html#'background'
vim.opt.background = "dark"

-- https://neovim.io/doc/user/options.html#'backspace'
vim.opt.backspace = { "indent,eol,start" }

-- https://neovim.io/doc/user/options.html#'backup'
vim.opt.backup = false

-- https://neovim.io/doc/user/options.html#'backupcopy'
vim.opt.backupcopy = "auto"

-- https://neovim.io/doc/user/options.html#'backupdir'
vim.opt.backupdir = ".,$XDG_STATE_HOME/nvim/backup//"

-- https://neovim.io/doc/user/options.html#'backupext'
vim.opt.backupext = "~"

-- https://neovim.io/doc/user/options.html#'backupskip'
vim.opt.backupskip = "$TMPDIR/*,$TMP/*,$TEMP/*"

-- https://neovim.io/doc/user/options.html#'belloff'
vim.opt.belloff = "all"

-- https://neovim.io/doc/user/options.html#'binary'
vim.opt.binary = false

-- https://neovim.io/doc/user/options.html#'bomb'
vim.opt.bomb = false

-- https://neovim.io/doc/user/options.html#'breakindent'
vim.opt.breakindent = false

-- https://neovim.io/doc/user/options.html#'breakat'
vim.opt.breakat = " ^I!@*-+;:,./?"

-- https://neovim.io/doc/user/options.html#'breakindentopt'
vim.opt.breakindentopt = ""

-- https://neovim.io/doc/user/options.html#'browsedir'
--vim.opt.browsedir = "last"

-- https://neovim.io/doc/user/options.html#'bufhidden'
vim.opt.bufhidden = ""

-- https://neovim.io/doc/user/options.html#'buflisted'
vim.opt.buflisted = true

-- https://neovim.io/doc/user/options.html#'buftype'
vim.opt.buftype = ""

-- https://neovim.io/doc/user/options.html#'casemap'
vim.opt.casemap = "internal,keepascii"

-- https://neovim.io/doc/user/options.html#'cdhome'
vim.opt.cdhome = false

-- TODO
-- https://neovim.io/doc/user/options.html#'cdpath'
--'cdpath' 'cd'  string (default equivalent to $CDPATH or ",,")

-- TODO
-- https://neovim.io/doc/user/options.html#'cedit'
--'cedit'   string (default CTRL-F)

-- https://neovim.io/doc/user/options.html#'channel'
--vim.opt.channel = 0

-- https://neovim.io/doc/user/options.html#'charconvert'
vim.opt.charconvert = ""

-- https://neovim.io/doc/user/options.html#'cindent'
vim.opt.cindent = false

-- https://neovim.io/doc/user/options.html#'cinkeys'
vim.opt.cinkeys = "0{,0},0),0],:,0#,!^F,o,O,e"

-- https://neovim.io/doc/user/options.html#'cinoptions'
vim.opt.cinoptions = ""

-- https://neovim.io/doc/user/options.html#'cinscopedecls'
vim.opt.cinscopedecls = "public,protected,private"

-- https://neovim.io/doc/user/options.html#'cinwords'
vim.opt.cinwords = "if,else,while,do,for,switch"

-- https://neovim.io/doc/user/options.html#'cmdheight'
vim.opt.cmdheight = 1

-- https://neovim.io/doc/user/options.html#'cmdwinheight'
vim.opt.cmdwinheight = 7

-- https://neovim.io/doc/user/options.html#'colorcolumn'
vim.opt.colorcolumn = ""

-- https://neovim.io/doc/user/options.html#'columns'
vim.opt.columns = 80

-- https://neovim.io/doc/user/options.html#'comments'
vim.opt.comments = "s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,fb:•"

-- https://neovim.io/doc/user/options.html#'commentstring'
vim.opt.commentstring = ""

-- https://neovim.io/doc/user/options.html#'complete'
vim.opt.complete = ".,w,b,u,t"

-- https://neovim.io/doc/user/options.html#'completefunc'
vim.opt.completefunc = ""

-- https://neovim.io/doc/user/options.html#'completeopt'
vim.opt.completeopt = "menu,preview"

-- https://neovim.io/doc/user/options.html#'completeslash'
--vim.opt.completeslash = ""

-- https://neovim.io/doc/user/options.html#'concealcursor'
vim.opt.concealcursor = ""

-- https://neovim.io/doc/user/options.html#'conceallevel'
vim.opt.conceallevel = 0

-- https://neovim.io/doc/user/options.html#'confirm'
vim.opt.confirm = false

-- https://neovim.io/doc/user/options.html#'copyindent'
vim.opt.copyindent = false

-- https://neovim.io/doc/user/options.html#'cpoptions'
vim.opt.cpoptions = "aABceFs_"

-- https://neovim.io/doc/user/options.html#'cursorbind'
vim.opt.cursorbind = false

-- https://neovim.io/doc/user/options.html#'cursorcolumn'
vim.opt.cursorcolumn = false

-- https://neovim.io/doc/user/options.html#'cursorline'
vim.opt.cursorline = false

-- https://neovim.io/doc/user/options.html#'cursorlineopt'
vim.opt.cursorlineopt = "both"

-- https://neovim.io/doc/user/options.html#'debug'
vim.opt.debug = ""

-- https://neovim.io/doc/user/options.html#'define'
vim.opt.define = ""

-- https://neovim.io/doc/user/options.html#'delcombine'
vim.opt.delcombine = false

-- https://neovim.io/doc/user/options.html#'dictionary'
vim.opt.dictionary = ""

-- https://neovim.io/doc/user/options.html#'diff'
vim.opt.diff = false

-- https://neovim.io/doc/user/options.html#'diffexpr'
vim.opt.diffexpr = ""

-- https://neovim.io/doc/user/options.html#'diffopt'
vim.opt.diffopt = "internal,filler,closeoff"

-- https://neovim.io/doc/user/options.html#'digraph'
vim.opt.digraph = false

-- https://neovim.io/doc/user/options.html#'directory'
vim.opt.directory = "$XDG_STATE_HOME/nvim/swap//"

-- https://neovim.io/doc/user/options.html#'display'
vim.opt.display = "lastline"

-- https://neovim.io/doc/user/options.html#'eadirection'
vim.opt.eadirection = "both"

-- https://neovim.io/doc/user/options.html#'emoji'
vim.opt.emoji = true

-- https://neovim.io/doc/user/options.html#'encoding'
vim.opt.encoding = "utf-8"

-- https://neovim.io/doc/user/options.html#'endoffile'
vim.opt.endoffile = false

-- https://neovim.io/doc/user/options.html#'endofline'
vim.opt.endofline = true

-- https://neovim.io/doc/user/options.html#'equalalways'
vim.opt.equalalways = true

-- https://neovim.io/doc/user/options.html#'equalprg'
vim.opt.equalprg = ""

-- https://neovim.io/doc/user/options.html#'errorbells'
vim.opt.errorbells = false

-- https://neovim.io/doc/user/options.html#'errorfile'
vim.opt.errorfile = "errors.err"

-- TODO
-- https://neovim.io/doc/user/options.html#'errorformat'
--'errorformat' 'efm' string (default is very long)

-- https://neovim.io/doc/user/options.html#'eventignore'
vim.opt.eventignore = ""

-- https://neovim.io/doc/user/options.html#'exrc'
vim.opt.exrc = false

-- https://neovim.io/doc/user/options.html#'fileencoding'
vim.opt.fileencoding = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'fileformat'
--'fileformat' 'ff' string (default Windows: "dos", Unix: "unix")

-- TODO
-- https://neovim.io/doc/user/options.html#'fileignorecase'
--'fileignorecase' 'fic' boolean (default on for systems where case in file

-- https://neovim.io/doc/user/options.html#'filetype'
vim.opt.filetype = ""

-- https://neovim.io/doc/user/options.html#'fillchars'
vim.opt.fillchars = ""

-- https://neovim.io/doc/user/options.html#'fixendofline'
vim.opt.fixendofline = true

-- https://neovim.io/doc/user/options.html#'foldclose'
vim.opt.foldclose = ""

-- https://neovim.io/doc/user/options.html#'foldcolumn'
vim.opt.foldcolumn = "0"

-- https://neovim.io/doc/user/options.html#'foldenable'
vim.opt.foldenable = true

-- https://neovim.io/doc/user/options.html#'foldexpr'
vim.opt.foldexpr = "0"

-- https://neovim.io/doc/user/options.html#'foldignore'
vim.opt.foldignore = "#"

-- https://neovim.io/doc/user/options.html#'foldlevel'
vim.opt.foldlevel = 0

-- TODO
-- https://neovim.io/doc/user/options.html#'foldlevelstart'
--'foldlevelstart' 'fdls' number (default -1)

-- https://neovim.io/doc/user/options.html#'foldmarker'
vim.opt.foldmarker = "{{{,}}}"

-- https://neovim.io/doc/user/options.html#'foldmethod'
vim.opt.foldmethod = "manual"

-- https://neovim.io/doc/user/options.html#'foldminlines'
vim.opt.foldminlines = 1

-- https://neovim.io/doc/user/options.html#'foldnestmax'
vim.opt.foldnestmax = 20

-- https://neovim.io/doc/user/options.html#'foldopen'
vim.opt.foldopen = "block,hor,mark,percent,quickfix,search,tag,undo"

-- https://neovim.io/doc/user/options.html#'foldtext'
vim.opt.foldtext = "foldtext()"

-- https://neovim.io/doc/user/options.html#'formatexpr'
vim.opt.formatexpr = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'formatlistpat'
--'formatlistpat' 'flp' string (default "^\s*\d\+[\]:.)}\t ]\s*")

-- https://neovim.io/doc/user/options.html#'formatoptions'
vim.opt.formatoptions = "tcqj"

-- https://neovim.io/doc/user/options.html#'formatprg'
vim.opt.formatprg = ""

-- https://neovim.io/doc/user/options.html#'fsync'
vim.opt.fsync = false

-- https://neovim.io/doc/user/options.html#'gdefault'
vim.opt.gdefault = false

-- https://neovim.io/doc/user/options.html#'grepformat'
vim.opt.grepformat = "%f:%l:%m,%f:%l%m,%f  %l%m"

-- https://neovim.io/doc/user/options.html#'grepprg'
vim.opt.grepprg = "grep -n "

-- https://neovim.io/doc/user/options.html#'guicursor'
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- https://neovim.io/doc/user/options.html#'guifont'
vim.opt.guifont = ""

-- https://neovim.io/doc/user/options.html#'guifontwide'
vim.opt.guifontwide = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'guioptions'
--'guioptions' 'go' string (default "egmrLT"   (MS-Windows))

-- https://neovim.io/doc/user/options.html#'guitablabel'
--vim.opt.guitablabel = ""

-- https://neovim.io/doc/user/options.html#'guitabtooltip'
--vim.opt.guitabtooltip = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'helpfile'
--'helpfile' 'hf'  string (default (MS-Windows) "$VIMRUNTIME\doc\help.txt"

-- https://neovim.io/doc/user/options.html#'helpheight'
vim.opt.helpheight = 20

-- https://neovim.io/doc/user/options.html#'history'
vim.opt.history = 10000

-- https://neovim.io/doc/user/options.html#'hlsearch'
vim.opt.hlsearch = true

-- https://neovim.io/doc/user/options.html#'icon'
vim.opt.icon = false

-- https://neovim.io/doc/user/options.html#'iconstring'
vim.opt.iconstring = ""

-- https://neovim.io/doc/user/options.html#'imcmdline'
--vim.opt.imcmdline = false

-- https://neovim.io/doc/user/options.html#'imdisable'
--vim.opt.imdisable = false

-- https://neovim.io/doc/user/options.html#'iminsert'
vim.opt.iminsert = 0

-- TODO
-- https://neovim.io/doc/user/options.html#'imsearch'
--'imsearch' 'ims' number (default -1)

-- 文字列置換をインタラクティブに表示する
-- https://neovim.io/doc/user/options.html#'inccommand'
vim.opt.inccommand = "split"

-- https://neovim.io/doc/user/options.html#'includeexpr'
vim.opt.includeexpr = ""

-- https://neovim.io/doc/user/options.html#'include'
vim.opt.include = ""

-- https://neovim.io/doc/user/options.html#'incsearch'
vim.opt.incsearch = true

-- https://neovim.io/doc/user/options.html#'indentexpr'
vim.opt.indentexpr = ""

-- https://neovim.io/doc/user/options.html#'indentkeys'
vim.opt.indentkeys = "0{,0},0),0],:,0#,!^F,o,O,e"

-- https://neovim.io/doc/user/options.html#'infercase'
vim.opt.infercase = false

-- TODO
-- https://neovim.io/doc/user/options.html#'isfname'
--'isfname' 'isf'  string (default for Windows:

-- TODO
-- https://neovim.io/doc/user/options.html#'isident'
--'isident' 'isi'  string (default for Windows:

-- https://neovim.io/doc/user/options.html#'iskeyword'
vim.opt.iskeyword = "@,48-57,_,192-255"

-- https://neovim.io/doc/user/options.html#'isprint'
vim.opt.isprint = "@,161-255"

-- https://neovim.io/doc/user/options.html#'joinspaces'
vim.opt.joinspaces = false

-- https://neovim.io/doc/user/options.html#'jumpoptions'
vim.opt.jumpoptions = ""

-- https://neovim.io/doc/user/options.html#'keymap'
vim.opt.keymap = ""

-- https://neovim.io/doc/user/options.html#'keymodel'
vim.opt.keymodel = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'keywordprg'
--'keywordprg' 'kp' string (default ":Man", Windows: ":help")

-- TODO
-- https://neovim.io/doc/user/options.html#'langmap'
vim.opt.langmap = ""

-- https://neovim.io/doc/user/options.html#'langmenu'
vim.opt.langmenu = ""

-- https://neovim.io/doc/user/options.html#'langremap'
vim.opt.langremap = false

-- https://neovim.io/doc/user/options.html#'laststatus'
vim.opt.laststatus = 2

-- https://neovim.io/doc/user/options.html#'lazyredraw'
vim.opt.lazyredraw = false

-- https://neovim.io/doc/user/options.html#'linebreak'
vim.opt.linebreak = false

-- https://neovim.io/doc/user/options.html#'lines'
vim.opt.lines = 24

-- https://neovim.io/doc/user/options.html#'linespace'
vim.opt.linespace = 0

-- https://neovim.io/doc/user/options.html#'lisp'
vim.opt.lisp = false

-- https://neovim.io/doc/user/options.html#'lispoptions'
vim.opt.lispoptions = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'lispwords'
--'lispwords' 'lw' string (default is very long)

-- https://neovim.io/doc/user/options.html#'loadplugins'
vim.opt.loadplugins = true

-- https://neovim.io/doc/user/options.html#'magic'
vim.opt.magic = true

-- https://neovim.io/doc/user/options.html#'makeef'
vim.opt.makeef = ""

-- https://neovim.io/doc/user/options.html#'makeencoding'
vim.opt.makeencoding = ""

-- https://neovim.io/doc/user/options.html#'makeprg'
vim.opt.makeprg = "make"

-- https://neovim.io/doc/user/options.html#'matchpairs'
vim.opt.matchpairs = "(:),{:},[:]"

-- https://neovim.io/doc/user/options.html#'matchtime'
vim.opt.matchtime = 5

-- https://neovim.io/doc/user/options.html#'maxfuncdepth'
vim.opt.maxfuncdepth = 100

-- https://neovim.io/doc/user/options.html#'maxmapdepth'
vim.opt.maxmapdepth = 1000

-- https://neovim.io/doc/user/options.html#'maxmempattern'
vim.opt.maxmempattern = 1000

-- https://neovim.io/doc/user/options.html#'menuitems'
vim.opt.menuitems = 25

-- https://neovim.io/doc/user/options.html#'mkspellmem'
vim.opt.mkspellmem = "460000,2000,500"

-- https://neovim.io/doc/user/options.html#'modelineexpr'
vim.opt.modelineexpr = false

-- TODO
-- https://neovim.io/doc/user/options.html#'modeline'
--'modeline' 'ml'  boolean (default on (off for root))

-- https://neovim.io/doc/user/options.html#'modelines'
vim.opt.modelines = 5

-- https://neovim.io/doc/user/options.html#'modifiable'
vim.opt.modifiable = true

-- https://neovim.io/doc/user/options.html#'modified'
vim.opt.modified = false

-- https://neovim.io/doc/user/options.html#'more'
vim.opt.more = true

-- https://neovim.io/doc/user/options.html#'mousefocus'
vim.opt.mousefocus = false

-- https://neovim.io/doc/user/options.html#'mousehide'
--vim.opt.mousehide = true

-- https://neovim.io/doc/user/options.html#'mousemodel'
--vim.opt.mousemodal = "popup_setpos"

-- https://neovim.io/doc/user/options.html#'mousemoveevent'
vim.opt.mousemoveevent = false

-- https://neovim.io/doc/user/options.html#'mousescroll'
vim.opt.mousescroll = "ver:3,hor:6"

-- TODO
-- https://neovim.io/doc/user/options.html#'mouseshape'
--'mouseshape' 'mouses' string (default "i:beam,r:beam,s:updown,sd:cross,

-- https://neovim.io/doc/user/options.html#'mousetime'
vim.opt.mousetime = 500

-- https://neovim.io/doc/user/options.html#'nrformats'
vim.opt.nrformats = "bin,hex"

-- https://neovim.io/doc/user/options.html#'numberwidth'
vim.opt.numberwidth = 4

-- https://neovim.io/doc/user/options.html#'omnifunc'
vim.opt.omnifunc = ""

-- https://neovim.io/doc/user/options.html#'opendevice'
--vim.opt.opendevice = false

-- https://neovim.io/doc/user/options.html#'operatorfunc'
vim.opt.operatorfunc = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'packpath'
--'packpath' 'pp'  string (default see 'runtimepath')

-- https://neovim.io/doc/user/options.html#'paragraphs'
vim.opt.paragraphs = "IPLPPPQPP TPHPLIPpLpItpplpipbp"

-- https://neovim.io/doc/user/options.html#'patchexpr'
vim.opt.patchexpr = ""

-- https://neovim.io/doc/user/options.html#'patchmode'
vim.opt.patchmode = ""

-- https://neovim.io/doc/user/options.html#'path'
vim.opt.path = ".,,"

-- https://neovim.io/doc/user/options.html#'preserveindent'
vim.opt.preserveindent = false

-- https://neovim.io/doc/user/options.html#'previewheight'
vim.opt.previewheight = 12

-- https://neovim.io/doc/user/options.html#'previewwindow'
vim.opt.previewwindow = false

-- https://neovim.io/doc/user/options.html#'pumblend'
vim.opt.pumblend = 0

-- https://neovim.io/doc/user/options.html#'pumheight'
vim.opt.pumheight = 0

-- https://neovim.io/doc/user/options.html#'pumwidth'
vim.opt.pumwidth = 15

-- https://neovim.io/doc/user/options.html#'pyxversion'
vim.opt.pyxversion = 3

-- https://neovim.io/doc/user/options.html#'quickfixtextfunc'
vim.opt.quickfixtextfunc = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'quoteescape'
--'quoteescape' 'qe' string (default "\")

-- https://neovim.io/doc/user/options.html#'readonly'
vim.opt.readonly = false

-- https://neovim.io/doc/user/options.html#'redrawdebug'
vim.opt.redrawdebug = ""

-- https://neovim.io/doc/user/options.html#'redrawtime'
vim.opt.redrawtime = 2000

-- https://neovim.io/doc/user/options.html#'regexpengine'
vim.opt.regexpengine = 0

-- https://neovim.io/doc/user/options.html#'report'
vim.opt.report = 2

-- https://neovim.io/doc/user/options.html#'revins'
vim.opt.revins = false

-- https://neovim.io/doc/user/options.html#'rightleftcmd'
vim.opt.rightleftcmd = "search"

-- https://neovim.io/doc/user/options.html#'rightleft'
vim.opt.rightleft = false

-- https://neovim.io/doc/user/options.html#'rulerformat'
vim.opt.rulerformat = ""

-- https://neovim.io/doc/user/options.html#'ruler'
vim.opt.ruler = true

-- TODO
-- https://neovim.io/doc/user/options.html#'runtimepath'
--'runtimepath' 'rtp' string (default "$XDG_CONFIG_HOME/nvim,

-- https://neovim.io/doc/user/options.html#'scrollback'
vim.opt.scrollback = 10000

-- https://neovim.io/doc/user/options.html#'scrollbind'
vim.opt.scrollbind = false

-- https://neovim.io/doc/user/options.html#'scrolljump'
vim.opt.scrolljump = 1

-- https://neovim.io/doc/user/options.html#'scrolloff'
vim.opt.scrolloff = 0

-- https://neovim.io/doc/user/options.html#'scrollopt'
vim.opt.scrollopt = "ver,jump"

-- TODO
-- https://neovim.io/doc/user/options.html#'scroll'
--'scroll' 'scr'  number (default half the window height)

-- https://neovim.io/doc/user/options.html#'sections'
vim.opt.sections = "SHNHH HUnhsh"

-- https://neovim.io/doc/user/options.html#'selection'
vim.opt.selection = "inclusive"

-- https://neovim.io/doc/user/options.html#'selectmode'
vim.opt.selectmode = ""

-- https://neovim.io/doc/user/options.html#'sessionoptions'
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,terminal"

-- https://neovim.io/doc/user/options.html#'shadafile'
vim.opt.shadafile = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'shada'
--'shada' 'sd'  string (default for

-- TODO
-- https://neovim.io/doc/user/options.html#'shellcmdflag'
--'shellcmdflag' 'shcf' string (default "-c"; Windows: "/s /c")

-- TODO
-- https://neovim.io/doc/user/options.html#'shellpipe'
--'shellpipe' 'sp' string (default ">", "| tee", "|& tee" or "2>&1| tee")

-- TODO
-- https://neovim.io/doc/user/options.html#'shellquote'
--'shellquote' 'shq' string (default ""; Windows, when 'shell'

-- TODO
-- https://neovim.io/doc/user/options.html#'shellredir'
--'shellredir' 'srr' string (default ">", ">&" or ">%s 2>&1")

-- TODO
-- https://neovim.io/doc/user/options.html#'shell'
--'shell' 'sh'  string (default $SHELL or "sh", Win32: "cmd.exe")

-- https://neovim.io/doc/user/options.html#'shellslash'
--vim.opt.shellslash = false

-- https://neovim.io/doc/user/options.html#'shelltemp'
vim.opt.shelltemp = true

-- https://neovim.io/doc/user/options.html#'shellxescape'
vim.opt.shellxescape = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'shellxquote'
--'shellxquote' 'sxq' string (default "", Windows: "\"")

-- https://neovim.io/doc/user/options.html#'shiftround'
vim.opt.shiftround = false

-- https://neovim.io/doc/user/options.html#'shortmess'
vim.opt.shortmess = "filnxtToOCF"

-- https://neovim.io/doc/user/options.html#'showbreak'
vim.opt.showbreak = ""

-- https://neovim.io/doc/user/options.html#'showcmdloc'
vim.opt.showcmdloc = "last"

-- https://neovim.io/doc/user/options.html#'showcmd'
vim.opt.showcmd = true

-- https://neovim.io/doc/user/options.html#'showfulltag'
vim.opt.showfulltag = false

-- https://neovim.io/doc/user/options.html#'showmatch'
vim.opt.showmatch = false

-- https://neovim.io/doc/user/options.html#'sidescrolloff'
vim.opt.sidescrolloff = 0

-- https://neovim.io/doc/user/options.html#'sidescroll'
vim.opt.sidescroll = 1

-- https://neovim.io/doc/user/options.html#'signcolumn'
vim.opt.signcolumn = "auto"

-- https://neovim.io/doc/user/options.html#'smarttab'
vim.opt.smarttab = true

-- https://neovim.io/doc/user/options.html#'smoothscroll'
vim.opt.smoothscroll = false

-- https://neovim.io/doc/user/options.html#'softtabstop'
vim.opt.softtabstop = 0

-- https://neovim.io/doc/user/options.html#'spell'
vim.opt.spell = false

-- TODO
-- https://neovim.io/doc/user/options.html#'spellcapcheck'
--'spellcapcheck' 'spc' string (default "[.?!]\_[\])'"\t ]\+")

-- https://neovim.io/doc/user/options.html#'spellfile'
vim.opt.spellfile = ""

-- https://neovim.io/doc/user/options.html#'spelllang'
vim.opt.spelllang = "en"

-- https://neovim.io/doc/user/options.html#'spelloptions'
vim.opt.spelloptions = ""

-- https://neovim.io/doc/user/options.html#'spellsuggest'
vim.opt.spellsuggest = "best"

-- https://neovim.io/doc/user/options.html#'splitbelow'
vim.opt.splitbelow = false

-- https://neovim.io/doc/user/options.html#'splitkeep'
vim.opt.splitkeep = "cursor"

-- https://neovim.io/doc/user/options.html#'splitright'
vim.opt.splitright = false

-- https://neovim.io/doc/user/options.html#'startofline'
vim.opt.startofline = false

-- https://neovim.io/doc/user/options.html#'statuscolumn'
vim.opt.statuscolumn = ""

-- https://neovim.io/doc/user/options.html#'statusline'
vim.opt.statuscolumn = ""

-- https://neovim.io/doc/user/options.html#'suffixesadd'
vim.opt.suffixesadd = ""

-- https://neovim.io/doc/user/options.html#'suffixes'
vim.opt.suffixes = ".bak,~,.o,.h,.info,.swp,.obj"

-- https://neovim.io/doc/user/options.html#'switchbuf'
vim.opt.switchbuf = "uselast"

-- https://neovim.io/doc/user/options.html#'synmaxcol'
vim.opt.synmaxcol = 3000

-- https://neovim.io/doc/user/options.html#'syntax'
vim.opt.syntax = ""

-- https://neovim.io/doc/user/options.html#'tabline'
vim.opt.tabline = ""

-- https://neovim.io/doc/user/options.html#'tabpagemax'
vim.opt.tabpagemax = 50

-- https://neovim.io/doc/user/options.html#'tagbsearch'
vim.opt.tagbsearch = true

-- https://neovim.io/doc/user/options.html#'tagcase'
vim.opt.tagcase = "followic"

-- https://neovim.io/doc/user/options.html#'tagfunc'
vim.opt.tagfunc = ""

-- https://neovim.io/doc/user/options.html#'taglength'
vim.opt.taglength = 0

-- https://neovim.io/doc/user/options.html#'tagrelative'
vim.opt.tagrelative = true

-- https://neovim.io/doc/user/options.html#'tagstack'
vim.opt.tagstack = true

-- https://neovim.io/doc/user/options.html#'tags'
vim.opt.tags = "./tags;,tags"

-- https://neovim.io/doc/user/options.html#'termbidi'
vim.opt.termbidi = false

-- https://neovim.io/doc/user/options.html#'termpastefilter'
vim.opt.termpastefilter = "BS,HT,ESC,DEL"

-- https://neovim.io/doc/user/options.html#'textwidth'
vim.opt.textwidth = 0

-- https://neovim.io/doc/user/options.html#'thesaurusfunc'
vim.opt.thesaurusfunc = ""

-- https://neovim.io/doc/user/options.html#'thesaurus'
vim.opt.thesaurus = ""

-- https://neovim.io/doc/user/options.html#'tildeop'
vim.opt.tildeop = false

-- https://neovim.io/doc/user/options.html#'timeoutlen'
vim.opt.timeoutlen = 1000

-- https://neovim.io/doc/user/options.html#'timeout'
vim.opt.timeout = true

-- https://neovim.io/doc/user/options.html#'title'
vim.opt.title = false

-- https://neovim.io/doc/user/options.html#'titlelen'
vim.opt.titlelen = 85

-- https://neovim.io/doc/user/options.html#'titleold'
vim.opt.titleold = ""

-- https://neovim.io/doc/user/options.html#'titlestring'
vim.opt.titlestring = ""

-- https://neovim.io/doc/user/options.html#'ttimeout'
vim.opt.ttimeout = true

-- https://neovim.io/doc/user/options.html#'ttimeoutlen'
vim.opt.ttimeoutlen = 50

-- https://neovim.io/doc/user/options.html#'undodir'
vim.opt.undodir = "$XDG_STATE_HOME/nvim/undo//"

-- https://neovim.io/doc/user/options.html#'undofile'
vim.opt.undofile = false

-- https://neovim.io/doc/user/options.html#'undolevels'
vim.opt.undolevels = 1000

-- https://neovim.io/doc/user/options.html#'undoreload'
vim.opt.undoreload = 10000

-- https://neovim.io/doc/user/options.html#'updatecount'
vim.opt.updatecount = 200

-- https://neovim.io/doc/user/options.html#'varsofttabstop'
vim.opt.varsofttabstop = ""

-- https://neovim.io/doc/user/options.html#'vartabstop'
vim.opt.vartabstop = ""

-- https://neovim.io/doc/user/options.html#'verbosefile'
vim.opt.verbosefile = ""

-- https://neovim.io/doc/user/options.html#'verbose'
vim.opt.verbose = 0

-- https://neovim.io/doc/user/options.html#'viewdir'
vim.opt.viewdir = "$XDG_STATE_HOME/nvim/view//"

-- https://neovim.io/doc/user/options.html#'viewoptions'
vim.opt.viewoptions = "folds,cursor,curdir"

-- https://neovim.io/doc/user/options.html#'virtualedit'
vim.opt.virtualedit = ""

-- https://neovim.io/doc/user/options.html#'warn'
vim.opt.warn = true

-- https://neovim.io/doc/user/options.html#'wildcharm'
vim.opt.wildcharm = 0

-- TODO
-- https://neovim.io/doc/user/options.html#'wildchar'
--'wildchar' 'wc'  number (default <Tab>)

-- https://neovim.io/doc/user/options.html#'wildignorecase'
vim.opt.wildignorecase = false

-- https://neovim.io/doc/user/options.html#'wildignore'
vim.opt.wildignore = ""

-- https://neovim.io/doc/user/options.html#'wildmenu'
vim.opt.wildmenu = true

-- https://neovim.io/doc/user/options.html#'wildmode'
vim.opt.wildmode = "full"

-- https://neovim.io/doc/user/options.html#'wildoptions'
vim.opt.wildoptions = "pum,tagfile"

-- https://neovim.io/doc/user/options.html#'winaltkeys'
vim.opt.winaltkeys = "menu"

-- https://neovim.io/doc/user/options.html#'winbar'
vim.opt.winbar = ""

-- https://neovim.io/doc/user/options.html#'winblend'
vim.opt.winblend = 0

-- TODO
-- https://neovim.io/doc/user/options.html#'window'
--'window' 'wi'  number (default screen height - 1)

-- https://neovim.io/doc/user/options.html#'winfixheight'
vim.opt.winfixheight = false

-- https://neovim.io/doc/user/options.html#'winfixwidth'
vim.opt.winfixwidth = false

-- https://neovim.io/doc/user/options.html#'winheight'
vim.opt.winheight = 1

-- https://neovim.io/doc/user/options.html#'winhighlight'
vim.opt.winhighlight = ""

-- https://neovim.io/doc/user/options.html#'winminheight'
vim.opt.winminheight = 1

-- https://neovim.io/doc/user/options.html#'winminwidth'
vim.opt.winminwidth = 1

-- https://neovim.io/doc/user/options.html#'winwidth'
vim.opt.winwidth = 20

-- https://neovim.io/doc/user/options.html#'wrap'
vim.opt.wrap = true

-- https://neovim.io/doc/user/options.html#'wrapmargin'
vim.opt.wrapmargin = 0

-- https://neovim.io/doc/user/options.html#'writeany'
vim.opt.writeany = false

-- https://neovim.io/doc/user/options.html#'writebackup'
vim.opt.writebackup = true

-- https://neovim.io/doc/user/options.html#'write'
vim.opt.write = true

-- https://neovim.io/doc/user/options.html#'writedelay'
vim.opt.writedelay = 0
