return {
  { "nvim-treesitter/nvim-treesitter",
    lazy=false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.config").setup({
        auto_install = true,
        ensure_installed = { "java", },
        highlight = { enable = true, },
        indent = { enable = true, },
      })
    end },
  { "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({
        vim.keymap.set("n", "Øs", require("treesj").toggle),
        vim.keymap.set("n", "Øj", function() require("treesj").toggle({ split = { recursive = true } }) end)
      })
    end, },
  { "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter", },
    init = function ()
      vim.g.no_plugin_maps = true
     -- Or, disable per filetype (add as you like)
    -- vim.g.no_python_maps = true
    -- vim.g.no_ruby_maps = true
    -- vim.g.no_rust_maps = true
    -- vim.g.no_go_maps = true
    end,
    config = function()
      local select = require("nvim-treesitter-textobjects.select")
      local move = require("nvim-treesitter-textobjects.move")
      local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"
      require "nvim-treesitter-textobjects".setup({
          select = {
            enable = true,
            include_surrounding_whitespace = false,
            lookahead = true,
            selection_modes = {
              ["@call.outer"] = "V",
              ["@call.inner"] = "v",
              ["@function.outer"] = "V",
              ["@function.inner"] = "v",
              ["@class.outer"] = "V",
              ["@class.inner"] = "v",
              ["@conditional.outer"] = "V",
              ["@conditional.inner"] = "v",
              ["@loop.outer"] = "V",
              ["@loop.inner"] = "v",
              ["@parameter.outer"] = "V",
              ["@parameter.inner"] = "v",
              ["@attribute.outer"] = "V",
              ["@attribute.inner"] = "v",
              ["@comment.inner"] = "v",
              ["@comment.outer"] = "V",
              ["@return.inner"] = "v",
              ["@return.outer"] = "V",
            },
          },
          move = {set_jumps = true,},
        })
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

      vim.keymap.set({ "x", "o" }, "aj", function() select.select_textobject("@call.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "ij", function() select.select_textobject("@call.inner", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "aj", function() select.select_textobject("@function.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "if", function() select.select_textobject("@function.inner", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "as", function() select.select_textobject("@class.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "is", function() select.select_textobject("@class.inner", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "ac", function() select.select_textobject("@conditional.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "ic", function() select.select_textobject("@conditional.inner", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "al", function() select.select_textobject("@loop.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "il", function() select.select_textobject("@loop.inner", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "ap", function() select.select_textobject("@parameter.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "ip", function() select.select_textobject("@parameter.inner", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "ak", function() select.select_textobject("@comment.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "ik", function() select.select_textobject("@comment.inner", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "ar", function() select.select_textobject("@return.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "ir", function() select.select_textobject("@return.inner", "textobjects") end)

      vim.keymap.set({"n", "x", "o" }, "]aj", function() move.goto_next_start("@call.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "]ij", function() move.goto_next_start("@call.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "]aj", function() move.goto_next_start("@function.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "]if", function() move.goto_next_start("@function.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "]as", function() move.goto_next_start("@class.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "]is", function() move.goto_next_start("@class.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "]ac", function() move.goto_next_start("@conditional.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "]ic", function() move.goto_next_start("@conditional.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "]al", function() move.goto_next_start("@loop.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "]il", function() move.goto_next_start("@loop.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "]ap", function() move.goto_next_start("@parameter.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "]ip", function() move.goto_next_start("@parameter.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "]ak", function() move.goto_next_start("@comment.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "]ik", function() move.goto_next_start("@comment.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "]ar", function() move.goto_next_start("@return.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "]ir", function() move.goto_next_start("@return.inner", "textobjects") end)

      vim.keymap.set({"n", "x", "o" }, "[aj", function() move.goto_next_end("@call.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "[ij", function() move.goto_next_end("@call.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "[aj", function() move.goto_next_end("@function.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "[if", function() move.goto_next_end("@function.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "[as", function() move.goto_next_end("@class.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "[is", function() move.goto_next_end("@class.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "[ac", function() move.goto_next_end("@conditional.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "[ic", function() move.goto_next_end("@conditional.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "[al", function() move.goto_next_end("@loop.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "[il", function() move.goto_next_end("@loop.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "[ap", function() move.goto_next_end("@parameter.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "[ip", function() move.goto_next_end("@parameter.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "[ak", function() move.goto_next_end("@comment.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "[ik", function() move.goto_next_end("@comment.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "[ar", function() move.goto_next_end("@return.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "[ir", function() move.goto_next_end("@return.inner", "textobjects") end)

      vim.keymap.set({"n", "x", "o" }, "}aj", function() move.goto_previous_start("@call.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "}ij", function() move.goto_previous_start("@call.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "}aj", function() move.goto_previous_start("@function.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "}if", function() move.goto_previous_start("@function.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "}as", function() move.goto_previous_start("@class.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "}is", function() move.goto_previous_start("@class.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "}ac", function() move.goto_previous_start("@conditional.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "}ic", function() move.goto_previous_start("@conditional.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "}al", function() move.goto_previous_start("@loop.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "}il", function() move.goto_previous_start("@loop.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "}ap", function() move.goto_previous_start("@parameter.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "}ip", function() move.goto_previous_start("@parameter.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "}ak", function() move.goto_previous_start("@comment.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "}ik", function() move.goto_previous_start("@comment.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "}ar", function() move.goto_previous_start("@return.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "}ir", function() move.goto_previous_start("@return.inner", "textobjects") end)

      vim.keymap.set({"n", "x", "o" }, "{aj", function() move.goto_previous_end("@call.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "{ij", function() move.goto_previous_end("@call.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "{aj", function() move.goto_previous_end("@function.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "{if", function() move.goto_previous_end("@function.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "{as", function() move.goto_previous_end("@class.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "{is", function() move.goto_previous_end("@class.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "{ac", function() move.goto_previous_end("@conditional.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "{ic", function() move.goto_previous_end("@conditional.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "{al", function() move.goto_previous_end("@loop.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "{il", function() move.goto_previous_end("@loop.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "{ap", function() move.goto_previous_end("@parameter.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "{ip", function() move.goto_previous_end("@parameter.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "{ak", function() move.goto_previous_end("@comment.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "{ik", function() move.goto_previous_end("@comment.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "{ar", function() move.goto_previous_end("@return.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "{ir", function() move.goto_previous_end("@return.inner", "textobjects") end)

      vim.keymap.set({"n", "x", "o" }, ")aj", function() move.goto_next("@call.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, ")ij", function() move.goto_next("@call.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, ")aj", function() move.goto_next("@function.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, ")if", function() move.goto_next("@function.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, ")as", function() move.goto_next("@class.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, ")is", function() move.goto_next("@class.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, ")ac", function() move.goto_next("@conditional.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, ")ic", function() move.goto_next("@conditional.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, ")al", function() move.goto_next("@loop.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, ")il", function() move.goto_next("@loop.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, ")ap", function() move.goto_next("@parameter.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, ")ip", function() move.goto_next("@parameter.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, ")ak", function() move.goto_next("@comment.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, ")ik", function() move.goto_next("@comment.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, ")ar", function() move.goto_next("@return.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, ")ir", function() move.goto_next("@return.inner", "textobjects") end)

      vim.keymap.set({"n", "x", "o" }, "(aj", function() move.goto_previous("@call.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "(ij", function() move.goto_previous("@call.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "(aj", function() move.goto_previous("@function.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "(if", function() move.goto_previous("@function.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "(as", function() move.goto_previous("@class.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "(is", function() move.goto_previous("@class.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "(ac", function() move.goto_previous("@conditional.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "(ic", function() move.goto_previous("@conditional.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "(al", function() move.goto_previous("@loop.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "(il", function() move.goto_previous("@loop.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "(ap", function() move.goto_previous("@parameter.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "(ip", function() move.goto_previous("@parameter.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "(ak", function() move.goto_previous("@comment.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "(ik", function() move.goto_previous("@comment.inner", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "(ar", function() move.goto_previous("@return.outer", "textobjects") end)
      vim.keymap.set({"n", "x", "o" }, "(ir", function() move.goto_previous("@return.inner", "textobjects") end)
    end },
}
