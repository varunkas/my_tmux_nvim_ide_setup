local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key


-- Snippets for nextflow Workflow
ls.add_snippets("nextflow", {
  s("workflow", {
    t({ "workflow " }), i(1, "main"), t({ " {", "" }),
    t({ "\ttake:", "" }),
    t({ "\t\t" }), i( 3, "<inputs>" ),
    t({ "", "\tmain:", "" }),
    t({ "\t\t" }), i( 3, "<dataflow_statments>" ),
    t({ "", "\temit:", "" }),
    t({ "\t\t" }), i( 3, "<outputs>" ),
    t({ "", "}" }),
  }),
})

-- Snippets for nextflow process
ls.add_snippets("nextflow", {
  s("process", {
    t({ "process " }), i(1, "name"), t({ " {", "" }),
    t({ "\ttag " }), i(2, "tag"),
    t({ "", "\tinput:", "" }),
    t({ "\t\t" }), i( 3, "tuple" ), t({ " " }), i(4, "varname"),
    t({ "", "\toutput:", "" }),
    t({ "\t\t" }), i( 5, "tuple" ), t({ " " }), i(6, "varname"), t({ ", emit: " }), i(7, "label"),
    t({ "", "\tshell:", "" }),
    t({ "\t\t'''", "" }),
    t({ "\t\t" }), i(0, "script"),
    t({ "", "\t\t'''", "" }),
    t({ "}" }),
  }),
})

-- Snippets for R
ls.add_snippets("r", {
  s("suppressPackageStartupMessages", {
    t({ "suppressPackageStartupMessages(library(" }), i(1, "package"), t({ "))", "" }),
  }),
})

ls.add_snippets("r", {
  s("ggplot", {
    t({ "ggplot(" }), i(1, "data.frame"), t({ ", aes("}), i(2, "aesthetics") ,t({ "))", "" }),
  }),
})
