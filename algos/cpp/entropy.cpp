void ShannonEntropy()
{
    const wchar_t* filepath = LR"(C:\Installer.msi)";
    HANDLE hFile = CreateFileW(filepath, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
    if (hFile == INVALID_HANDLE_VALUE) {
        printf("Failed to open file %S, error %d\n", filepath, ::GetLastError());
        return;
    }
    DWORD bytes_read;
    BYTE buffer[32 * 1024];
    BYTE current_byte = 0;
    BYTE* buf_idx;
    DWORD tmp_bytes_read = 0;
    size_t total_bytes_read = 0;
    size_t bytes_frequency[UCHAR_MAX + 1];
    
    do {
        BOOL ret = ::ReadFile(hFile, buffer, sizeof(buffer) / sizeof(buffer[0]), &bytes_read, NULL);
        if (!ret) {
            printf("Failed to read file, error %d\n", ::GetLastError());
            return;
        }
        if (bytes_read == 0) {
            break;
        }
        tmp_bytes_read = bytes_read;
        total_bytes_read += tmp_bytes_read;
        buf_idx = buffer;
        do {
            current_byte = *buf_idx++;
            bytes_frequency[current_byte]++;
        } while (--tmp_bytes_read != 0);
    } while (bytes_read != 0);
    ::CloseHandle(hFile);

    double entropy = 0.0;
    for (DWORD i = 0; i < sizeof(bytes_frequency) / sizeof(bytes_frequency[0]); i++) {
        if (!bytes_frequency[i]) {
            continue;
        }
        double frequency = ((double)bytes_frequency[i] / total_bytes_read);
        entropy -= (frequency * log10(frequency));
    }
    entropy = (entropy) / log10((double)2);

    printf("Shannon entropy: %f\n", entropy);
}