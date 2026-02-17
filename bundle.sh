#!/bin/bash

#  Manager Operating System (MOS) Bundle Generator
#  
#  Purpose: Compile all MOS files into a single bundled markdown file for AI platforms.
#  Use case: Gemini, or any platform where reducing file count or simplifying uploads is needed.
#  
#  Usage:
#    ./bundle.sh
#  
#  Output: Creates a single compiled markdown file in bundle/ directory:
#    - mos_compiled.md (all OS layers in one file)
#  
#  How it works:
#    - All source files are concatenated in layer order (00_BOOT → 05_COMMANDS)
#    - File boundaries are marked with HTML comments (invisible to rendering)
#    - Original file paths are preserved as markers for easy navigation
#    - Cross-references in the compiled file work exactly as in individual files
#  
#  Deployment:
#    1. Run: ./bundle.sh
#    2. Upload bundle/mos_compiled.md to your AI platform as a knowledge file
#    3. Paste 05_COMMANDS/system_prompt.md into Custom Instructions (not as a file)
#    4. Test with: init_week

set -e

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUNDLE_DIR="$REPO_ROOT/bundle"
OUTPUT_FILE="$BUNDLE_DIR/mos_compiled.md"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Manager Operating System (MOS) Bundle Generator${NC}"
echo "=================================================="
echo ""

# Verify we're in the right directory
if [ ! -d "$REPO_ROOT/01_KERNEL" ]; then
  echo -e "${RED}Error: MOS repository structure not found.${NC}"
  echo "Please run this script from the MOS repository root."
  exit 1
fi

# Clean and create bundle directory
if [ -d "$BUNDLE_DIR" ]; then
  rm -rf "$BUNDLE_DIR"
fi
mkdir -p "$BUNDLE_DIR"

echo -e "${BLUE}→ Compiling all MOS files into single bundle${NC}"
echo ""

# Helper function to add file to bundle
add_file_to_bundle() {
  local source_file=$1
  
  if [ ! -f "$source_file" ]; then
    echo -e "${YELLOW}Warning: File not found: $source_file${NC}"
    return
  fi
  
  # Add file separator (HTML comment) and relative path header
  {
    echo ""
    echo "<!-- ═══════════════════════════════════════════════════════════ -->"
    echo "<!-- SOURCE FILE: ${source_file#$REPO_ROOT/} -->"
    echo "<!-- ═══════════════════════════════════════════════════════════ -->"
    echo ""
    cat "$source_file"
  } >> "$OUTPUT_FILE"
}

# Create bundle header
{
  echo "# Manager Operating System (MOS) — Compiled Bundle"
  echo ""
  echo "> **This is a complete MOS compilation** containing all layers and files in a single document."
  echo ""
  echo "## Structure"
  echo ""
  echo "Files are organized by layer and separated by HTML comments with their original paths:"
  echo ""
  echo "- Layer 00: System Manual & Onboarding"
  echo "- Layer 01: Portable Kernel (Philosophy, Protocols, Personal DNA)"
  echo "- Layer 02: Company Context (Mission, Strategy)"
  echo "- Layer 03: Team Configuration (Team OS, Player Cards)"
  echo "- Layer 04: Current Processes (Tactical Plan)"
  echo "- Layer 05: Command Reference (All 14 operations)"
  echo ""
  echo "To find specific content, search for: \`<!-- SOURCE FILE: [path] -->\`"
  echo ""
  echo "---"
  echo ""
} > "$OUTPUT_FILE"

# Add files in order
add_file_to_bundle "$REPO_ROOT/00_BOOT/README.md"
add_file_to_bundle "$REPO_ROOT/01_KERNEL/manager_operating_system.md"
add_file_to_bundle "$REPO_ROOT/01_KERNEL/manager_decision_protocol.md"
add_file_to_bundle "$REPO_ROOT/01_KERNEL/personal_dna.md"
add_file_to_bundle "$REPO_ROOT/02_CONFIG/company_operating_system.md"
add_file_to_bundle "$REPO_ROOT/02_CONFIG/company_strategy.md"
add_file_to_bundle "$REPO_ROOT/03_DRIVERS/team_operating_system.md"

# Add all player cards (glob pattern)
player_cards=("$REPO_ROOT"/03_DRIVERS/player_card*.md)
if [ -e "${player_cards[0]}" ]; then
  for player_card in "${player_cards[@]}"; do
    add_file_to_bundle "$player_card"
  done
fi

add_file_to_bundle "$REPO_ROOT/04_PROCESSES/tactical_plan.md"
add_file_to_bundle "$REPO_ROOT/05_COMMANDS/command_reference.md"

echo -e "${GREEN}✓ Bundle generation complete!${NC}"
echo ""
echo "Summary:"
echo "--------"

# Get file info
if [ -f "$OUTPUT_FILE" ]; then
  file_size=$(wc -c < "$OUTPUT_FILE")
  size_kb=$((file_size / 1024))
  line_count=$(wc -l < "$OUTPUT_FILE")
  echo "  mos_compiled.md — ${size_kb} KB, ${line_count} lines"
fi

echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Upload bundle/mos_compiled.md to your AI platform"
echo "  2. Paste 05_COMMANDS/system_prompt.md into Custom Instructions"
echo "  3. Test with: init_week"
echo ""
