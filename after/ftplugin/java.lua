vim.opt_local.makeprg = "javac %"
vim.opt_local.errorformat= "%A%f:%l:%m,%-Z%p^,%-C%.%#"


vim.keymap.set("n", "<leader>mc",
  "<cmd>w<CR>" ..
  "<cmd>Make<CR>",
  { desc = "Compile" }
)

vim.keymap.set("n", "<leader>mr",
  "<cmd>w<CR>" ..
  "<cmd>split term://" ..
  "java ".. "%:r<CR>".. -- :r toglie il filetype dal comando
  "<cmd>resize 20<CR>",
  { desc = "Run" }
)



local home = os.getenv("HOME")
local mason_path = vim.fn.stdpath("data") .. "/mason/packages"

-- 1. Locate the vscode-java-debug plugin JAR installed by Mason
local java_debug_path = mason_path .. "/java-debug-adapter"
local bundles = {
  vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
}

local config = {
  cmd = {
    "/usr/lib/jvm/java-27-openjdk/bin/java", -- Ensure JDK 21+ binary
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-DOSGI_bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",

    "-jar", vim.fn.glob(mason_path .. "/jdtls/plugins/org.eclipse.equinox.launcher_*.jar", 1, 1)[1],
    "-configuration", mason_path .. "/jdtls/config_linux",
    "-data", home .. "/.cache/jdtls/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
  },
  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

  -- 2. Register debug bundle with JDTLS
  init_options = {
    bundles = bundles,
  },

  -- 3. Automatically trigger vscode.java.startDebugSession via nvim-jdtls
  on_attach = function(client, bufnr)
    require("jdtls").setup_dap({ hotcodereplace = "auto" })
  end,
}

require("jdtls").start_or_attach(config)
