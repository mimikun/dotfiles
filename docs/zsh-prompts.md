# zsh prompts

## Now using

- [spaceship]

## Prompts

### [starship]

- `human rights` are necessary for a good UX

#### Use

```zsh
export USE_SHELL_PROMPT="starship" >> ~/.zshrc
```

### [oh-my-posh]

- Cannot easily switch
- The setup method is "UNIQUE"

#### Use

```zsh
export USE_SHELL_PROMPT="oh-my-posh" >> ~/.zshrc
```

### [pure]

- Too simple

#### Install

```zsh
mkdir -p "$HOME/.zsh"
git clone --depth=1 https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
```

#### Use

```zsh
export USE_SHELL_PROMPT="pure" >> ~/.zshrc
```

### [spaceship]

- Cannot easily switch

#### Install

```zsh
mkdir -p "$HOME/.zsh"
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.zsh/spaceship"
```

#### Use

```zsh
export USE_SHELL_PROMPT="spaceship" >> ~/.zshrc
```

---

[starship]:https://github.com/starship/starship
[oh-my-posh]:https://github.com/jandedobbeleer/oh-my-posh
[pure]:https://github.com/sindresorhus/pure
[spaceship]:https://github.com/spaceship-prompt/spaceship-prompt
