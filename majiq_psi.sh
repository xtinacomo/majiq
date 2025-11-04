#!/usr/bin/env bash
set -euo pipefail


module load majiq
#directories 
BUILD_DIR="results/build/"     # contains *.majiq + splicegraph.sql
OUT="results/psi/tia1_p351l/"        # output folder for psi & diff

mkdir -p "$OUT" "$OUT/diff"

#lists of files 
parental_soma=(TTUr1018 TTUr1030 TTUr1048 TTUr1066 TTUr1078 TTUr1096 TTUr1112 TTUr1128 TTUr1144
          TTUr1164 TTUr1176 TTUr1192 TTUr1210 TTUr1222 TTUr1258 TTUr1288 TTUr1310 TTUr1323)

mutant_soma=(TTUr1046 TTUr1094 TTUr1190 TTUr1239 TTUr1240 TTUr1286)

#grab files
parental_files=()
for s in "${parental_soma[@]}"; do
  f="$BUILD_DIR/$s.majiq"
  [[ -f "$f" ]] || { echo "Missing .majiq: $f" >&2; exit 1; }
  parental_files+=("$f")
done

mutant_files=()
for s in "${mutant_soma[@]}"; do
  f="$BUILD_DIR/$s.majiq"
  [[ -f "$f" ]] || { echo "Missing .majiq: $f" >&2; exit 1; }
  mutant_files+=("$f")
done

# grab splicegraph
SG=$(find "$BUILD_DIR" -maxdepth 1 -name "splicegraph.sql" | head -n1)
[[ -f "$SG" ]] || { echo "Could not find splicegraph.sql in $BUILD_DIR" >&2; exit 1; }
echo "Using splicegraph: $SG"

#PSI per group
majiq psi -o "$OUT" -n parental_soma    "${parental_files[@]}"    -j 2
majiq psi -o "$OUT" -n mutant_soma "${mutant_files[@]}" -j 2

#Differential splicing
majiq deltapsi \
  -o "$OUT/diff" \
  -n parental_soma mutant_soma \
  -grp1 "${parental_files[@]}" \
  -grp2 "${mutant_files[@]}" \
  -j 2

# Export TSV from VOILA 
voila tsv -j 2 -f "$OUT/diff/diff.tsv" "$SG" "$OUT/diff"/*.dpsi.voila

#summary
echo "Outputs:"
ls -lh "$OUT"/parental_soma.psi* "$OUT"/mutant_soma.psi* || true
ls -lh "$OUT/diff"

