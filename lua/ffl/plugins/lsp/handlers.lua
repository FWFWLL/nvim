local M = {}

local function lsp_keymaps(client, bufnr)
	local function buf_set_keymap(mode, lhs, rhs) vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, {noremap = true, silent = true}) end

	-- General
	buf_set_keymap("n", "gd", "<CMD>Telescope lsp_definitions<CR>")
	buf_set_keymap("n", "gr", "<CMD>Telescope lsp_references<CR>")
	buf_set_keymap("n", "K", [[<CMD>lua vim.lsp.buf.hover({border = "rounded"})<CR>]])
	buf_set_keymap("n", "<M-a>", "<CMD>lua vim.lsp.buf.code_action()<CR>")
	buf_set_keymap("n", "<M-r>", "<CMD>lua vim.lsp.buf.rename()<CR>")
	buf_set_keymap("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>")
	buf_set_keymap("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>")

	-- Clangd
	if client.name == "clangd" then
		buf_set_keymap("n", "go", "<CMD>ClangdSwitchSourceHeader<CR>")
	end
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(client, bufnr)

	client.server_capabilities.documentFormattingProvider = false

	if client.name == "omnisharp" then
		client.server_capabilities.semanticTokensProvider = {
			full = vim.empty_dict(),
			legend = {
				tokenModifiers = {"static_symbol"},
				tokenTypes = {
					"class_name",
					"comment",
					"constant_name",
					"delegate_name",
					"enum_member_name",
					"enum_name",
					"event_name",
					"excluded_code",
					"extension_method_name",
					"field_name",
					"identifier",
					"interface_name",
					"keyword",
					"keyword_control",
					"label_name",
					"local_name",
					"method_name",
					"module_name",
					"namespace_name",
					"number",
					"operator",
					"operator_overloaded",
					"parameter_name",
					"preprocessor_keyword",
					"preprocessor_text",
					"property_name",
					"punctuation",
					"regex_alternation",
					"regex_anchor",
					"regex_character_class",
					"regex_comment",
					"regex_grouping",
					"regex_other_escape",
					"regex_quantifier",
					"regex_self_escaped_character",
					"regex_text",
					"static_symbol",
					"string",
					"string_escape_character",
					"string_verbatim",
					"struct_name",
					"text",
					"type_parameter_name",
					"whitespace",
					"xml_doc_comment_attribute_name",
					"xml_doc_comment_attribute_quotes",
					"xml_doc_comment_attribute_value",
					"xml_doc_comment_cdata_section",
					"xml_doc_comment_comment",
					"xml_doc_comment_delimiter",
					"xml_doc_comment_entity_reference",
					"xml_doc_comment_name",
					"xml_doc_comment_processing_instruction",
					"xml_doc_comment_text",
					"xml_literal_attribute_name",
					"xml_literal_attribute_quotes",
					"xml_literal_attribute_value",
					"xml_literal_cdata_section",
					"xml_literal_comment",
					"xml_literal_delimiter",
					"xml_literal_embedded_expression",
					"xml_literal_entity_reference",
					"xml_literal_name",
					"xml_literal_processing_instruction",
					"xml_literal_text",
				},
			},
			range = true,
		}
	end
end

local preq = require("ffl.functions").preq

local status_ok, cmp_nvim_lsp = preq("cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

return M
