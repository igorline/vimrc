	-- Vimwiki
-- 	{ "vimwiki/vimwiki",           lazy = false, 
--    init = function () --replace 'config' with 'init'
--       -- vim.g.vimwiki_list = {{path = '~/Docs/Mywiki', syntax = 'markdown', ext = '.md'}}

-- vim.g.vimwiki_list = {{
--       path = '~/Documents/wiki',
--       syntax = 'markdown',
--       ext='.md'
--       },
--       {
--       path= '~/Documents/wiki/studies',
--       syntax= 'markdown',
--       ext= '.md'
--       }
--     }
--[=====[ 
syntax match atWord '@\w\+'
highlight link atWord Special

" Match @todo, will override previous match
syntax match myTodo '@\ctodo'
highlight link myTodo Todo

" Modify checkboxes and marks to stand out more
syntax region myCheckMark matchgroup=myCheckBox start='[-*]\s\[' end='\][^(]' skip='[ \.oOX]{1}' oneline
highlight link myCheckBox Delimiter
highlight link myCheckMark Special

" function! VimwikiLinkHandler(link)
  " try
    " call system('firefox-dev ' . shellescape(a:link).' &')
    " " let browser = 'firefox-dev'
    " " execute '!start "'.browser.'" ' . a:link
    " return 1
  " catch
    " echo "This can happen for a variety of reasons ..."
  " endtry
  " return 0
" endfunction

" No url shortening
let g:vimwiki_url_maxsave=4
" let g:vimwiki_map_prefix = 'e'
" let g:vimwiki_conceallevel = 2
"

" autocmd Filetype vimwiki set filetype=markdown.vimwiki

" hi link VimwikiHeaderChar htmlBold

" let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\='



 
nmap <Leader>tl <Plug>VimwikiToggleListItem 
vmap <Leader>tl <Plug>VimwikiToggleListItem
nmap <Leader>wh <Plug>VimwikiSplitLink
vmap <Leader>wh <Plug>VimwikiSplitLink
nmap <Leader>wv <Plug>VimwikiVSplitLink
vmap <Leader>wv <Plug>VimwikiVSplitLink

nmap <M-Space> <Plug>VimwikiToggleListItem
autocmd FileType vimwiki nmap <F10> i- [ ]

au! BufRead,BufNewFile *.md       set filetype=mkd syntax=markdown
au! BufRead,BufNewFile *.md.asc       set filetype=mkd syntax=markdown

autocmd BufNewFile ~/Documents/diary/[0-9]*.md :silent %!echo "\# `date -d '%:t:r' +'\%A, \%B \%d \%Y'`\n"
},--]=====]
--    end
-- },
return {
-- nmap <M-Space> <Plug>VimwikiToggleListItem
  vim.keymap.set('n', '<M-Space>', '<Plug>VimwikiToggleListItem')
}
