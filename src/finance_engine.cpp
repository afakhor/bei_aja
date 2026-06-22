#include <stdint.h>
#include <vector>

extern "C" {
    // Fungsi untuk menghitung persentase perubahan harga
    double calculate_percentage_change(double current_price, double previous_close) {
        if (previous_close == 0) return 0.0;
        return ((current_price - previous_close) / previous_close) * 100.0;
    }

    // Fungsi untuk menghitung Simple Moving Average (SMA)
    double calculate_sma(const double* prices, int size) {
        if (size == 0) return 0.0;
        double sum = 0.0;
        for (int i = 0; i < size; ++i) {
            sum += prices[i];
        }
        return sum / size;
    }
}
