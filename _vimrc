"--------dein.vim config------
if &compatible
    set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/dein/dein.vim

if dein#load_state('~/.vim/dein')
    "dein file
    call dein#begin('~/.vim/dein')
    
    "TOML file with plugin list
    let g:dein_dir=expand('~/.vim/dein')
    let s:toml=g:dein_dir . '/dein.toml'
    let s:lazy_toml=g:dein_dir . '/dein_lazy.toml'

    "plugin is written in TOML file
    call dein#load_toml(s:toml,{'lazy':0})
    call dein#load_toml(s:lazy_toml,{'lazy':1})

    call dein#end()
    call dein#save_state()
endif

"not install check
if dein#check_install()
    call dein#install()
endif

filetype plugin indent on
syntax enable

"standard setting--------------------------------------
set number 
set title
set encoding=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set tabstop=4
set expandtab
set shiftwidth=4
set incsearch
set smartindent

"Ctag config-------------------------------------------
set tags=.tags;$HOME
function! s:execute_ctags() abort
	" 探すタグファイル名
	let tag_name = '.tags'
	" ディレクトリを遡り、タグファイルを探し、パス取得
	let tags_path = findfile(tag_name, '.;')
	" タグファイルパスが見つからなかった場合
	
	if tags_path ==# ''
		return
	endif
	" タグファイルのディレクトリパスを取得
	" `:p:h`の部分は、:h  filename-modifiersで確認
	let tags_dirpath =  fnamemodify(tags_path,':p:h')
	"見つかったタグファイルのディレクトリに移動して、ctagsをバックグラウンド実行（エラー出力破棄）
	execute 'silent !cd' tags_dirpath '&&  ctags -R -f' tag_name '2> /dev/null &'
endfunction

augroup ctags
	autocmd!
	autocmd BufWritePost * call s:execute_ctags()
augroup END

"Color config------------------------------------------
colorscheme molokai
hi LineNr ctermfg=DarkGray
hi Comment ctermfg=DarkGray

"Plugin delete-----------------------------------------
"call map(dein#check_clean(), "delete(v:val, 'rf')")
"上記を有効にしたのち再起動:call dein#recache_runtimepath()を実行
