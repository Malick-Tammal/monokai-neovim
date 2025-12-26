return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",

	dependencies = {
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
		},
		"onsails/lspkind.nvim",
		"lukas-reineke/cmp-under-comparator",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-emoji",
		"octaltree/cmp-look",
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		local tailwind_formatter = require("tailwindcss-colorizer-cmp")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu, menuone, preview",
			},

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			window = {
				completion = {
					-- border = "rounded",
					winhighlight = "Normal:CmpPmenu,FloatBorder:CmpMenuBorder,CursorLine:PmenuSel,Search:None",
					side_padding = 1,
				},
				documentation = {
					-- border = "rounded",
					winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpMenuBorder",
				},
			},

			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.complete(),
				["<C-d>"] = cmp.mapping.abort(),
			}),

			sources = cmp.config.sources({
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "calc" },
				{ name = "emoji" },
				{ name = "look", keyword_length = 2 },
			}),

			formatting = {
				fields = { "kind", "abbr", "menu" },

				-- Complex menu
				-- format = function(entry, vim_item)
				-- 	local kind_icon = lspkind.symbolic(vim_item.kind, { mode = "symbol" }) or ""
				-- 	-- vim_item.kind = kind_icon
				-- 	vim_item.kind = string.format("%s %s", kind_icon, vim_item.kind)
				-- 	vim_item.abbr = " " .. vim_item.abbr -- two spaces; adjust as needed
				-- 	vim_item.menu = ({
				-- 		nvim_lsp = "[LSP]",
				-- 		buffer = "[BUF]",
				-- 		path = "[PATH]",
				-- 		luasnip = "[SNIP]",
				-- 	})[entry.source.name] or ""
				-- 	return vim_item
				-- end,

				-- Simple menu
				format = function(entry, vim_item)
					local icon = lspkind.symbolic(vim_item.kind, { mode = "symbol" }) or ""
					vim_item.kind = icon
					vim_item.abbr = " " .. vim_item.abbr
					vim_item = tailwind_formatter.formatter(entry, vim_item)
					return vim_item
				end,
			},

			--  INFO: Ghost text
			experimental = {
				ghost_text = false,
			},

			sorting = {
				comparators = {
					require("cmp-under-comparator").under,
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
		})
	end,
}
