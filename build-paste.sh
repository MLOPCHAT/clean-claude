#!/bin/zsh
# Builds install-paste.txt: the one block you paste into a new Terminal window to install clean claude.
cd "${0:A:h}" || exit 1
for f in src/clean src/brutal-save src/CLAUDE.md; do
  if tail -n +2 "$f" | grep -q '!'; then print "refusing: $f contains '!' (breaks pasting into zsh)"; exit 1; fi
done
{
  print -r -- 'mkdir -p ~/.clean-claude/bin'
  print -r -- "printf '#\\041/bin/zsh\\n' > ~/.clean-claude/bin/clean"
  print -r -- "cat >> ~/.clean-claude/bin/clean <<'CLEAN_CLAUDE_MAIN_EOF'"; tail -n +2 src/clean; print -r -- 'CLEAN_CLAUDE_MAIN_EOF'
  print -r -- "printf '#\\041/bin/zsh\\n' > ~/.clean-claude/bin/brutal-save"
  print -r -- "cat >> ~/.clean-claude/bin/brutal-save <<'CLEAN_CLAUDE_BRUTAL_EOF'"; tail -n +2 src/brutal-save; print -r -- 'CLEAN_CLAUDE_BRUTAL_EOF'
  print -r -- "cat > ~/.clean-claude/CLAUDE.md <<'CLEAN_CLAUDE_MD_EOF'"; cat src/CLAUDE.md; print -r -- 'CLEAN_CLAUDE_MD_EOF'
  print -r -- 'zsh ~/.clean-claude/bin/clean --setup'
} > install-paste.txt
print "built install-paste.txt ($(wc -l < install-paste.txt | tr -d ' ') lines)"
