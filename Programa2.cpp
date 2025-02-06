
#include <iostream>
#include <sstream>
#include <cctype>

using namespace std;

bool esEntero(const string &str) {
    for (size_t i = 0; i < str.length(); i++) {
        if (!isdigit(str[i])) return false;
    }
    return true;
}

bool esPalabra(const string &str) {
    for (size_t i = 0; i < str.length(); i++) {
        if (!isalpha(str[i])) return false;
    }
    return true;
}

bool esCompuesta(const string &str) {
    bool tieneLetra = false, tieneNumero = false;
    for (size_t i = 0; i < str.length(); i++) {
        if (isalpha(str[i])) tieneLetra = true;
        if (isdigit(str[i])) tieneNumero = true;
    }
    return tieneLetra && tieneNumero;
}

int main() {
    string linea;
    char opcion;
    do {
        cout << "Ingrese una cadena de caracteres: ";
        getline(cin, linea);

        stringstream ss(linea);
        string palabra;
        int countEntero = 0, countPalabra = 0, countCompuesta = 0;

        while (ss >> palabra) {
            if (esEntero(palabra)) countEntero++;
            else if (esPalabra(palabra)) countPalabra++;
            else if (esCompuesta(palabra)) countCompuesta++;
        }

        cout << countEntero << " - entero, "
             << countPalabra << " - palabra, "
             << countCompuesta << " - compuesta" << endl;

        cout << "¿Desea ingresar otra cadena? (s/n): ";
        cin >> opcion;
        cin.ignore(); // Limpiar el buffer
    } while (opcion == 's' || opcion == 'S');

    return 0;
}

