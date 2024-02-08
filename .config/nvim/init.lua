-- 行番号を表示
vim.opt.number = true

-- タブ文字の代わりにスペースを使う
vim.opt.expandtab = true

-- プログラミング言語に合わせて適切にインデントを自動挿入
vim.opt.smartindent = true

-- 各コマンドやsmartindentで挿入する空白の量  
vim.opt.shiftwidth = 4

-- Tabキーで挿入するスペースの数
vim.opt.softtabstop = 4

-- カレントディレクトリを自動で移動
vim.opt.autochdir = true

-- バッファ内で扱う文字コード
vim.opt.encoding = 'utf-8'

-- 書き込む文字コード : この場合encodingと同じなので省略可
vim.opt.fileencoding = 'utf-8'

-- 読み込む文字コード : この場合UTF-8を試し、だめならShift_JIS 
vim.opt.fileencodings = {'utf-8', 'cp932'}

-- eコマンド等でTabキーを押すとパスを保管する : この場合まず最長一致文字列まで補完し、2回目以降は一つづつ試す
vim.opt.wildmode = 'longest,full'

-- LeaderキーをSpaceに設定(これだけでは意味をなさない)
vim.g.mapleader = "\\<Space>"

-- C++,Java等のインラインブロックを中括弧付きのブロックに展開
vim.api.nvim_set_keymap("n", "<C-j>", "^/(<CR>%a{<CR><Esc>o}<Esc>", {noremap = true})

-- カーソル上の単語を置換
vim.api.nvim_set_keymap("n", "S*", "':%s/\\<' .. vim.fn.expand('<cword>') .. '\\>/'", {noremap = true, expr = true})

-- 挿入モード終了時にIMEをオフ
vim.api.nvim_set_keymap("i", "<Esc>", "<Esc>:call system('fcitx-remote -c')<CR>", {noremap = true, silent = true})

-- ファイルタイプごとにコンパイル/実行コマンドを定義
local function Setup()
  -- フルパスから拡張子を除いたもの
  local no_ext_path = vim.fn.printf("%s/%s", vim.fn.expand("%:h"), vim.fn.expand("%:r"))
  
  -- 各言語の実行コマンド
  local compile_command_dict = {
    c = vim.fn.printf('gcc -std=gnu11 -O2 -lm -o %s.out %s && %s/%s.out', vim.fn.expand("%:r"), vim.fn.expand("%:p"), vim.fn.expand("%:h"), vim.fn.expand("%:r")),
    cpp = vim.fn.printf('g++ -std=gnu++17 -O2 -o %s.out %s && %s/%s.out', vim.fn.expand("%:r"), vim.fn.expand("%:p"), vim.fn.expand("%:h"), vim.fn.expand("%:r")),
    java = vim.fn.printf('javac %s && java %s', vim.fn.expand("%:p"), vim.fn.expand("%:r")),
    cs = vim.fn.printf('mcs -r:System.Numerics -langversion:latest %s && mono %s/%s.exe', vim.fn.expand("%:p"), vim.fn.expand("%:h"), vim.fn.expand("%:r")),
    python = vim.fn.printf('python3 %s', vim.fn.expand("%:p")),
    ruby = vim.fn.printf('ruby %s', vim.fn.expand("%:p")),
    javascript = vim.fn.printf('node %s', vim.fn.expand("%:p")),
    sh = vim.fn.printf('chmod u+x %s && %s', vim.fn.expand("%:p"), vim.fn.expand("%:p"))
  }
  
  -- 実行コマンド辞書に入ってたら実行キーバインドを設定
  if vim.fn.match(vim.tbl_keys(compile_command_dict), vim.bo.filetype) >= 0 then
    -- 下ウィンドウがターミナルであることを前提としている
    vim.api.nvim_set_keymap("n", "<F5>", "<C-w>ji<C-u>" .. compile_command_dict[vim.bo.filetype] .. "<CR>", {noremap = true}) 
  end
end

vim.cmd [[ 
  command! Setup lua Setup()

  "ファイルを開き直したときに実行コマンドを再設定 
  autocmd BufNewFile,BufRead * :Setup

  "RubyとJSではインデントを2マスにする
  autocmd FileType ruby,javascript setlocal shiftwidth=2 softtabstop=2

  " undoを編集前に戻せるように設定
  if has('persistent_undo')
    set undodir=~/.config/nvim/undo
    set undofile
  endif

  " プラグインの設定
  " :PlugInstall でインストール

  call plug#begin('~/.config/nvim/plugged')

  " プラグインをここに追記していく
  Plug 'tpope/vim-commentary'
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'ryanoasis/vim-devicons'
  Plug 'Shougo/ddc.vim'
  Plug 'vim-denops/denops.vim'
  
  " Install your UIs
  Plug 'Shougo/ddc-ui-native'

  " Install your sources
  Plug 'Shougo/ddc-source-around'

  " Install your filters
  Plug 'Shougo/ddc-matcher_head'
  Plug 'Shougo/ddc-sorter_rank'

  call plug#end()

  " NERDTreeの設定
  nmap <C-t> :NERDTreeToggle<CR>

  " vim-indent-guidesの設定
  set tabstop=2 shiftwidth=2 expandtab
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
  let g:indent_guides_start_level = 2
]]
