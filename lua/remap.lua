-- Mode Switch

vim.keymap.set('n', '<C-x>', 'v', { noremap = true, silent = true, desc = 'Switch to visual mode' })
vim.keymap.set('n', '<Esc>', 'i', { noremap = true, silent = true, desc = 'Switch to insert mode' }) 

vim.keymap.set('n', '<C-l>', 'w', { noremap = true, silent = true, desc = 'Move next word start' })
vim.keymap.set('n', '<C-h>', 'b', { noremap = true, silent = true, desc = 'Move prev word start' })
-- Helix: "ret" = "open_below"
vim.keymap.set('n', '<CR>', 'o', { noremap = true, silent = true, desc = 'Open line below' })

-- visual mode settings 
vim.keymap.set('v', '<C-l>', 'w', { noremap = true, silent = true, desc = 'Move next word start' })
vim.keymap.set('v', '<C-h>', 'b', { noremap = true, silent = true, desc = 'Move prev word start' })


-- make emacs like A-w to copy
vim.keymap.set('v' , '<A-w>' , 'y' , { noremap = true , silent = true })
-- make emacs like C-w to cut
vim.keymap.set('v' , '<C-w>' , 'd' , { noremap = true , silent = true })

-- make emacs like C-y to paste 
vim.keymap.set('n' , '<C-y>' , 'P' , { noremap = true , silent = true })
vim.keymap.set('v' , '<C-y>' , 'P' , { noremap = true , silent = true })
vim.keymap.set('i' , '<C-y>' , 'P' , { noremap = true , silent = true })


vim.keymap.set('n' , 'K' , vim.diagnostic.open_float , {noremap = true , silent = true} )
                                                                                        

--vim.keymap.set('n' , '<A-w>' , 'y' , { noremaps = true , silent = true })
--vim.keymap.set('n' , '<A-w>' , 'y' , { noremaps = true , silent = true })

-- Extend to line bounds function in helix

local function cut_current_line()
	vim.cmd('normal! Vd')
end


local function cut_current_word()
	vim.cmd('normal! viwd')
end

local function paste_up()
	vim.cmd('normal! kI')
	vim.cmd('normal! P')
end

local function paste_down()
	vim.cmd('normal! jP')
end

local function move_line_up()
	cut_current_line()
	paste_up()
end

local function move_line_down()
	cut_current_line()
	paste_down()
end

local function move_selection_up()
	vim.cmd('normal! d')
	paste_up()
	vim.cmd('normal! `[v`]')
end

local function move_selection_down()
	vim.cmd('normal! dj')
	paste_down()
	vim.cmd('normal! `[v`]')
end



local function paste_left()
	cut_current_word()
	vim.cmd('normal! hhp')
end

local function paste_right()
	cut_current_word()
	vim.cmd('normal! lp')
end


local function helix_select_line_by_line()
  local mode = vim.api.nvim_get_mode().mode

  if mode == 'n' then
    -- If in Normal mode, start a linewise visual selection on the current line.
    vim.cmd('normal! V')
  elseif mode == 'v' then
    -- If in character-wise visual mode (or block-wise, which also reports 'v' in .mode),
    -- first convert to linewise, then extend down by one line.
    vim.cmd('normal! V') -- Convert current selection to linewise
    vim.cmd('normal! j') -- Extend selection down one line
  elseif mode == 'V' then
    -- If already in linewise visual mode, just extend the selection down by one line.
    vim.cmd('normal! j')
  -- No action for other modes like 'i' (insert) or 'c' (command-line)
  end
end

vim.keymap.set('n' , 'd' , 'x' , {noremap = true})
vim.keymap.set('n' , 'C' , '<C-v>' , {noremap = true})

vim.keymap.set('n' , 'x' , helix_select_line_by_line , {})
vim.keymap.set('v' , 'x' , helix_select_line_by_line , {})


vim.keymap.set('n' , '<A-k>' , move_line_up , { noremap = true , desc = "Move line up" } ) 
vim.keymap.set('n' , '<A-j>'  , move_line_down , {noremap = true , desc = "Move line down" })

vim.keymap.set('n' , '<A-h>' , paste_left , {noremap = true , desc = "Move word left" })
vim.keymap.set('n' , '<A-l>' , paste_right , {noremap = true , desc = "Move word right" })


vim.keymap.set('v' , '<A-k>' , move_selection_up, { noremap = true , desc = "Move selection up" })
vim.keymap.set('v' , '<A-j>' , move_selection_down, { noremap = true , desc = "Move selection down" })








