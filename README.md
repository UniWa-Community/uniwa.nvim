# A colorscheme for Neovim inspired by the University of West Attica.

![image](https://github.com/uniwa-community/uniwa.nvim/assets/51170833/7563b8ed-0a24-4ecb-a663-0410b6172260)

Terminal theme:

![image2](https://github.com/uniwa-community/uniwa.nvim/assets/51170833/03b85100-b646-4694-b624-bcb6008e318b)




<!-- older previews -->
<!-- ![image](https://github.com/uniwa-community/uniwa.nvim/assets/51170833/a4bd424a-24b9-4805-a994-132c6699cf59) -->
<!---->
<!-- ![image2](https://github.com/uniwa-community/uniwa.nvim/assets/51170833/ce5c26bb-f7fd-4be4-98b7-26079670b792) -->

Colors based on the 3 colors of [UniWa's optical identity](https://www.uniwa.gr/to-panepistimio/optiki-taytotita/).

Blue:       `#123c64`

![blue](https://github.com/uniwa-community/uniwa.nvim/assets/51170833/7cb4dd84-5340-4c7b-bbb9-b59f8265441b)

Light Blue: `#67ade0`

![light](https://github.com/uniwa-community/uniwa.nvim/assets/51170833/6f49bbc6-c0e9-4f52-8fa5-30d4778bdabd)

Grey:       `#9d9d88`

![grey](https://github.com/uniwa-community/uniwa.nvim/assets/51170833/0fd0b0c7-f308-45a3-9d9e-22e0d1e04b9e)

# Variants



Default:

![Screenshot 2024-02-19 224600](https://github.com/uniwa-community/uniwa.nvim/assets/51170833/f2d1a365-33a3-4467-af71-814d441fc702)

uniwa-paper
![Screenshot 2024-02-19 224607](https://github.com/uniwa-community/uniwa.nvim/assets/51170833/497439a7-5528-4ad5-b5a5-583006d003df)

uniwa-light
![Screenshot 2024-02-19 224554](https://github.com/uniwa-community/uniwa.nvim/assets/51170833/81eee804-f808-489f-8cc7-221f72966794)

uniwa-dark
![Screenshot 2024-02-19 224548](https://github.com/uniwa-community/uniwa.nvim/assets/51170833/1f2d2fba-7177-4155-afdf-8dc460736c05)

# Install

```lua
-- with lazy
{
    'uniwa-community/uniwa.nvim',
}
```

# Usage

```vim
colorscheme uniwa
```

---

## Lualine

```lua
require("lualine").setup({
    theme = "uniwa"
})

```

# Building the colorscheme from source

First off it requires the following plugins to be installed:

* [lush](https://github.com/rktjmp/lush.nvim)

* [shipwright](https://github.com/rktjmp/shipwright.nvim)

```lua
'rktjmp/shipwright.nvim',
'rktjmp/lush.nvim',
```

After installing them, you can run `:Shipwright` in the repo's root directory, which will generate:

* a lua colorscheme in `./colors/uniwa.lua`

* a lualine theme in `./lua/lualine/themes/uniwa.lua`

#### Credits

Made with [Lush](https://github.com/rktjmp/lush.nvim) and 💙.
