return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local time = os.date("%H:%M")
		local date = os.date("%a %d %b")
		local v = vim.version()
		local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

		dashboard.section.header.val = {
"                                                                                                                                ",
"                                                                                                                                ",
"                                                                                                                                ",
"                                                                                                                                ",
"                                                                                                                                ",
"                                                                                                                                ",
"                                                                                                                                ",
"                                                                                                                                ",
"                                         ...    .                   .,..,.,,.*.,....,...                                        ",
"                                    , ,., ,*,  . *. .,/,*.*/*.,/.,     ,*//***/.*,,/*,..*// .  .                                ",
"                                 , ././/*// ***.*.*..,,,.,///., (,(*./  ,((/*(((((**(//(((/.* /,,*                              ",
"                             .**/.* ., *////,//(*//**///*/*,(//*(**,./** . /,(((((((((((//,(((/.((,.,                           ",
"                          ,***,.,. *((,(/,,(//*,/*,**,(/*/*(/,//((//,/,,,. ../**(((((((((*(/*,*,(,,,,,,                         ",
"                        ,,*,/**../((/((/***,//,*,***,*(,/(//((((.////*(*,* / */(((((((((/((//.//(**,(,. .                       ",
"                      *.*//*/,,..((((((*,,..*.,/,,/,*,////(/(/(((((((((*(/,/, /,*((/////(////*.,///(*,,                         ",
"                    *// (/** *, (((*****///****,.///(((((((((((((((((((((*.(,*..//(***.,/**(///,.,/./.  ,.                      ",
"                 .,***,(,/,/,..,/(*/*(((((((,/*/*/((/((((((((((((((((((**(/,**, ,/**,,.,**,,/(/**/ /,,.,*,                      ",
"                 ,*,//((*/.,*  *//.(/((((((/./,,//(((((((((((((((((/(/(/((,/.,/ .(, ., *.*,*,*,*.,. .  ,* .                     ",
"               ..**/(((****,* ./,.((((((/(/*,,(**/*(((/(((((((((((*/(,/*//*,*,*/, *,*..,,,*,,**..**.*..... .                    ",
"              . ,*/((, ..*/.. *..(.(((/*(/(.(((*(((,(*(**(///(*((*(*(,//*,,*...,,,*.,/.*,.*. . .,. . ,. ,.                      ",
"              /.*(//(*,,,.*.  ,.,//(/*//((,/,(/(,*(((.(./,.../,,(,,*/,/******,.,   *.*.,.., ,,*,/*./..,.                        ",
"            . ,*(/,/,..*.*..   ,.,/,/(/,,/(.*/,/./..* ././,,*/.*.*,.,,*,*/,,***.. ,* ,.,, .,,*,. .. .      .                    ",
"             . /*(*/*., .,.*.    ,,.*,*(*.**,**,/,**/,,,.*....,*,...,*,**,. .,..   ,  ,.,,           . ..,...                   ",
"            ..,,,(,,*.,.. ,..    . .*,/.*,/,/., *.**,*(,,/*/**,.*,,/,/,**,*/,***.  . ,.  . ..   .           ,.                  ",
"             ., /*/.,* ,. .,.     .,/,*.,(/.*,,*./**,.,,,/.  ,.*  ,,.*./,./*,...   /. /* ,.                  .                  ",
"              ..,///,.,  ,../*     . ././ .*/.*,,,/./,..*     *   . * ,,*..  . ,.. ..,/                  .                      ",
"               *,,.*(**, *.,...       , ...*,.,,//*,,*.   .,...      . . ,,.,.*,. * ,,/,                   .  .                 ",
"               .*.,,**,,**,,/,*/..     .,,.*  /,*/,,*//*                 .    .,  ,....                  .    ,                 ",
"               .,,*...,**   . ., ,        .**/(,.(./*                     ..*.,.*(,* (,                      , ,                ",
"               . /****,      .   .         ,/*(*(*                          *. .,/(/(.*                    , **.,               ",
"                 .,,*.  ,* /   .**.*         .**                          ,,. ,/, /*/.*.                   . ./...              ",
"                  .**  /,(*/ * /(/**/**..      .                            . .,,,/,/,*. ,                 .,* ,*,              ",
"                      ,. ***((,/,  ..*/,(/,. ,.,                            . .,* /(*/   *//*            .,*,,,,/               ",
"                           *.*(,/(/,..,/((/.* **.                          ,. **,,/       .,. **(*(/,...  **//*.                ",
"                         .,*,*... ,.,.. .((.,,, ,.                       ./, */(,   ., **.*... .      . .  .                    ",
"                                    .    .*,/, (.,                       //*(.(.  *./ ,**,*     *,     , .                      ",
"                            .     .    ,. . .*,.*,,(.               /.,,/(((,//                 **/.  ,                         ",
"                              ,*..   .     ,.  .**..,.(/       * *.   ..  *.,.*       .        ,..(/,*.                         ",
"                                      ,*.        ,,*, ., ,*   .. .  ,     (///*              ... /**.,.                         ",
"                                         //,  ,//(,.* *... .  ,.. *, .,*.(*.*((/((/*.**/*  * .**,/,..                           ",
"                                   . .  ..,    , *. ,,.*,*.**.,,  ./*(// (*///,*./,* , /*..,.*                                  ",
"                                                                   ,.,,.** /*.,*.*  . .(//.                                     ",
"                                                                             ..,  ..  .                                         ",
"                                                                                                                                ",
"                                                                                                                                ",
"                                                                                                                                ",
"                                                                                                                                ",
"                                                                                                                                ",
"                                                                                                                                ",
"                                                                                                                                ",
"                                                                                                                                ",
		}

		dashboard.section.header.opts.hl = "Comment"

		dashboard.section.buttons.val = {
			dashboard.button("n", "   New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("<C-p>", "󰮗   Find file", ":lua require('telescope.builtin').find_files({ search_dirs = vim.g.qnrd_get_project_dirs() })<CR>" ),
			dashboard.button("f", "   File Explorer", ":Oil<CR>"),
			dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("c", "   Configuration", ":cd ~/.config/nvim | :Telescope find_files<CR>"),
			dashboard.button("R", "󱘞   Ripgrep", ":Telescope live_grep<CR>"),
			dashboard.button("L", "   Lazy", ":Lazy<CR>"),
			dashboard.button("q", "󰗼   Quit", ":qa<CR>"),
		}

		local function centerText(text, width)
			local totalPadding = width - #text
			local leftPadding = math.floor(totalPadding / 2)
			local rightPadding = totalPadding - leftPadding
			return string.rep(" ", leftPadding) .. text .. string.rep(" ", rightPadding)
		end

		dashboard.section.footer.val = {
			centerText("", 50),
			" ",
			centerText(date, 50),
			centerText(time, 50),
			centerText(version, 50),
		}
		dashboard.section.footer.opts.hl = "Comment"

		alpha.setup(dashboard.opts)

		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
