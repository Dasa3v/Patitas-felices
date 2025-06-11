// main.js - alternar modo claro/oscuro y persistencia con localStorage
const toggleButton = document.getElementById('modeToggle');
const body = document.body;

// Inicializar modo desde localStorage
document.addEventListener('DOMContentLoaded', () => {
    const savedMode = localStorage.getItem('theme');
    if (savedMode) {
        body.classList.add(savedMode);
        toggleButton.textContent = savedMode === 'dark-mode' ? 'Modo Claro' : 'Modo Oscuro';
    }
});

// Cambiar modo y guardar
toggleButton.addEventListener('click', () => {
    if (body.classList.contains('dark-mode')) {
        body.classList.replace('dark-mode', 'light-mode');
        toggleButton.textContent = 'Modo Oscuro';
        localStorage.setItem('theme', 'light-mode');
    } else {
        body.classList.replace('light-mode', 'dark-mode');
        toggleButton.textContent = 'Modo Claro';
        localStorage.setItem('theme', 'dark-mode');
    }
});