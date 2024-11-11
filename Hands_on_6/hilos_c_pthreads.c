#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// Función que será ejecutada por los hilos
void *print_message_function(void *ptr) {
    char *message = (char *)ptr;
    printf("%s\n", message);
    pthread_exit(NULL); // Termina el hilo
}

int main() {
    pthread_t thread1, thread2;
    char *message1 = "Este es el hilo 1";
    char *message2 = "Este es el hilo 2";
    
    // Creación e inicialización de los hilos
    int result1 = pthread_create(&thread1, NULL, print_message_function, (void *)message1);
    int result2 = pthread_create(&thread2, NULL, print_message_function, (void *)message2);
    
    // Verificar si la creación fue exitosa
    if (result1 || result2) {
        fprintf(stderr, "Error en la creación del hilo\n");
        exit(-1);
    }
    
    // Esperar a que los hilos finalicen
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    printf("Ambos hilos han terminado\n");
    return 0;
}
