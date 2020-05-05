
#ifndef BUFFER_STUFFER
#define BUFFER_STUFFER

#include "NanoLog.h"
#include "Packer.h"

#include <string>

// Since some of the functions/variables output below are for debugging purposes
// only (i.e. they're not used in their current form), squash all gcc complaints
// about unused variables/functions.
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-function"
#pragma GCC diagnostic ignored "-Wunused-variable"

/**
 * Describes a log message found in the user sources by the original format
 * string provided, the file where the log message occurred, and the line number
 */
struct LogMetadata {
  const char *fmtString;
  const char *fileName;
  uint32_t lineNumber;
  NanoLog::LogLevel logLevel;
};

// Start an empty namespace to enclose all the record(debug)/compress/decompress
// and support functions
namespace {

using namespace NanoLog::LogLevels;

} // end empty namespace

// Assignment of numerical ids to format NANO_LOG occurrences

// Start new namespace for generated ids and code
namespace GeneratedFunctions {

// Map of numerical ids to log message metadata
struct LogMetadata logId2Metadata[0] =
{
    
};

// Map of numerical ids to compression functions
ssize_t
(*compressFnArray[0]) (NanoLogInternal::Log::UncompressedEntry *re, char* out)
{
    
};

// Map of numerical ids to decompression functions
void
(*decompressAndPrintFnArray[0]) (const char **in,
                                        FILE *outputFd,
                                        void (*aggFn)(const char*, ...))
{
    
};

// Writes the metadata needed by the decompressor to interpret the log messages
// generated by compressFn.
long int writeDictionary(char *buffer, char *endOfBuffer) {
    using namespace NanoLogInternal::Log;
    char *startPos = buffer;
    
    return buffer - startPos;
}

// Total number of logIds. Can be used to bounds check array accesses.
size_t numLogIds = 0;

// Pop the unused gcc warnings
#pragma GCC diagnostic pop

}; // GeneratedFunctions

#endif /* BUFFER_STUFFER */