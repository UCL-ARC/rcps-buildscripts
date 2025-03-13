#!/usr/bin/env bash

set -e

datadir="${RFAA_DATA_DIR:-/shared/ucl/apps/RoseTTAFold-All-Atom_db}"
weightsdir="${RFAA_WEIGHTS_DIR:-/shared/ucl/apps/RoseTTAFold-All-Atom_db}"

target="${1:-.}"

echo "Preparing ${target} as an RFAA input directory."
echo ""
echo "Linking databases to ${target} directory..."
echo "${datadir}/bfd <- ${target}/bfd"
ln -sf ${datadir}/bfd ${target}/bfd
echo "${datadir}/pdb100_2021Mar03 <- ${target}/pdb100_2021Mar03"
ln -sf ${datadir}/pdb100_2021Mar03 ${target}/pdb100_2021Mar03
echo "${datadir}/UniRef30_2020_06 <- ${target}/UniRef30_2020_06"
ln -sf ${datadir}/UniRef30_2020_06 ${target}/UniRef30_2020_06
echo ""
echo "Linking weights to ${target} directory..."
echo "${weightsdir}/RFAA_paper_weights.pt <- ${target}/RFAA_paper_weights.pt"
ln -sf ${weightsdir}/RFAA_paper_weights.pt ${target}/RFAA_paper_weights.pt
echo ""
echo "Done."
echo ""
echo "Assuming you have the environment module correctly loaded, you can now run RFAA from inside this directory."
echo ""