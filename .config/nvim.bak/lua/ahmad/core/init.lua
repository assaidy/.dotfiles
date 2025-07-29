require("ahmad.core.options")
require("ahmad.core.keymaps")
require("ahmad.core.colors")

-- Silence the specific position encoding message
local notify_original = vim.notify
vim.notify = function(msg, ...)
    if
        msg
        and (
            msg:match 'position_encoding param is required'
            or msg:match 'Defaulting to position encoding of the first client'
            or msg:match 'multiple different client offset_encodings'
        )
    then
        return
    end
    return notify_original(msg, ...)
end
