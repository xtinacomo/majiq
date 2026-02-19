SRC="/data/NGD/2026_Elise_Organoid/snakemake_out/MAPPED"
DEST="/data/NGD/2026_Elise_Organoid/snakemake_out/MAJIQ/majiq/LINKS"

mkdir -p "$DEST"

for d in "$SRC"/Organoid_cDNA_*; do
    [ -d "$d" ] || continue

    sample=$(basename "$d")
    mkdir -p "$DEST/$sample"

    for f in "$d"/*.sorted.bam "$d"/*.sorted.bam.bai; do
        [ -e "$f" ] || continue
        ln -sfn "$f" "$DEST/$sample/$(basename "$f")"
    done
done
