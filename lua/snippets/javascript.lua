local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("clg", {           -- Trigger: clg
        t("console.log("),
        i(1, "message"), -- Insert node for user input
        t(");"),
    }),
    s("fun", { -- Trigger: fun
        t("function "),
        i(1, "functionName"),
        t("("),
        i(2, "args"),
        t(") {\n"),
        i(0), -- Final cursor position
        t("\n}"),
    }),
}
