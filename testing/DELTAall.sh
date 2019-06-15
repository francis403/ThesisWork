

TEST_DIR="/home/deploy/Documents/utils/fuzzers/ThesisWork/testing"

CXXFILT_DIR="test_cxxfilt"
CXXFILT_EXEC="testDelta/DELTAcxxfilt.sh"

READELF_DIR="test_readelf"
READELF_EXEC="testDelta/delta.sh"

STRINGS_DIR="test_strings"
STRINGS_EXE="testDelta/DELTA.sh"

SIZE_DIR="test_size"
SIZE_EXE="testDELTA/deltaSize.sh"

#CXXFILT#

eval "$TEST_DIR/$CXXFILT_DIR/$CXXFILT_EXEC"

#READELF#

eval "$TEST_DIR/$READELF_DIR/$READELF_EXEC"

#STRINGS#

eval "$TEST_DIR/$STRINGS_DIR/$STRINGS_EXE"

#SIZE#

eval "$TEST_DIR/$SIZE_DIR/$SIZE_EXE"