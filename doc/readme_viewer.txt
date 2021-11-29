*readme-viewer.txt*	Viewing plugin's README(.md) easily as vim help

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

*readme-viewer* or *vim-readme-viewer* help you to view some plugins'
README(.md) file easily as vim help. Viewing vim help is very easy.
Only `:help topic`! This plugin usage is also easy. Please try:
>
	:DeinReadme dein.vim
	:DeinReadme vim-readme-viewer

Note: This plugin is working only with |dein.vim| now. However, I will support
other plugin managers such as |vim-plug|, |minpac|, |packer.nvim|.

==============================================================================
INTERFACE					*readme-viewer-interface*

------------------------------------------------------------------------------
COMMANDS					*readme-viewer-commands*

:DeinReadme {plugin}				*:DeinReadme*
	Open plugin's README(.md) viewing window.

Note: |:vertical|, |:botright|, |:topleft|, and some command mofifier is not
working when using with |:DeinReadme|.

:ReadmeHelp					*:ReadmeHelp*
	Open current buffer plugin on |:help|. It sometimes may fail.

:PlugReadme					*:PlugReadme*
	See also |:DeinReadme|.

:PackReadme					*:PackReadme*
	See also |:DeinReadme|.

------------------------------------------------------------------------------
VARIABLES					*readme-viewer-variables*

g:readme_viewer#plugin_manager		*g:readme_viewer#plugin_manager*
			string (default: "|dein.vim|")
	Plugin manager you use. This variable controls command you can use.
	value		command~
	"dein.vim"	|:DeinReadme|
	"vim-plug"	|:PlugReadme|
	"minpac"	|:PackReadme|

b:readme_data					*b:readme_data*
			dict
	Information of current buffer plugin. It is useful to custom this
	plugin.

	key		value~
	path		plugin installed directory
	name		plugin name
	normalized_name	normalized plugin name

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
	this variables, you can use |:ReadmeHelp|.

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
