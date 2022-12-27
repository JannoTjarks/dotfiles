local db = require('dashboard')
db.preview_file_height = 11
db.preview_file_width = 70
db.custom_center = {
    { icon = '  ',
        desc = 'File Browser      ',
        action = 'NvimTreeOpen .'
    },
    { icon = '  ',
        desc = 'Find File         ',
        action = 'Telescope find_files find_command=rg,--hidden,--files',
    },
    { icon = '  ',
        desc = 'Find word         ',
        action = 'Telescope live_grep'
    },
    { icon = '  ',
        desc = 'Open Neovim config',
        action = 'NvimTreeOpen $HOME/.config/nvim'
    },
}
