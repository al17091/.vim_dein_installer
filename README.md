# .vim_dein_installer

This is Installer for .vimrc and dein(plugin manager)

# requirement

* git
* ctags
* python3
* vim 8.0
* vim support("+python3")  
を必要をします。+python3は推奨、なくても最低限の動きはある。

# Installation

linux 対応  
'''in terminal  
git clone https://github.com/al17091/.vim_dein_installer.git  
cd .vim_dein_installer  
sh ./installer.sh  
'''  

# Note

vim --versionの中に-python3とある場合、deopleteに影響があるため  
~/.vim/dein/dein.toml line71以降を#でコメントアウトてください  
ctagsとgitとpython3がない場合、インストールせずに終了します。  

# Author

* al17091
