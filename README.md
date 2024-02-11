A colorscheme for Neovim inspired by the University of West Attica.
===

![image](https://github.com/uniwa-community/uniwa.nvim/assets/51170833/a4bd424a-24b9-4805-a994-132c6699cf59)

![image2](https://github.com/uniwa-community/uniwa.nvim/assets/51170833/ce5c26bb-f7fd-4be4-98b7-26079670b792)

Colors based on the 3 colors of [UniWa's optical identity](https://www.uniwa.gr/to-panepistimio/optiki-taytotita/).

Blue:       `#123c64`

![blue](https://github.com/uniwa-community/uniwa.nvim/assets/51170833/7cb4dd84-5340-4c7b-bbb9-b59f8265441b)

Light Blue: `#67ade0`

![light](https://github.com/uniwa-community/uniwa.nvim/assets/51170833/6f49bbc6-c0e9-4f52-8fa5-30d4778bdabd)

Grey:       `#9d9d88`

![grey](https://github.com/uniwa-community/uniwa.nvim/assets/51170833/0fd0b0c7-f308-45a3-9d9e-22e0d1e04b9e)


Install
===

```lua
-- with lazy
{
    'UniWa-Community/uniwa.nvim',
    dependencies = {
        'rktjmp/lush.nvim',
        version = false, -- tested with last commit only :P
    }
}
```

Usage
===

```vim
colorscheme uniwa
```

---

Lualine:

```lua
require("lualine").setup({
    theme = "uniwa"
})

```

Credits
===

Made with [Lush](https://github.com/rktjmp/lush.nvim) and 💙.

See: http://git.io/lush.nvim for more information on Lush and a helper script
to setup your repo clone.

