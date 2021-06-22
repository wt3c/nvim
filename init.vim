"" Primeiros passos com NeoVIM
""   21/06/2021
""
"" https://dev.to/thespanishguy/neovim-como-ide-42m7
"" https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/
"" https://github.com/rafi/awesome-vim-colorschemes


"
"""""""""""""""""""""""""""""""
"" Configurações básicas
"""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on
set ruler
set number                    " Numera as linhas
set linebreak                 " Quebra a linha sem quebrar a palavra
set wildmode=longest,list     " Completa o comando com TAB igual o bash
set expandtab                 " Identa com espaços
set autochdir                 " Vai pro diretório do arquivo aberto
set cursorline                " Mostra linha atual mais clara
set cuc                       " Linha no curso vertical
set hlsearch                  " Termo procurado em destaque
set pumheight=15              " Máximo de palavras no popup de autocomplete
set completeopt=menu,preview  " Como mostrar as possibilidade de inserção
set spelllang=pt              " Escolhe o dicionário
set foldenable                " Habilita agrupamento de blocos
set foldcolumn=1              " Exibie coluna com + e - para agrupamentos
set foldmethod=marker         " Define agrupamento por marcas
set foldmarker={,}            " Define marcas de agrupamento como { e }
set foldlevel=9999            " Inicia com todos os agrupamentos abertos
set confirm                   " Pergunta antes de fechar
set title                     " Exibe nome do arquivo
let mapleader = ","           " Mapeia <leader> key

"""""""""""""""""""""""""""""""""""""""""
"" Refresh Ne NeoVIM
"""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
" Reloading...
autocmd! bufwritepost init.vim source % " Reloading o .vimrc sem quando salva

"""""""""""""""""""""""""""""""""""""""
"" Auto formatações
"""""""""""""""""""""""""""""""""""""""
" --------- Limpar automagimente espaços à direita ao salva  ------------------
" autocmd BufWritePre *.py :%s/\s\+$//e
"  -------- XML
autocmd BufWritePre *.* :%s/\s\+$//e

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``
set pastetoggle=<F5>
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""
"" COLORSCHEME
"""""""""""""""""""""""""""""""""""""""
"-------------------------------------Gruvbox
set termguicolors
colorscheme gruvbox
set background=dark " use dark mode
" set background=light " uncomment to use light modv

""""""""""""""""""""""""""""""""""""""""
 "" IndentLine
 """"""""""""""""""""""""""""""""""""""""
 let g:indentLine_enabled = 1
 let g:indentLine_concealcursor = 0
 let g:indentLine_char = '┆'
 let g:indentLine_faster = 1

 """"""""""""""""""""""""""""""""""""""""
 "" Permite selecionar com SHIFT + SETA como no Windows
 """"""""""""""""""""""""""""""""""""""""
 set selectmode=mouse,key
 set mousemodel=popup
 set keymodel=startsel,stopsel
 set selection=exclusive

 """"""""""""""""""""""""""""""""""""""""
 "" Remove o highlight da sua ultima pesquisa
 """"""""""""""""""""""""""""""""""""""""
 noremap <C-n> :nohl<CR>
 vnoremap <C-n> :nohl<CR>
 inoremap <C-n> :nohl<CR>

 """"""""""""""""""""""""""""""""""""""""
 "" Serach insensitive
 """"""""""""""""""""""""""""""""""""""""
 set hlsearch
 set incsearch
 set ignorecase
 set smartcase

 """"""""""""""""""""""""""""""""""""""""
 "" Reais programadores não usam TABs mas espaços :P
 """"""""""""""""""""""""""""""""""""""""
 set tabstop=4
 set softtabstop=4
 set shiftwidth=4
 set shiftround
 set expandtab

 """"""""""""""""""""""""""""""""""""""""
 ""  Lagura do documento
 """"""""""""""""""""""""""""""""""""""""
 set tw=120 " Limite do documento
 set colorcolumn=120 " Posição da barra
 highlight colorcolumn ctermbg=233 " Cor da barra
 set nowrap
 set fo-=t

 """"""""""""""""""""""""""""""""""""""""
 ""  Fazer/desfazer
""""""""""""""""""""""""""""""""""""""""
 set history=200
 set undolevels=200

 """"""""""""""""""""""""""""""""""""""""
 "" Desabiitar o backup~  e swap files
 """"""""""""""""""""""""""""""""""""""""
 set nobackup
 set nowritebackup
 set noswapfile


 """"""""""""""""""""""""""""""""""""""""
 "" Atalhos & Mappings
 """"""""""""""""""""""""""""""""""""""""
 map <C-right> :bn<CR>         " Moving to right tab using CTRL+ the arrows
 map <C-left> :bp<CR>          " Moving to left tab using CTRL+ the arrows
 cnoreabbrev W! w!
 cnoreabbrev Q! q!
 cnoreabbrev Qall! qall!
 cnoreabbrev Wq wq
 cnoreabbrev Wa wa
 cnoreabbrev wQ wq
 cnoreabbrev WQ wq
 cnoreabbrev W w
 cnoreabbrev Q q
 cnoreabbrev Qall qall

 "" Split
 noremap <Leader>h :<C-u>split<CR>
 noremap <Leader>v :<C-u>vsplit<CR>

 "" Set working directory
 noremap <leader>. :lcd %:p:h<CR>

 "" Opens an edit command with the path of the currently edited file filled in
 noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

 "" Opens a tab edit command with the path of the currently edited file filled
 noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

 "" Copy/Paste/Cut
 if has('unnamedplus')
   set clipboard=unnamed,unnamedplus
 endif

 noremap YY "+y<CR>
 noremap <leader>p "+gP<CR>
 noremap XX "+x<CR>

 "" Set Column number
 map <Leader>n :set nonumber<CR>
 map <Leader>nn :set number<CR>
 "" Relative number
 map <Leader>rn :set relativenumber<CR>
 map <Leader>rnn :set norelativenumber<CR>

""""""""""""""""""""""""""""""""""""""""
"" Plugins
""""""""""""""""""""""""""""""""""""""""
call plug#begin()
"""""""""""""""""""""""""""""""""""""""" IDE
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmhedberg/SimpylFold'
Plug 'machakann/vim-highlightedyank'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim' -- require Nvim 0.5
Plug 'luochen1990/rainbow'
" --------------------------------------- AutoComplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"""""""""""""""""""""""""""""""""""""""" Python
"""""""""""""""""""""""""""""""""""""""" Themes
""" One theme to rule them all :P
Plug 'rafi/awesome-vim-colorschemes'

call plug#end()

""""""""""""""""""""""""""""""""""""""""
"" Rainbow
""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle


"""""""""""""""""""""""""""""""""""""""""
"" Telescope
"""""""""""""""""""""""""""""""""""""""""
" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>




"""""""""""""""""""""""""""""""""""""""""
"" NeoMake
let g:neomake_python_enabled_makers = ['pylint']

""""""""""""""""""""""""""""""""""""""""
"" Jedi
""""""""""""""""""""""""""""""""""""""""
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"



""""""""""""""""""""""""""""""""""""""""
"" Deoplete
""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"""""""""""""""""""""""""""""""""""""""
"" NeoFormat
"""""""""""""""""""""""""""""""""""""""
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

"""""""""""""""""""""""""""""""""""""""
"" FZF
"""""""""""""""""""""""""""""""""""""""
nnoremap <c-p> :Files<cr>
" The Silver Search
nnoremap <c-f> :Ag<cr>

"""""""""""""""""""""""""""""""""""""""
""ALE
"""""""""""""""""""""""""""""""""""""""
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

"""""""""""""""""""""""""""""""""""""""
"" COC
"""""""""""""""""""""""""""""""""""""""
"let g:coc_global_extensions = [
"    \  'coc-snippets',
"    \  'coc-emmet',
"    \  'coc-html',
"    \  'coc-css',
"    \  'coc-json',
"    \  'coc-phpls',
"    \  'coc-yaml',
"    \  'coc-prettier',
"    \  'coc-eslint',
"    \  'coc-jedi',
"    \  'coc-python',
"    \   ]

"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"autocmd CursorHold * silent call CocActionAsync('highlight')
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.

" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

""""""""""""""""""""""""""""""""""""""""
"" NerdTree
""""""""""""""""""""""""""""""""""""""""
set encoding=UTF-8
"nerdtree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = []
let NERDTreeStatusline = ''

"nerdtree-git-plugin
"g:NERDTreeGitStatusIndicatorMapCustom
let  g:NERDTreeGitStatusIndicatorMapCustom= {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

map <f2> :NERDTreeToggle<CR>
nnoremap <silent> <F4> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

"" Abre o NERDTree quando não abrir nenhum arquivo
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"" Fechar o VIM se a unica janela a esquerda for o NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" Ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']


""""""""""""""""""""""""""""""""""""""""
"" vim-airline
""""""""""""""""""""""""""""""""""""""""
"" Theme """"""""""""""""""""""""""""""
" let g:airline_theme = 'powerlineish'
let g:airline_theme = 'gruvbox'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

 " let g:airline_theme='terrooairline'
 " let g:airline_powerline_fonts = 1
 " let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#virtualenv#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"" TABs
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_powerline_fonts')
   let g:airline#extensions#tabline#left_sep = ' '
   let g:airline#extensions#tabline#left_alt_sep = '|'
   let g:airline_left_sep          = '▶'
   let g:airline_left_alt_sep      = '»'
   let g:airline_right_sep         = '◀'
   let g:airline_right_alt_sep     = '«'
   let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
   let g:airline#extensions#readonly#symbol   = '⊘'
   let g:airline#extensions#linecolumn#prefix = '¶'
   let g:airline#extensions#paste#symbol      = 'ρ'
   let g:airline_symbols.linenr    = '␊'
   let g:airline_symbols.branch    = '⎇'
   let g:airline_symbols.paste     = 'ρ'
   let g:airline_symbols.paste     = 'Þ'
   let g:airline_symbols.paste     = '∥'
   let g:airline_symbols.whitespace = 'Ξ'
 else
   let g:airline#extensions#tabline#left_sep = ''
   let g:airline#extensions#tabline#left_alt_sep = ''

   " powerline symbols
   let g:airline_left_sep = ''
   let g:airline_left_alt_sep = ''
   let g:airline_right_sep = ''
   let g:airline_right_alt_sep = ''
   let g:airline_symbols.branch = ''
   let g:airline_symbols.readonly = ''
   let g:airline_symbols.linenr = ''
 endif

"""""""""""""""""""""""""""""""""
"" Terminal
""""""""""""""""""""""""""""""""
" Mude para o modo normal com o esc
tnoremap <Esc> <C-\><C-j>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-j> :call OpenTerminal()<CR>

" use alt+hjkl para mover entre split/vsplit paineis
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
