-- https://neovim.io/doc/user/options.html#'allowrevins'
---@type boolean
vim.opt.allowrevins = false

-- https://neovim.io/doc/user/options.html#'arabic'
---@type boolean
vim.opt.arabic = false

-- https://neovim.io/doc/user/options.html#'arabicshape'
---@type boolean
vim.opt.arabicshape = true

-- https://neovim.io/doc/user/options.html#'autochdir'
---@type boolean
vim.opt.autochdir = false

-- https://neovim.io/doc/user/options.html#'autoindent'
---@type boolean
vim.opt.autoindent = true

-- https://neovim.io/doc/user/options.html#'autoread'
---@type boolean
vim.opt.autoread = true

-- https://neovim.io/doc/user/options.html#'autowrite'
---@type boolean
vim.opt.autowrite = false

-- https://neovim.io/doc/user/options.html#'autowriteall'
---@type boolean
vim.opt.autowriteall = false

-- https://neovim.io/doc/user/options.html#'background'
---@type string
vim.opt.background = "dark"

-- https://neovim.io/doc/user/options.html#'backspace'
---@type table
vim.opt.backspace = { "indent,eol,start" }

-- https://neovim.io/doc/user/options.html#'backup'
---@type boolean
vim.opt.backup = false

-- https://neovim.io/doc/user/options.html#'backupcopy'
---@type string
vim.opt.backupcopy = "auto"

-- https://neovim.io/doc/user/options.html#'backupdir'
---@type string
vim.opt.backupdir = ".,$XDG_STATE_HOME/nvim/backup//"

-- https://neovim.io/doc/user/options.html#'backupext'
---@type string
vim.opt.backupext = "~"

-- https://neovim.io/doc/user/options.html#'backupskip'
---@type string
vim.opt.backupskip = "$TMPDIR/*,$TMP/*,$TEMP/*"

-- https://neovim.io/doc/user/options.html#'belloff'
---@type string
vim.opt.belloff = "all"

-- https://neovim.io/doc/user/options.html#'binary'
---@type boolean
vim.opt.binary = false

-- https://neovim.io/doc/user/options.html#'bomb'
---@type boolean
vim.opt.bomb = false

-- https://neovim.io/doc/user/options.html#'breakindent'
---@type boolean
vim.opt.breakindent = false

-- https://neovim.io/doc/user/options.html#'breakat'
---@type string
vim.opt.breakat = " ^I!@*-+;:,./?"

-- https://neovim.io/doc/user/options.html#'breakindentopt'
---@type string
vim.opt.breakindentopt = ""

-- https://neovim.io/doc/user/options.html#'browsedir'
---@type string
--vim.opt.browsedir = "last"

-- https://neovim.io/doc/user/options.html#'bufhidden'
---@type string
vim.opt.bufhidden = ""

-- https://neovim.io/doc/user/options.html#'buflisted'
---@type boolean
vim.opt.buflisted = true

-- https://neovim.io/doc/user/options.html#'buftype'
---@type string
vim.opt.buftype = ""

-- https://neovim.io/doc/user/options.html#'casemap'
---@type string
vim.opt.casemap = "internal,keepascii"

-- https://neovim.io/doc/user/options.html#'cdhome'
---@type boolean
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
---@type string
vim.opt.charconvert = ""

-- https://neovim.io/doc/user/options.html#'cindent'
---@type boolean
vim.opt.cindent = false

-- https://neovim.io/doc/user/options.html#'cinkeys'
---@type string
vim.opt.cinkeys = "0{,0},0),0],:,0#,!^F,o,O,e"

-- https://neovim.io/doc/user/options.html#'cinoptions'
---@type string
vim.opt.cinoptions = ""

-- https://neovim.io/doc/user/options.html#'cinscopedecls'
---@type string
vim.opt.cinscopedecls = "public,protected,private"

-- https://neovim.io/doc/user/options.html#'cinwords'
---@type string
vim.opt.cinwords = "if,else,while,do,for,switch"

-- https://neovim.io/doc/user/options.html#'cmdheight'
---@type number
vim.opt.cmdheight = 1

-- https://neovim.io/doc/user/options.html#'cmdwinheight'
---@type number
vim.opt.cmdwinheight = 7

-- https://neovim.io/doc/user/options.html#'colorcolumn'
---@type string
vim.opt.colorcolumn = ""

-- https://neovim.io/doc/user/options.html#'columns'
---@type number
vim.opt.columns = 80

-- https://neovim.io/doc/user/options.html#'comments'
---@type string
vim.opt.comments = "s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,fb:•"

-- https://neovim.io/doc/user/options.html#'commentstring'
---@type string
vim.opt.commentstring = ""

-- https://neovim.io/doc/user/options.html#'complete'
---@type string
vim.opt.complete = ".,w,b,u,t"

-- https://neovim.io/doc/user/options.html#'completefunc'
---@type string
vim.opt.completefunc = ""

-- https://neovim.io/doc/user/options.html#'completeopt'
---@type string
vim.opt.completeopt = "menu,preview"

-- https://neovim.io/doc/user/options.html#'completeslash'
---@type string
--vim.opt.completeslash = ""

-- https://neovim.io/doc/user/options.html#'concealcursor'
---@type string
vim.opt.concealcursor = ""

-- https://neovim.io/doc/user/options.html#'conceallevel'
---@type number
--vim.opt.conceallevel = 0

-- https://neovim.io/doc/user/options.html#'confirm'
---@type boolean
vim.opt.confirm = false

-- https://neovim.io/doc/user/options.html#'copyindent'
---@type boolean
vim.opt.copyindent = false

-- https://neovim.io/doc/user/options.html#'cpoptions'
---@type string
vim.opt.cpoptions = "aABceFs_"

-- https://neovim.io/doc/user/options.html#'cursorbind'
---@type boolean
vim.opt.cursorbind = false

-- https://neovim.io/doc/user/options.html#'cursorcolumn'
---@type boolean
vim.opt.cursorcolumn = false

-- https://neovim.io/doc/user/options.html#'cursorline'
---@type boolean
vim.opt.cursorline = false

-- https://neovim.io/doc/user/options.html#'cursorlineopt'
---@type string
vim.opt.cursorlineopt = "both"

-- https://neovim.io/doc/user/options.html#'debug'
---@type string
vim.opt.debug = ""

-- https://neovim.io/doc/user/options.html#'define'
---@type string
vim.opt.define = ""

-- https://neovim.io/doc/user/options.html#'delcombine'
---@type boolean
vim.opt.delcombine = false

-- https://neovim.io/doc/user/options.html#'dictionary'
---@type string
vim.opt.dictionary = ""

-- https://neovim.io/doc/user/options.html#'diff'
---@type boolean
vim.opt.diff = false

-- https://neovim.io/doc/user/options.html#'diffexpr'
---@type string
vim.opt.diffexpr = ""

-- https://neovim.io/doc/user/options.html#'diffopt'
---@type string
vim.opt.diffopt = "internal,filler,closeoff"

-- https://neovim.io/doc/user/options.html#'digraph'
---@type boolean
vim.opt.digraph = false

-- https://neovim.io/doc/user/options.html#'directory'
---@type string
vim.opt.directory = "$XDG_STATE_HOME/nvim/swap//"

-- https://neovim.io/doc/user/options.html#'display'
---@type string
vim.opt.display = "lastline"

-- https://neovim.io/doc/user/options.html#'eadirection'
---@type string
vim.opt.eadirection = "both"

-- https://neovim.io/doc/user/options.html#'emoji'
---@type boolean
vim.opt.emoji = true

-- https://neovim.io/doc/user/options.html#'encoding'
---@type string
vim.opt.encoding = "utf-8"

-- https://neovim.io/doc/user/options.html#'endoffile'
---@type boolean
vim.opt.endoffile = false

-- https://neovim.io/doc/user/options.html#'endofline'
---@type boolean
vim.opt.endofline = true

-- https://neovim.io/doc/user/options.html#'equalalways'
---@type boolean
vim.opt.equalalways = true

-- https://neovim.io/doc/user/options.html#'equalprg'
---@type string
vim.opt.equalprg = ""

-- https://neovim.io/doc/user/options.html#'errorbells'
---@type boolean
vim.opt.errorbells = false

-- https://neovim.io/doc/user/options.html#'errorfile'
---@type string
vim.opt.errorfile = "errors.err"

-- TODO
-- https://neovim.io/doc/user/options.html#'errorformat'
--'errorformat' 'efm' string (default is very long)

-- https://neovim.io/doc/user/options.html#'eventignore'
---@type string
vim.opt.eventignore = ""

-- https://neovim.io/doc/user/options.html#'exrc'
---@type boolean
vim.opt.exrc = false

-- https://neovim.io/doc/user/options.html#'fileencoding'
---@type string
vim.opt.fileencoding = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'fileformat'
--'fileformat' 'ff' string (default Windows: "dos", Unix: "unix")

-- TODO
-- https://neovim.io/doc/user/options.html#'fileignorecase'
--'fileignorecase' 'fic' boolean (default on for systems where case in file

-- https://neovim.io/doc/user/options.html#'filetype'
---@type string
vim.opt.filetype = ""

-- https://neovim.io/doc/user/options.html#'fillchars'
---@type string
vim.opt.fillchars = ""

-- https://neovim.io/doc/user/options.html#'fixendofline'
---@type boolean
vim.opt.fixendofline = true

-- https://neovim.io/doc/user/options.html#'foldclose'
---@type string
vim.opt.foldclose = ""

-- https://neovim.io/doc/user/options.html#'foldcolumn'
---@type string
vim.opt.foldcolumn = "0"

-- https://neovim.io/doc/user/options.html#'foldenable'
---@type boolean
vim.opt.foldenable = true

-- https://neovim.io/doc/user/options.html#'foldexpr'
---@type string
vim.opt.foldexpr = "0"

-- https://neovim.io/doc/user/options.html#'foldignore'
---@type string
vim.opt.foldignore = "#"

-- https://neovim.io/doc/user/options.html#'foldlevel'
---@type number
vim.opt.foldlevel = 0

-- TODO
-- https://neovim.io/doc/user/options.html#'foldlevelstart'
--'foldlevelstart' 'fdls' number (default -1)

-- https://neovim.io/doc/user/options.html#'foldmarker'
---@type string
vim.opt.foldmarker = "{{{,}}}"

-- https://neovim.io/doc/user/options.html#'foldmethod'
---@type string
vim.opt.foldmethod = "manual"

-- https://neovim.io/doc/user/options.html#'foldminlines'
---@type number
vim.opt.foldminlines = 1

-- https://neovim.io/doc/user/options.html#'foldnestmax'
---@type number
vim.opt.foldnestmax = 20

-- https://neovim.io/doc/user/options.html#'foldopen'
---@type string
vim.opt.foldopen = "block,hor,mark,percent,quickfix,search,tag,undo"

-- https://neovim.io/doc/user/options.html#'foldtext'
---@type string
vim.opt.foldtext = "foldtext()"

-- https://neovim.io/doc/user/options.html#'formatexpr'
---@type string
vim.opt.formatexpr = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'formatlistpat'
--'formatlistpat' 'flp' string (default "^\s*\d\+[\]:.)}\t ]\s*")

-- https://neovim.io/doc/user/options.html#'formatoptions'
---@type string
vim.opt.formatoptions = "tcqj"

-- https://neovim.io/doc/user/options.html#'formatprg'
---@type string
vim.opt.formatprg = ""

-- https://neovim.io/doc/user/options.html#'fsync'
---@type boolean
vim.opt.fsync = false

-- https://neovim.io/doc/user/options.html#'gdefault'
---@type boolean
vim.opt.gdefault = false

-- https://neovim.io/doc/user/options.html#'grepformat'
---@type string
vim.opt.grepformat = "%f:%l:%m,%f:%l%m,%f  %l%m"

-- https://neovim.io/doc/user/options.html#'grepprg'
---@type string
vim.opt.grepprg = "grep -n "

-- https://neovim.io/doc/user/options.html#'guicursor'
---@type string
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- https://neovim.io/doc/user/options.html#'guifont'
---@type string
vim.opt.guifont = ""

-- https://neovim.io/doc/user/options.html#'guifontwide'
---@type string
vim.opt.guifontwide = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'guioptions'
--'guioptions' 'go' string (default "egmrLT"   (MS-Windows))

-- https://neovim.io/doc/user/options.html#'guitablabel'
---@type string
--vim.opt.guitablabel = ""

-- https://neovim.io/doc/user/options.html#'guitabtooltip'
---@type string
--vim.opt.guitabtooltip = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'helpfile'
--'helpfile' 'hf'  string (default (MS-Windows) "$VIMRUNTIME\doc\help.txt"

-- https://neovim.io/doc/user/options.html#'helpheight'
---@type number
vim.opt.helpheight = 20

-- https://neovim.io/doc/user/options.html#'history'
---@type number
vim.opt.history = 10000

-- https://neovim.io/doc/user/options.html#'hlsearch'
---@type boolean
vim.opt.hlsearch = true

-- https://neovim.io/doc/user/options.html#'icon'
---@type boolean
vim.opt.icon = false

-- https://neovim.io/doc/user/options.html#'iconstring'
---@type string
vim.opt.iconstring = ""

-- https://neovim.io/doc/user/options.html#'imcmdline'
--vim.opt.imcmdline = false

-- https://neovim.io/doc/user/options.html#'imdisable'
--vim.opt.imdisable = false

-- https://neovim.io/doc/user/options.html#'iminsert'
---@type number
vim.opt.iminsert = 0

-- TODO
-- https://neovim.io/doc/user/options.html#'imsearch'
--'imsearch' 'ims' number (default -1)

-- 文字列置換をインタラクティブに表示する
-- https://neovim.io/doc/user/options.html#'inccommand'
---@type string
vim.opt.inccommand = "split"

-- https://neovim.io/doc/user/options.html#'includeexpr'
---@type string
vim.opt.includeexpr = ""

-- https://neovim.io/doc/user/options.html#'include'
---@type string
vim.opt.include = ""

-- https://neovim.io/doc/user/options.html#'incsearch'
---@type boolean
vim.opt.incsearch = true

-- https://neovim.io/doc/user/options.html#'indentexpr'
---@type string
vim.opt.indentexpr = ""

-- https://neovim.io/doc/user/options.html#'indentkeys'
---@type string
vim.opt.indentkeys = "0{,0},0),0],:,0#,!^F,o,O,e"

-- https://neovim.io/doc/user/options.html#'infercase'
---@type boolean
vim.opt.infercase = false

-- TODO
-- https://neovim.io/doc/user/options.html#'isfname'
--'isfname' 'isf'  string (default for Windows:

-- TODO
-- https://neovim.io/doc/user/options.html#'isident'
--'isident' 'isi'  string (default for Windows:

-- https://neovim.io/doc/user/options.html#'iskeyword'
---@type string
vim.opt.iskeyword = "@,48-57,_,192-255"

-- https://neovim.io/doc/user/options.html#'isprint'
---@type string
vim.opt.isprint = "@,161-255"

-- https://neovim.io/doc/user/options.html#'joinspaces'
---@type boolean
vim.opt.joinspaces = false

-- https://neovim.io/doc/user/options.html#'jumpoptions'
---@type string
vim.opt.jumpoptions = ""

-- https://neovim.io/doc/user/options.html#'keymap'
---@type string
vim.opt.keymap = ""

-- https://neovim.io/doc/user/options.html#'keymodel'
---@type string
vim.opt.keymodel = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'keywordprg'
--'keywordprg' 'kp' string (default ":Man", Windows: ":help")

-- TODO
-- https://neovim.io/doc/user/options.html#'langmap'
---@type string
vim.opt.langmap = ""

-- https://neovim.io/doc/user/options.html#'langmenu'
---@type string
vim.opt.langmenu = ""

-- https://neovim.io/doc/user/options.html#'langremap'
---@type boolean
vim.opt.langremap = false

-- https://neovim.io/doc/user/options.html#'laststatus'
---@type number
vim.opt.laststatus = 2

-- https://neovim.io/doc/user/options.html#'lazyredraw'
---@type boolean
vim.opt.lazyredraw = false

-- https://neovim.io/doc/user/options.html#'linebreak'
---@type boolean
vim.opt.linebreak = false

-- https://neovim.io/doc/user/options.html#'lines'
---@type number
vim.opt.lines = 24

-- https://neovim.io/doc/user/options.html#'linespace'
---@type number
vim.opt.linespace = 0

-- https://neovim.io/doc/user/options.html#'lisp'
---@type boolean
vim.opt.lisp = false

-- https://neovim.io/doc/user/options.html#'lispoptions'
---@type string
vim.opt.lispoptions = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'lispwords'
--'lispwords' 'lw' string (default is very long)

-- https://neovim.io/doc/user/options.html#'loadplugins'
---@type boolean
vim.opt.loadplugins = true

-- https://neovim.io/doc/user/options.html#'magic'
---@type boolean
vim.opt.magic = true

-- https://neovim.io/doc/user/options.html#'makeef'
---@type string
vim.opt.makeef = ""

-- https://neovim.io/doc/user/options.html#'makeencoding'
---@type string
vim.opt.makeencoding = ""

-- https://neovim.io/doc/user/options.html#'makeprg'
---@type string
vim.opt.makeprg = "make"

-- https://neovim.io/doc/user/options.html#'matchpairs'
---@type string
vim.opt.matchpairs = "(:),{:},[:]"

-- https://neovim.io/doc/user/options.html#'matchtime'
---@type number
vim.opt.matchtime = 5

-- https://neovim.io/doc/user/options.html#'maxfuncdepth'
---@type number
vim.opt.maxfuncdepth = 100

-- https://neovim.io/doc/user/options.html#'maxmapdepth'
---@type number
vim.opt.maxmapdepth = 1000

-- https://neovim.io/doc/user/options.html#'maxmempattern'
---@type number
vim.opt.maxmempattern = 1000

-- https://neovim.io/doc/user/options.html#'menuitems'
---@type number
vim.opt.menuitems = 25

-- https://neovim.io/doc/user/options.html#'mkspellmem'
---@type string
vim.opt.mkspellmem = "460000,2000,500"

-- https://neovim.io/doc/user/options.html#'modelineexpr'
---@type boolean
vim.opt.modelineexpr = false

-- TODO
-- https://neovim.io/doc/user/options.html#'modeline'
---@type boolean
--'modeline' 'ml'  boolean (default on (off for root))

-- https://neovim.io/doc/user/options.html#'modelines'
---@type number
vim.opt.modelines = 5

-- https://neovim.io/doc/user/options.html#'modifiable'
---@type boolean
vim.opt.modifiable = true

-- https://neovim.io/doc/user/options.html#'modified'
---@type boolean
vim.opt.modified = false

-- https://neovim.io/doc/user/options.html#'more'
---@type boolean
vim.opt.more = true

-- https://neovim.io/doc/user/options.html#'mousefocus'
---@type boolean
vim.opt.mousefocus = false

-- https://neovim.io/doc/user/options.html#'mousehide'
---@type boolean
--vim.opt.mousehide = true

-- https://neovim.io/doc/user/options.html#'mousemodel'
---@type string
--vim.opt.mousemodal = "popup_setpos"

-- https://neovim.io/doc/user/options.html#'mousemoveevent'
---@type boolean
vim.opt.mousemoveevent = false

-- https://neovim.io/doc/user/options.html#'mousescroll'
---@type string
vim.opt.mousescroll = "ver:3,hor:6"

-- TODO
-- https://neovim.io/doc/user/options.html#'mouseshape'
--'mouseshape' 'mouses' string (default "i:beam,r:beam,s:updown,sd:cross,

-- https://neovim.io/doc/user/options.html#'mousetime'
---@type number
vim.opt.mousetime = 500

-- https://neovim.io/doc/user/options.html#'nrformats'
---@type string
vim.opt.nrformats = "bin,hex"

-- https://neovim.io/doc/user/options.html#'numberwidth'
vim.opt.numberwidth = 4

-- https://neovim.io/doc/user/options.html#'omnifunc'
---@type string
vim.opt.omnifunc = ""

-- https://neovim.io/doc/user/options.html#'opendevice'
---@type boolean
--vim.opt.opendevice = false

-- https://neovim.io/doc/user/options.html#'operatorfunc'
---@type string
vim.opt.operatorfunc = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'packpath'
--'packpath' 'pp'  string (default see 'runtimepath')

-- https://neovim.io/doc/user/options.html#'paragraphs'
---@type string
vim.opt.paragraphs = "IPLPPPQPP TPHPLIPpLpItpplpipbp"

-- https://neovim.io/doc/user/options.html#'patchexpr'
---@type string
vim.opt.patchexpr = ""

-- https://neovim.io/doc/user/options.html#'patchmode'
---@type string
vim.opt.patchmode = ""

-- https://neovim.io/doc/user/options.html#'path'
---@type string
vim.opt.path = ".,,"

-- https://neovim.io/doc/user/options.html#'preserveindent'
---@type boolean
vim.opt.preserveindent = false

-- https://neovim.io/doc/user/options.html#'previewheight'
---@type number
vim.opt.previewheight = 12

-- https://neovim.io/doc/user/options.html#'previewwindow'
---@type boolean
vim.opt.previewwindow = false

-- https://neovim.io/doc/user/options.html#'pumblend'
---@type number
vim.opt.pumblend = 0

-- https://neovim.io/doc/user/options.html#'pumheight'
---@type number
vim.opt.pumheight = 0

-- https://neovim.io/doc/user/options.html#'pumwidth'
---@type number
vim.opt.pumwidth = 15

-- https://neovim.io/doc/user/options.html#'pyxversion'
---@type number
vim.opt.pyxversion = 3

-- https://neovim.io/doc/user/options.html#'quickfixtextfunc'
---@type string
vim.opt.quickfixtextfunc = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'quoteescape'
--'quoteescape' 'qe' string (default "\")

-- https://neovim.io/doc/user/options.html#'readonly'
---@type boolean
vim.opt.readonly = false

-- https://neovim.io/doc/user/options.html#'redrawdebug'
---@type string
vim.opt.redrawdebug = ""

-- https://neovim.io/doc/user/options.html#'redrawtime'
---@type number
vim.opt.redrawtime = 2000

-- https://neovim.io/doc/user/options.html#'regexpengine'
---@type number
vim.opt.regexpengine = 0

-- https://neovim.io/doc/user/options.html#'report'
---@type number
vim.opt.report = 2

-- https://neovim.io/doc/user/options.html#'revins'
---@type boolean
vim.opt.revins = false

-- https://neovim.io/doc/user/options.html#'rightleftcmd'
---@type string
vim.opt.rightleftcmd = "search"

-- https://neovim.io/doc/user/options.html#'rightleft'
---@type boolean
vim.opt.rightleft = false

-- https://neovim.io/doc/user/options.html#'rulerformat'
---@type string
vim.opt.rulerformat = ""

-- https://neovim.io/doc/user/options.html#'ruler'
---@type boolean
vim.opt.ruler = true

-- TODO
-- https://neovim.io/doc/user/options.html#'runtimepath'
--'runtimepath' 'rtp' string (default "$XDG_CONFIG_HOME/nvim,

-- https://neovim.io/doc/user/options.html#'scrollback'
---@type number
vim.opt.scrollback = 10000

-- https://neovim.io/doc/user/options.html#'scrollbind'
---@type boolean
vim.opt.scrollbind = false

-- https://neovim.io/doc/user/options.html#'scrolljump'
---@type number
vim.opt.scrolljump = 1

-- https://neovim.io/doc/user/options.html#'scrolloff'
---@type number
vim.opt.scrolloff = 0

-- https://neovim.io/doc/user/options.html#'scrollopt'
---@type string
vim.opt.scrollopt = "ver,jump"

-- TODO
-- https://neovim.io/doc/user/options.html#'scroll'
--'scroll' 'scr'  number (default half the window height)

-- https://neovim.io/doc/user/options.html#'sections'
---@type string
vim.opt.sections = "SHNHH HUnhsh"

-- https://neovim.io/doc/user/options.html#'selection'
---@type string
vim.opt.selection = "inclusive"

-- https://neovim.io/doc/user/options.html#'selectmode'
---@type string
vim.opt.selectmode = ""

-- https://neovim.io/doc/user/options.html#'sessionoptions'
---@type string
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,terminal"

-- https://neovim.io/doc/user/options.html#'shadafile'
---@type string
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
---@type boolean
--vim.opt.shellslash = false

-- https://neovim.io/doc/user/options.html#'shelltemp'
---@type boolean
vim.opt.shelltemp = true

-- https://neovim.io/doc/user/options.html#'shellxescape'
---@type string
vim.opt.shellxescape = ""

-- TODO
-- https://neovim.io/doc/user/options.html#'shellxquote'
--'shellxquote' 'sxq' string (default "", Windows: "\"")

-- https://neovim.io/doc/user/options.html#'shiftround'
---@type boolean
vim.opt.shiftround = false

-- https://neovim.io/doc/user/options.html#'shortmess'
---@type string
vim.opt.shortmess = "filnxtToOCF"

-- https://neovim.io/doc/user/options.html#'showbreak'
---@type string
vim.opt.showbreak = ""

-- https://neovim.io/doc/user/options.html#'showcmdloc'
---@type string
vim.opt.showcmdloc = "last"

-- https://neovim.io/doc/user/options.html#'showcmd'
---@type boolean
vim.opt.showcmd = true

-- https://neovim.io/doc/user/options.html#'showfulltag'
---@type boolean
vim.opt.showfulltag = false

-- https://neovim.io/doc/user/options.html#'showmatch'
---@type boolean
vim.opt.showmatch = false

-- https://neovim.io/doc/user/options.html#'sidescrolloff'
---@type number
vim.opt.sidescrolloff = 0

-- https://neovim.io/doc/user/options.html#'sidescroll'
---@type number
vim.opt.sidescroll = 1

-- https://neovim.io/doc/user/options.html#'signcolumn'
---@type string
vim.opt.signcolumn = "auto"

-- https://neovim.io/doc/user/options.html#'smarttab'
---@type boolean
vim.opt.smarttab = true

-- https://neovim.io/doc/user/options.html#'smoothscroll'
---@type boolean
vim.opt.smoothscroll = false

-- https://neovim.io/doc/user/options.html#'softtabstop'
---@type number
vim.opt.softtabstop = 0

-- https://neovim.io/doc/user/options.html#'spell'
---@type boolean
vim.opt.spell = false

-- TODO
-- https://neovim.io/doc/user/options.html#'spellcapcheck'
--'spellcapcheck' 'spc' string (default "[.?!]\_[\])'"\t ]\+")

-- https://neovim.io/doc/user/options.html#'spellfile'
---@type string
vim.opt.spellfile = ""

-- https://neovim.io/doc/user/options.html#'spelllang'
---@type string
vim.opt.spelllang = "en"

-- https://neovim.io/doc/user/options.html#'spelloptions'
---@type string
vim.opt.spelloptions = ""

-- https://neovim.io/doc/user/options.html#'spellsuggest'
---@type string
vim.opt.spellsuggest = "best"

-- https://neovim.io/doc/user/options.html#'splitbelow'
---@type boolean
vim.opt.splitbelow = false

-- https://neovim.io/doc/user/options.html#'splitkeep'
---@type string
vim.opt.splitkeep = "cursor"

-- https://neovim.io/doc/user/options.html#'splitright'
---@type boolean
vim.opt.splitright = false

-- https://neovim.io/doc/user/options.html#'startofline'
---@type boolean
vim.opt.startofline = false

-- https://neovim.io/doc/user/options.html#'statuscolumn'
---@type string
vim.opt.statuscolumn = ""

-- https://neovim.io/doc/user/options.html#'statusline'
---@type string
vim.opt.statuscolumn = ""

-- https://neovim.io/doc/user/options.html#'suffixesadd'
---@type string
vim.opt.suffixesadd = ""

-- https://neovim.io/doc/user/options.html#'suffixes'
---@type string
vim.opt.suffixes = ".bak,~,.o,.h,.info,.swp,.obj"

-- https://neovim.io/doc/user/options.html#'switchbuf'
---@type string
vim.opt.switchbuf = "uselast"

-- https://neovim.io/doc/user/options.html#'synmaxcol'
---@type number
vim.opt.synmaxcol = 3000

-- https://neovim.io/doc/user/options.html#'syntax'
---@type string
vim.opt.syntax = ""

-- https://neovim.io/doc/user/options.html#'tabline'
---@type string
vim.opt.tabline = ""

-- https://neovim.io/doc/user/options.html#'tabpagemax'
---@type number
vim.opt.tabpagemax = 50

-- https://neovim.io/doc/user/options.html#'tagbsearch'
---@type boolean
vim.opt.tagbsearch = true

-- https://neovim.io/doc/user/options.html#'tagcase'
---@type string
vim.opt.tagcase = "followic"

-- https://neovim.io/doc/user/options.html#'tagfunc'
---@type string
vim.opt.tagfunc = ""

-- https://neovim.io/doc/user/options.html#'taglength'
---@type number
vim.opt.taglength = 0

-- https://neovim.io/doc/user/options.html#'tagrelative'
---@type boolean
vim.opt.tagrelative = true

-- https://neovim.io/doc/user/options.html#'tagstack'
---@type boolean
vim.opt.tagstack = true

-- https://neovim.io/doc/user/options.html#'tags'
---@type string
vim.opt.tags = "./tags;,tags"

-- https://neovim.io/doc/user/options.html#'termbidi'
---@type boolean
vim.opt.termbidi = false

-- https://neovim.io/doc/user/options.html#'termpastefilter'
---@type string
vim.opt.termpastefilter = "BS,HT,ESC,DEL"

-- https://neovim.io/doc/user/options.html#'textwidth'
---@type number
vim.opt.textwidth = 0

-- https://neovim.io/doc/user/options.html#'thesaurusfunc'
---@type string
vim.opt.thesaurusfunc = ""

-- https://neovim.io/doc/user/options.html#'thesaurus'
---@type string
vim.opt.thesaurus = ""

-- https://neovim.io/doc/user/options.html#'tildeop'
---@type boolean
vim.opt.tildeop = false

-- https://neovim.io/doc/user/options.html#'timeoutlen'
---@type number
vim.opt.timeoutlen = 1000

-- https://neovim.io/doc/user/options.html#'timeout'
---@type boolean
vim.opt.timeout = true

-- https://neovim.io/doc/user/options.html#'title'
---@type boolean
vim.opt.title = false

-- https://neovim.io/doc/user/options.html#'titlelen'
---@type number
vim.opt.titlelen = 85

-- https://neovim.io/doc/user/options.html#'titleold'
---@type string
vim.opt.titleold = ""

-- https://neovim.io/doc/user/options.html#'titlestring'
---@type string
vim.opt.titlestring = ""

-- https://neovim.io/doc/user/options.html#'ttimeout'
---@type boolean
vim.opt.ttimeout = true

-- https://neovim.io/doc/user/options.html#'ttimeoutlen'
---@type number
vim.opt.ttimeoutlen = 50

-- https://neovim.io/doc/user/options.html#'undodir'
---@type string
vim.opt.undodir = "$XDG_STATE_HOME/nvim/undo//"

-- https://neovim.io/doc/user/options.html#'undofile'
---@type boolean
vim.opt.undofile = false

-- https://neovim.io/doc/user/options.html#'undolevels'
---@type number
vim.opt.undolevels = 1000

-- https://neovim.io/doc/user/options.html#'undoreload'
---@type number
vim.opt.undoreload = 10000

-- https://neovim.io/doc/user/options.html#'updatecount'
---@type number
vim.opt.updatecount = 200

-- https://neovim.io/doc/user/options.html#'varsofttabstop'
---@type string
vim.opt.varsofttabstop = ""

-- https://neovim.io/doc/user/options.html#'vartabstop'
---@type string
vim.opt.vartabstop = ""

-- https://neovim.io/doc/user/options.html#'verbosefile'
---@type string
vim.opt.verbosefile = ""

-- https://neovim.io/doc/user/options.html#'verbose'
---@type number
vim.opt.verbose = 0

-- https://neovim.io/doc/user/options.html#'viewdir'
---@type string
vim.opt.viewdir = "$XDG_STATE_HOME/nvim/view//"

-- https://neovim.io/doc/user/options.html#'viewoptions'
---@type string
vim.opt.viewoptions = "folds,cursor,curdir"

-- https://neovim.io/doc/user/options.html#'virtualedit'
---@type string
vim.opt.virtualedit = ""

-- https://neovim.io/doc/user/options.html#'warn'
---@type boolean
vim.opt.warn = true

-- https://neovim.io/doc/user/options.html#'wildcharm'
---@type number
vim.opt.wildcharm = 0

-- TODO
-- https://neovim.io/doc/user/options.html#'wildchar'
--'wildchar' 'wc'  number (default <Tab>)

-- https://neovim.io/doc/user/options.html#'wildignorecase'
---@type boolean
vim.opt.wildignorecase = false

-- https://neovim.io/doc/user/options.html#'wildignore'
---@type string
vim.opt.wildignore = ""

-- https://neovim.io/doc/user/options.html#'wildmenu'
---@type boolean
vim.opt.wildmenu = true

-- https://neovim.io/doc/user/options.html#'wildmode'
---@type string
vim.opt.wildmode = "full"

-- https://neovim.io/doc/user/options.html#'wildoptions'
---@type string
vim.opt.wildoptions = "pum,tagfile"

-- https://neovim.io/doc/user/options.html#'winaltkeys'
---@type string
vim.opt.winaltkeys = "menu"

-- https://neovim.io/doc/user/options.html#'winbar'
---@type string
vim.opt.winbar = ""

-- https://neovim.io/doc/user/options.html#'winblend'
---@type number
vim.opt.winblend = 0

-- TODO
-- https://neovim.io/doc/user/options.html#'window'
--'window' 'wi'  number (default screen height - 1)

-- https://neovim.io/doc/user/options.html#'winfixheight'
---@type boolean
vim.opt.winfixheight = false

-- https://neovim.io/doc/user/options.html#'winfixwidth'
---@type boolean
vim.opt.winfixwidth = false

-- https://neovim.io/doc/user/options.html#'winheight'
---@type number
vim.opt.winheight = 1

-- https://neovim.io/doc/user/options.html#'winhighlight'
---@type string
vim.opt.winhighlight = ""

-- https://neovim.io/doc/user/options.html#'winminheight'
---@type number
vim.opt.winminheight = 1

-- https://neovim.io/doc/user/options.html#'winminwidth'
---@type number
vim.opt.winminwidth = 1

-- https://neovim.io/doc/user/options.html#'winwidth'
---@type number
vim.opt.winwidth = 20

-- https://neovim.io/doc/user/options.html#'wrap'
---@type boolean
vim.opt.wrap = true

-- https://neovim.io/doc/user/options.html#'wrapmargin'
---@type number
vim.opt.wrapmargin = 0

-- https://neovim.io/doc/user/options.html#'writeany'
---@type boolean
vim.opt.writeany = false

-- https://neovim.io/doc/user/options.html#'writebackup'
---@type boolean
vim.opt.writebackup = true

-- https://neovim.io/doc/user/options.html#'write'
---@type boolean
vim.opt.write = true

-- https://neovim.io/doc/user/options.html#'writedelay'
---@type number
vim.opt.writedelay = 0
