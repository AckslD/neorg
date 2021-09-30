--[[
Custom gtd queries, that respect the neorg GTD specs (:h neorg-gtd-format)

REQUIRES:
- core.norg.dirman              for file operations
- core.queries.native           to use queries and customize them
- core.integrations.treesitter  to use ts_utils

SUBMODULES:
* RETRIEVERS:
Exposes functions to retrieve useful stuff from gtd files
- get               retrieve a table of { node, bufnr } for the type specified
- get_at_cursor     retrieve the content under the cursor ({ node, bufnr}) for the type specified
- add_metadatas     add metadatas to the content returned by `get`
* CREATORS:
Exposes functions to create stuff in files
- create                        create (task, project,...) in specified location in file
- get_end_project               get the end col of a metadata completed project node
- get_end_document_content      get the end col of the document content
* MODIFIERS:
Exposes functions to modify gtd stuff

--]]

require("neorg.modules.base")
local module = neorg.modules.create("core.gtd.queries")
local utils = require("neorg.external.helpers")

module.setup = function()
    return {
        success = true,
        requires = {
            "core.norg.dirman",
            "core.queries.native",
            "core.integrations.treesitter",
        },
    }
end

module = utils.require(module, "helpers")
module = utils.require(module, "retrievers")
module = utils.require(module, "creators")
module = utils.require(module, "modifiers")

return module
