#include <iostream>
#include <fstream>
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
    string filename;
    cout << "Ingrese el nombre del archivo de texto: ";
    cin >> filename;
    cin.ignore();

    ifstream file(filename.c_str());

    if (!file) {
        cout << "Error al abrir el archivo." << endl;
        return 1;
    }

    stringstream buffer;
    buffer << file.rdbuf();
    string contenido = buffer.str();

    int total_caracteres_con_espacios = contenido.length();
    int total_caracteres_sin_espacios = 0;
    int total_lexemas = 0;
    int total_palabras = 0;
    int total_numeros = 0;
    int total_combinadas = 0;

    stringstream ss(contenido);
    string lexema;

    while (ss >> lexema) {   hola h
        total_lexemas++;
		total_caracteres_sin_espacios = total_caracteres_sin_espacios + lexema.length();


        if (esEntero(lexema)) total_numeros++;
        else if (esPalabra(lexema)) total_palabras++;
        else if (esCompuesta(lexema)) total_combinadas++;
    }

    cout << "Total de caracteres (con espacios): " << total_caracteres_con_espacios << endl;
    cout << "Total de caracteres (sin espacios): " << total_caracteres_sin_espacios << endl;
    cout << "Total de lexemas: " << total_lexemas << endl;
    cout << "Total de palabras: " << total_palabras << endl;
    cout << "Total de numeros: " << total_numeros << endl;
    cout << "Total de combinadas: " << total_combinadas << endl;

    return 0;
}
