#include <iostream>
#include <cctype>
#include <string>

using namespace std;

bool esNumeroEntero(const string &cadena) {
    for (size_t i = 0; i < cadena.length(); i++) {
        if (!isdigit(cadena[i])) {
            return false;
        }
    }
    return true;
}

bool esPalabra(const string &cadena) {
    for (size_t i = 0; i < cadena.length(); i++) {
        if (!isalpha(cadena[i])) {
            return false;
        }
    }
    return true;
}

bool esCompuesta(const string &cadena) {
    bool tieneLetra = false, tieneNumero = false;
    for (size_t i = 0; i < cadena.length(); i++) {
        if (isalpha(cadena[i])) {
            tieneLetra = true;
        } else if (isdigit(cadena[i])) {
            tieneNumero = true;
        }
        if (tieneLetra && tieneNumero) {
            return true;
        }
    }
    return false;
}

int main() {
    string entrada;
    char repetir;

    do {
        cout << "Ingrese una cadena de caracteres: ";
        cin >> entrada;

        if (esNumeroEntero(entrada)) {
            cout << "Numero entero" << endl;
        } else if (esPalabra(entrada)) {
            cout << "Palabra" << endl;
        } else if (esCompuesta(entrada)) {
            cout << "Compuesta" << endl;
        } else {
            cout << "No clasificada" << endl;
        }

        cout << "\nDesea ejecutar el programa nuevamente? (s/n): ";
        cin >> repetir;
    } while (repetir == 's' || repetir == 'S');

    return 0;
}

