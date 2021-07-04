# Add this config to vscode:
# 
#   "terminal.integrated.env.osx": {
#     "PROJECT_ROOT": "${workspaceFolder}"
#   },

if [ -n "${PROJECT_ROOT}" ]; then
    alias root='cd "$PROJECT_ROOT"'
fi