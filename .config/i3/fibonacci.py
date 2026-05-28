#!/usr/bin/env python3
from i3ipc import Connection, Event

def set_split_direction(i3, e):
    # Obtenemos las dimensiones de la ventana enfocada
    rect = e.container.rect

    # Si la ventana es más ancha que alta, preparamos un corte horizontal (lado a lado)
    if rect.width > rect.height:
        e.container.command('split h')
    # Si es más alta que ancha, preparamos un corte vertical (arriba a abajo)
    else:
        e.container.command('split v')

def main():
    i3 = Connection()
    # Escuchamos cada vez que se enfoca una ventana
    i3.on(Event.WINDOW_FOCUS, set_split_direction)
    i3.main()

if __name__ == '__main__':
    main()
