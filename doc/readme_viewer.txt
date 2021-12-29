*readme-viewer.txt*	Viewing plugin's README(.md) easily like vim help

Author: Hibiki <4513echo@gmail.com>
License: MIT License
URL: https://github.com/4513ECHO/vim-readme-viewer

==============================================================================
CONTENTS					*readme-viewer-contents*

Introduction					|readme-viewer-introdution|
Interface					|readme-viewer-interface|
  Commands					|readme-viewer-commands|
  Variables					|readme-viewer-variables|
  Autocommands					|readme-viewer-autocommands|
About						|readme-viewer-about|

==============================================================================
INTRODUCTION					*readme-viewer-introdution*

*readme-viewer* or *vim-readme-viewer* help you to view some installed plugins'
README(.md) file easily like vim help file. Viewing vim help file is very easy.
Only `:help {topic}`! This plugin usage is also easy. If you are using
|dein.vim|, please try:
>
	:DeinReadme dein.vim
	:DeinReadme vim-readme-viewer

If you are using other plugin managers, please try:

>
	:PlugReadme vim-readme-viewer  " for vim-plug
	:PackReadme vim-readme-viewer  " for minpac
	:PackerReadme vim-readme-viewer  " for packer.nvim

Note: Basically vim-readme-viewer automatically judge your using plugin
manager. However, it sometimes may fail. I recommend that you set manually
|g:readme_viewer#plugin_manager| to plugin manager.

>
	let g:readme_viewer#plugin_manager = 'dein.vim'  " for dein.vim
	let g:readme_viewer#plugin_manager = 'vim-plug'  " for vim-plug
	let g:readme_viewer#plugin_manager = 'minpac'  " for minpac
	let g:readme_viewer#plugin_manager = 'packer.nvim'  " for packer.nvim

Note: On default, vim-plug is not register itself as a plugin. So,
vim-readme-viewer cannot open vim-plug's README.md. If you want to view
vim-plug's README.md, you register vim-plug as a plugin.
>
	Plug 'junegunn/vim-plug'

Note: This plugin is working with |dein.vim|, |vim-plug|, |minpac| and
|packer.nvim| now.

==============================================================================
INTERFACE					*readme-viewer-interface*

------------------------------------------------------------------------------
COMMANDS					*readme-viewer-commands*

:DeinReadme {plugin}				*:DeinReadme*
	Open plugin's README(.md) viewing window.

Note: |:vertical|, |:botright|, |:topleft|, and some command mofifier is not
working when using with |:DeinReadme|.

:PlugReadme {plugin}				*:PlugReadme*
	This is same as |:DeinReadme|. Please see it.

:PackReadme {plugin}				*:PackReadme*
	This is same as |:DeinReadme|. Please see it.

:PackerReadme {plugin}				*:PackerReadme*
	This is same as |:DeinReadme|. Please see it.

:ReadmeHelp					*:ReadmeHelp*
	Open current buffer plugin on |:help|. It sometimes fails when the
	plugin doesn't have itself help file.

:ReadmeDir					*:ReadmeDir*
	Open. It is same as `:edit %:p:h` . It is useful when you use some
	filer plugins. (e.g. |netrw|)

------------------------------------------------------------------------------
VARIABLES					*readme-viewer-variables*

g:readme_viewer#plugin_manager		*g:readme_viewer#plugin_manager*
			string (default: empty)
	Your using plugin manager. This variable controls command you can use.
	If you omit it, vim-readme-viewer automatically judge your using
	plugin manager. I recommend that you set it manually.
	value		command~
	"|dein.vim|"	|:DeinReadme|
	"|vim-plug|"	|:PlugReadme|
	"|minpac|"	|:PackReadme|
	"|packer.nvim|"	|:PackerReadme|

b:readme_data					*b:readme_data*
			dict
	Information of current buffer plugin. It is useful to custom this
	plugin.

	key		value~
	path		plugin installed directory
			(e.g. `/home/user/.vim/plugged/vim-readme-viewer`)
	name		plugin name (e.g. `vim-readme-viewer`)
	normalized_name	normalized plugin name
			(e.g. `readme-viewer`, `dein`, `packer`)

g:readme_viewer#open_help_buffer	*g:reame_viewer#open_help_buffer*
			boolean (default: |v:true|)
	Configure README buffer's motion. If you don't set this variables,
	README buffer's 'buftype' is setted "help". Please see also
	|special-buffers|.

g:readme_viewer#no_mappings			*g:readme_viewer#no_mappings*
			boolean (default: |v:false|)
	Disable buffer local mappings when README is opened. If you don't set
	this variables, you can use `q` to close README window.

g:readme_viewer#no_buffer_commands	*g:readme_viewer#no_buffer_commands*
			boolean (default: |v:false|)
	Disable buffer local commands when README is opened. If you don't set
	this variables, you can use |:ReadmeHelp| and |:ReadmeDir|.

------------------------------------------------------------------------------
AUTOCOMMANDS					*readme-viewer-autocommands*

ReadmeOpen					*ReadmeOpen*
	Invoked when a README is opened. It is useful to configure some
	buffer local mappings and commands.

==============================================================================
ABOUT						*readme-viewer-about*

|vim-readme-viewer| is developed by Hibiki(4513ECHO) and licensed under the
MIT License. Visit the project page for the latest version:

	https://github.com/4513ECHO/vim-readme-viewer

==============================================================================
vim:tw=78:ts=8:ft=help:norl:noet:fen:
