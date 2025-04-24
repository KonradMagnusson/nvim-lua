return {
	"mbbill/undotree",
	config = function( _ )
		vim.g.undotree_HighlightChangedText = false
		vim.g.undotree_DiffAutoOpen = false
		vim.g.undotree_WindowLayout = 2
		vim.g.undotree_ShortIndicators = true
		vim.g.undotree_TreeNodeShape = "●"
		vim.g.undotree_TreeVertShape = "│"
		vim.g.undotree_TreeSplitShape = "╱"
		vim.g.undotree_TreeReturnShape = "╲"
		vim.g.undotree_DiffCommand = "git diff --no-index --diff-algorithm=histogram"
		vim.g.undotree_SplitWidth = 45
	end
}
