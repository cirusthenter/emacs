# My Setup for Emacs

## Install Emacs
I use Mac Catalina. Run another appropreate command to install if you use Linux, UNIX, Windows or others.

```
% brew install emacs
```

## Create `~/.emacs.d/init.el`
After emacs is installed, `~/.emacs.d` directory is automatically created. Make a config file named `init.el` and edit as you like.

```
% emacs ~/.emacs.d/init.el
```
Copy the `init.el` file in this git repository to your own `/.emacs.d/init.el`.

## Packages
### Connect to the package-archives
This step is not need for most of you, but it was for me. Try this if you fail to run the following package-install commands. Just in case.

```
M-x list-packages
```
Choose `Always`.

### Helm
You should install this interface before anything other.

```
M-x package-install RET helm RET
```

### Auto Complete Mode

```
M-x package-install RET auto-complete RET
```

### undohist

```
M-x package-install RET undohist RET
```

### undo-tree

```
M-x package-install RET undo-tree RET
```

### Flycheck

```
M-x package-install RET flycheck RET
```

### Flycheck error position tip

```
M-x package-install RET flycheck-pos-tip RET
```

### hungry-delete

```
M-x package-install RET hungry-delete RET
```
