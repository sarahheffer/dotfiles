" Allow vim to break compatibility with vi
set nocompatible " This must be first, because it changes other options

set number

" Add full file path to your existing statusline
set statusline+=%F
set laststatus=2

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

let g:syntastic_python_pep8_args="--ignore=E501,E121,E125,E126,E128,C0111"


" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Fuzzy file opener
Plug 'kien/ctrlp.vim'

" Syntastic: Code linting errors
Plug 'scrooloose/syntastic'

" Run Python tests in tmux splits
Plug 'captbaritone/vim-vigilant', { 'for': 'python' }
Plug 'benmills/vimux', { 'for': ['python', 'javascript'] }

" Python completion and tag navigation
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

" Make tab handle all completions
Plug 'ervandew/supertab'

let g:vigilant_cmd = 'clear && cd ~/projects/HearsayLabs/fanmgmt && ./run.sh manage.py test --settings=settings.sheffer'

nnoremap <leader>j :call VimuxRunCommand('./run.sh run_jasmine.py ' . expand('%'))<cr>

" Run all your tests
" e.g.  nosetests
nnoremap <leader>va :VigilantRunTests<cr>

" Run the currently open test file
" e.g.  nosetests /path/to/my/file.py
nnoremap <leader>vf :VigilantRunCurrentTests<cr>

" Run a single test class based on cursor postion
" e.g.  nosetests /path/to/my/file.py:MySuite
nnoremap <leader>vc :VigilantRunTestClass<cr>

" Run a single test method based on cursor postion
" e.g.  nosetests /path/to/my/file.py:MySuite.my_test_method
nnoremap <leader>vm :VigilantRunSingleTest<cr>

" Rerun your last Vigilant test command
nnoremap <leader>vv :VigilantRerun<cr>

filetype plugin indent on                   " required!
call plug#end()
