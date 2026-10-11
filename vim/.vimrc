call plug#begin('~/.vim/plugged')
Plug 'nanotech/jellybeans.vim'
Plug 'puremourning/vimspector'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'instant-markdown/vim-instant-markdown'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'v0lkc/cds.vim'
call plug#end()


set termguicolors
set background=dark
set number
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set showcmd
set splitbelow
set splitright
"set noswapfile
colorscheme jellybeans
syntax on
filetype plugin indent on

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" CoC mappings
""inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
""inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
""inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"
""inoremap <silent><expr> <C-Space> coc#refresh()

augroup coc_formatting
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx call CocAction('format')
augroup END


" Java
"nmap <silent> gd <Plug>(coc-definition)
"nnoremap <silent> K :call CocActionAsync('doHover')<CR>
"nmap <silent> gr <Plug>(coc-references)
"nmap <leader>oi :call CocAction('runCommand', 'java.edit.organizeImports')<CR>



" ========================
" " CoC / LSP
" " ========================

" Go to definition
 nmap <silent> gd <Plug>(coc-definition)

" Go to declaration
 nmap <silent> gy <Plug>(coc-type-definition)

" Go to implementation
 nmap <silent> gi <Plug>(coc-implementation)

" Find references
 nmap <silent> gr <Plug>(coc-references)

" Documentation / hover
 nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Rename symbol
 nmap <leader>rn <Plug>(coc-rename)

" Code action
 nmap <leader>ca <Plug>(coc-codeaction-cursor)

" Next diagnostic/error
 nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Previous diagnostic/error
 nmap <silent> [d <Plug>(coc-diagnostic-prev)

" Show diagnostic
 nnoremap <leader>d :call CocActionAsync('diagnosticInfo')<CR>

" Organize Java imports
 nnoremap <leader>oi :call CocAction('runCommand', 'java.edit.organizeImports')<CR>

" Symbols in current file
 nnoremap <leader>o :CocList outline<CR>

" Workspace symbols
 nnoremap <leader>s :CocList -I symbols<CR>

" All diagnostics
 nnoremap <leader>e :CocList diagnostics<CR>

" Maven project
command! -nargs=1 Javan :!mvn archetype:generate -DgroupId=com.example -DartifactId=<args> -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

command! MvnTest :!mvn test
command! MvnPackage :!mvn clean package
command! MvnRun :!mvn spring-boot:run
command! MvnClean :!mvn clean


" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
augroup nerdtree_refresh
  autocmd!
  autocmd BufWritePost * NERDTreeRefreshRoot
augroup END

" Save with Ctrl+S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>i

" NERDTree folder color
highlight NERDTreeDir guifg=#3ecdde
highlight NERDTreeExecFile guifg=#87af87 
let NERDTreeChDirMode=2


" Use <CR> to confirm completion, or insert newline if no completion popup
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

" Use <Tab> and <S-Tab> to navigate popup menu
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-Space> coc#refresh()

"set mouse=a

nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>c :Commits<CR>

"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:vimspector_enable_mappings = 'HUMAN'

autocmd FileType css,html setlocal nosmartindent


" Change cwd to the directory of the file you open in NERDTree
autocmd BufEnter * if &filetype ==# 'nerdtree' | setlocal bufhidden=wipe | endif
"autocmd BufEnter * silent! lcd %:p:h

" HTML template for new files
augroup html_template
  autocmd!
  autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
augroup END


"Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


nnoremap <C-`> :bot terminal<CR>
