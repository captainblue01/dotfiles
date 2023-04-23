# IDS NEOVIM CONFIG

## Dependencies

- nodejs
- yarn
- pip
- npn
- python
- lazygit

## Keymaps

- **<Space>** _Leader Key_
- **<M-e>** _After adding a parens you can add wrap the text_

### Search

- **<leader>f/** _Find in current buffer_
- **<leader>ff** _Find file in current project_
- **<leader>ft** _Live grep in current project_
- **<leader>fh** _Search / find help_
- **<leader>fr** _Find recent file_

### Run Code

- **<leader>rp** _Run Python Code_
- **<leader>rl** _Run Lua Code_
- **<leader>rm** _Run Markdown Code_

### Visual mode

- **[<,>]** _Indent text block_
- **<A-[j,k]>** \*Move Code block up or down

### Window Control

- **<AS-[h,j,k,l]>** _Resize window_
- **<A-[h,j,k,l]** _Shift focus_

### Buffers

- **<A-[o,p]** _Cycle Between buffers_
- **<Space> bn** _Next Buffer buffer_
- **<Space> bp** _previous Buffer buffer_
- **<Space> bk** _Kills buffer_
- **<Space> bs** _Brings up list of buffers to switch_

### CMP

- **<A-[j,k]>** _Cycle up or down through CMP results_
- **<A-[b,f]>** _Cycle back or forward through CMP Docs_

- **<A-Space>** _Bring up the completion menu_
- **<A-e>** _Closes the completion menu_

### LSP

- **K** _Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover()._
- **gd** _Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition()._
- **gD** _Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration()._
- **gi** _Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation()._
- **go** _Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition()._
- **gr** _Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references()._
- **<Ctrl-k>** _Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound._
- **<F2>** _Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename()._
- **<F4>** _Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action()._
- **gl** _Show diagnostics in a floating window. See :help vim.diagnostic.open_float()._
- **[d** _Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev()._
- **]d** _Move to the next diagnostic. See :help vim.diagnostic.goto_next()._

### Commenting

- **gc** _Comment out selction of code_
- **gb** _Comment out selection of code in code block mode_
- **gcc** _Comment out single line of code or toggles number entered as prefix_
- **gbc** \*Comment out current line in block style\*\*
- **gco** _Create a new comment on line below and enter insert mode_
- **gcO** _Create a new comment on line above and enter insert mode_

### NVIM Tree

- You can open file in a new split by opening with the **v** key
- You can close a directory / node with the **h** key

<pre>
~/.config/nvim
├── init.lua
├── lua
│   ├── keymaps.lua
│   ├── options.lua
│   └── plugins
│       ├── autopairs.lua
│       ├── buffer-line.lua
│       ├── buffer_delete.lua
│       ├── cmp-lsp.lua
│       ├── color-highlighting.lua
│       ├── color-scheme.lua
│       ├── comments.lua
│       ├── greeter.lua
│       ├── impatient.lua
│       ├── indentline.lua
│       ├── lualine.lua
│       ├── markdown-preview.lua
│       ├── null-ls.lua
│       ├── nvim-tree.lua
│       ├── project.lua
│       ├── tabout.lua
│       ├── telescope.lua
│       ├── toggle-term.lua
│       ├── treesitter.lua
│       ├── undo_tree.lua
│       └── which-key.lua
└── readme.md
</pre>
