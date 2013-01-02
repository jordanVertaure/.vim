" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) n marche aussi
set ttymouse=xterm2
set nu

" Souligne la ligne actuelle en cours d'insertion
autocmd InsertLeave * set nocul
autocmd InsertEnter * set cul

" Recharge automatiquement le .vimrc
autocmd BufWritePost .vimrc source~/.vimrc

" ctrl-a comme tout le monde
map <C-a> ggVG

"undo après avoir redémarré vim
if exists("+undofile")
	if isdirectory($HOME . '/.vim/undo')==0
		:silent!mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=-/.vim/undo//
	set undofile
endif

" switch entre numérotation relative et absolue
"au InsertEnter * :set nu
"au InsertLeave * :set rnu

"lancer code python
"map <f5> :w<CR>!clear <CR>!python % <CR>

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Met en rouge les caractères des lignes de plus de 80 caractères
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.*/

" Met en surbrillance les caractères non imprimables non désirés
highlight NoSpacesEOL ctermbg=red ctermfg=white guibg=#592929
match NoSpacesEOL / \+$/

