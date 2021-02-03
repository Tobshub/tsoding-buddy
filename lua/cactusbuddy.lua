local Color, c, Group, g, s = require('colorbuddy').setup()
local v = vim

v.g.colors_name = 'cactusbuddy'

local palette = {
    white   = { gui='#A8A8A8', cterm=248 },
    light   = { gui='#8A8A8A', cterm=245 },
    grey    = { gui='#808080', cterm=244 },
    dark    = { gui='#585858', cterm=240 },
    darker  = { gui='#444444', cterm=238 },
    base    = { gui='#303030', cterm=236 },
    black   = { gui='#262626', cterm=235 },
    backgnd = { gui='#1C1C1C', cterm=234 },

    cactus  = { gui='#87AF5F', cterm=107 }, -- limegreen
    moss    = { gui='#5F875F', cterm=065 }, -- darkgreen
    fruit   = { gui='#D787AF', cterm=175 }, -- pink
    purple  = { gui='#8787AF', cterm=103 },
    cyan    = { gui='#87AFD7', cterm=110 },
    brown   = { gui='#AF875F', cterm=137 },
    blue    = { gui='#5F87AF', cterm=067 },
    red     = { gui='#D75F5F', cterm=167 },
    orange  = { gui='#D7875F', cterm=173 },
    yellow  = { gui='#AFAF5F', cterm=145 },
}

-- assume this function exists
Group.link = function(name, group)
    Group.new(name, group, group, group)
end

-- initialize all colors from palette
for key, value in pairs(palette) do
    Color.new(key, value.gui)
end

-- EDITOR BASICS

Group.new('Normal',       c.grey,   c.none,  s.none)
Group.new('Statement',    c.white,  c.none,  s.none)
Group.new('Comment',      c.dark,   c.none,  s.none)
Group.new('NonText',      c.darker, c.none,  s.none)
Group.new('Whitespace',   c.dark,   c.none,  s.none)

Group.new('Constant',     c.cactus, c.none,  s.none)
Group.new('String',       c.moss,   c.none,  s.none)
Group.new('Todo',         c.fruit,  c.none,  s.none)
Group.new('Special',      c.purple, c.none,  s.none)
Group.new('Title',        c.cyan,   c.none,  s.none)
Group.new('User1',        c.brown,  c.none,  s.none)
Group.new('User2',        c.blue,   c.none,  s.none)

Group.new('Error',        c.red,    c.none,  s.none)
Group.new('Warning',      c.orange, c.none,  s.none)

Group.new('DiffAdd',      c.none,   c.black,  s.none)
Group.new('DiffChange',   c.none,   c.black,  s.none)
Group.new('DiffDelete',   c.darker, c.black,  s.none)
Group.new('DiffText',     c.none,   c.black,  s.underline)
Group.new('DiffAdded',    c.cactus, c.none,   s.none)
Group.new('DiffRemoved',  c.red,    c.none,   s.none)

Group.new('IncSearch',    c.none,   c.none,  s.reverse)
Group.new('Search',       c.fruit,  c.none,  s.underline)
Group.new('WildMenu',     c.fruit,  c.base,  s.none)

Group.new('Visual',       c.none,   c.base,  s.none)
Group.new('VisualNOS',    c.none,   c.base,  s.none)
Group.new('StatusLine',   c.light,  c.base,  s.none)
Group.new('StatusLineNC', c.base,   c.base,  s.none)
Group.new('CursorLine',   c.none,   c.black, s.none)
Group.new('CursorLineNr', c.grey,   c.none,  s.none)
Group.new('MatchParen',   c.cyan,   c.none,  s.none)

-- LINKS

Group.link('Identifier',     g.Normal)
Group.link('Type',           g.Normal)
Group.link('Delimiter',      g.Normal)
Group.link('Operator',       g.Normal)
Group.link('Noise',          g.Normal)
Group.link('Function',       g.Identifier)
Group.link('StorageClass',   g.Type)
Group.link('Structure',      g.Type)
Group.link('Typedef',        g.Type)
Group.link('VertSplit',      g.Noise)
Group.link('ModeMsg',        g.Noise)

Group.link('PreProc',        g.Special)
Group.link('SpecialChar',    g.Special)
Group.link('Tag',            g.Special)
Group.link('SpecialKey',     g.Special)
Group.link('SpecialComment', g.Special)
Group.link('Debug',          g.Special)
Group.link('Define',         g.PreProc)
Group.link('Macro',          g.PreProc)
Group.link('PreCondit',      g.PreProc)

Group.link('Character',      g.Constant)
Group.link('Number',         g.Constant)
Group.link('Boolean',        g.Constant)
Group.link('Float',          g.Constant)
Group.link('Directory',      g.String)

Group.link('Include',        g.Statement)
Group.link('Conditonal',     g.Statement)
Group.link('Repeat',         g.Statement)
Group.link('Label',          g.Statement)
Group.link('Keyword',        g.Statement)
Group.link('Exception',      g.Statement)

-- USER INTERFACE

Group.link('MoreMsg',     g.Statement)
Group.link('ErrorMsg',    g.Error)
Group.link('WarningMsg',  g.Warning)
Group.link('Question',    g.Warning)

Group.link('LineNr',      g.NonText)
Group.link('Folded',      g.NonText)
Group.link('VertSplit',   g.NonText)
Group.link('EndOfBuffer', g.NonText)
Group.link('qfLineNr',    g.LineNr)
Group.link('FoldColumn',  g.LineNr)
Group.link('SignColumn',  g.LineNr)
Group.link('ColorColumn', g.CursorLine)

Group.link('Pmenu',       g.StatusLine)
Group.link('PmenuSel',    g.WildMenu)
Group.link('PmenuSbar',   g.Pmenu)
Group.link('PmenuThumb',  g.Pmenu)

Group.link('TabLine',     g.Normal)
Group.link('TabLineSel',  g.Keyword)
Group.link('TabLineFill', g.Normal)

Group.link('NvimInternalError', g.Error)

-- PLUGIN SPECIFIC

local statusline = vim.g.cactusbuddy_galaxyline_enabled
if statusline then require 'statusline' end

Group.link('TSConstructor',     g.Normal)
Group.link('TSConditional',     g.Statement)
Group.link('TSFunctionBuiltin', g.Special)
Group.link('TSVariableBuiltin', g.Special)
Group.link('TSKeywordSpecial',  g.Special)
Group.link('TSKeywordOperator', g.Statement)
Group.link('TSConstant',        g.Special)

Group.link('LspDiagnosticsDefaultError',       g.Error)
Group.link('LspDiagnosticsDefaultWarning',     g.Warning)
Group.link('LspDiagnosticsDefaultInformation', g.Todo)  -- not decided
Group.link('LspDiagnosticsDefaultHint',        g.Todo)  -- not decided

Group.link('packerStatusCommit', g.Statement)
Group.link('packerStatusSuccess', g.Statement)
Group.link('packerHash', g.String)

Group.link('ALEErrorSign',   g.Error)
Group.link('ALEWarningSign', g.Warning)

Group.link('GitGutterAdd',          g.Normal)
Group.link('GitGutterChange',       g.Normal)
Group.link('GitGutterChangeDelete', g.Normal)
Group.link('GitGutterDelete',       g.Normal)

Group.link('SignatureMarkText',   g.Todo)
Group.link('SignatureMarkerText', g.Todo)

Group.link('NvimTreeFolderIcon', g.Comment)
Group.link('NvimTreeRootFolder', g.Statement)
Group.link('NvimTreeSymlink',    g.Special)

-- LANGUAGE SPECIFIC

Group.link('vimCommand',   g.Statement)
Group.link('vimnotfunc',   g.Statement)
Group.link('vimlet',       g.Statement)
Group.link('vimAutoCmd',   g.Statement)
Group.link('vimAutoEvent', g.User2)
Group.link('vimHighlight', g.Statement)
Group.link('vimHiBang',    g.Statement)
Group.link('vimMap',       g.Statement)
Group.link('vimMapMod',    g.Special)
Group.link('vimmapmodkey', g.Special)
Group.link('vimmaplhs',    g.Normal)
Group.link('vimbracket',   g.Special)
Group.link('vimnotation',  g.Special)

Group.link('helpSectionDelim',   g.Comment)
Group.link('helpHeadline',       g.Title)
Group.link('helpHeader',         g.Statement)
Group.link('helpHyperTextEntry', g.Constant)
