#include <windows.h>
#include <string>
using namespace std;

int main(int argc, char* argv[])
{
    // Add all arguments to a single string.
    string arguments;
    if (argc >= 2) {
        for (int i = 1; i < argc; i++) {
            arguments += (argv[i]);
            if ((i + 1) != argc) {
                arguments += "\n";
            }
        }
    }
    else {
        arguments = "No argument passed.";
    }

    // Convert the string to a c_str.
    const char* output = arguments.c_str();

    // Allocate required memory and set clipboard data.
    const size_t len = (strlen(output) + 1);
    if (HGLOBAL hMem = GlobalAlloc(GMEM_MOVEABLE, len)) {
        if (PVOID pv = GlobalLock(hMem)) {
            memcpy(pv, output, len);
            GlobalUnlock(hMem);
            OpenClipboard(0);
            EmptyClipboard();
            SetClipboardData(CF_TEXT, hMem);
            CloseClipboard();
        }
    }

    return 0;
}