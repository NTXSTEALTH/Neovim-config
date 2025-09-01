-- lua/snippets.lua
local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local f = ls.function_node

ls.add_snippets('all', {
    s('hello', {
        t('Hello, '),
        i(1, 'world'),
        t('!'),
    }),
    s("clo", {
        t("console.log("),
        i(1, "message"),
        t(");"),
        i(0),
    }),
    s('mdlink', {
        t('['),
        i(1, 'Link Text'),
        t(']('),
        i(2, 'https://example.com'),
        t(')'),
    }),
    -- Add more snippets as needed
})
