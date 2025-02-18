const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');
const snakeSize = 20;
const snakeSpeed = 100; //milliseconds
const snake = [{ x: 3, y: 3 }];
let direction = 'right';
let foodX, foodY;
let intervalId;

function init() {
    canvas.width = 400;
    canvas.height = 400;
    generateFood();
    intervalId = setInterval(update, snakeSpeed);
}

function redirectToIndex() {
    window.location.href = '../index.html';
}

function update() {
    moveSnake();
    checkCollision();
    draw();
}

function moveSnake() {
    let newHead = { x: snake[0].x, y: snake[0].y };
    switch (direction) {
        case 'right':
            newHead.x++;
            break;
        case 'left':
            newHead.x--;
            break;
        case 'up':
            newHead.y--;
            break;
        case 'down':
            newHead.y++;
            break;
    }
    snake.unshift(newHead);

    if (newHead.x === foodX && newHead.y === foodY) {
        generateFood();
    } else {
        snake.pop();
    }
}

function checkCollision() {
    if (
        snake[0].x < 0 ||
        snake[0].x >= canvas.width / snakeSize ||
        snake[0].y < 0 ||
        snake[0].y >= canvas.height / snakeSize
    ) {
        clearInterval(intervalId);
        redirectToIndex();
    }
}

function generateFood() {
    foodX = Math.floor(Math.random() * (canvas.width / snakeSize));
    foodY = Math.floor(Math.random() * (canvas.height / snakeSize));
}

function draw() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.fillStyle = 'gold';
    ctx.fillRect(foodX * snakeSize, foodY * snakeSize, snakeSize, snakeSize);
    ctx.fillStyle = 'green';

    snake.forEach((segment) => {
        ctx.fillRect(segment.x * snakeSize, segment.y * snakeSize, snakeSize, snakeSize);
    });
}

init();

document.addEventListener('keydown', (e) => {
    switch (e.key) {
        case 'ArrowUp':
            if (direction !== 'down') direction = 'up';
            break;
        case 'ArrowDown':
            if (direction !== 'up') direction = 'down';
            break;
        case 'ArrowLeft':
            if (direction !== 'right') direction = 'left';
            break;
        case 'ArrowRight':
            if (direction !== 'left') direction = 'right';
            break;
    }
});

function checkSelfCollision() {
    for (let i = 1; i < snake.length; i++) {
        if (snake[i].x === snake[0].x && snake[i].y === snake[0].y) {
            clearInterval(intervalId);
            redirectToIndex();
        }
    }
}
