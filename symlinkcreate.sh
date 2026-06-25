SRC="/data/CARDPB2/users/comocn/scratch/results/star"
DEST="/data/comocn/majiq/LINKS2"

mkdir -p "$DEST"

for d in "$SRC"/TTUr*; do
    [ -d "$d" ] || continue

    sample=$(basename "$d")
    mkdir -p "$DEST/$sample"

    for f in "$d"/*.sorted.bam "$d"/*.sorted.bam.bai; do
        [ -e "$f" ] || continue
        ln -sfn "$f" "$DEST/$sample/$(basename "$f")"
    done
done
