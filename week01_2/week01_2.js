function setup() {
    initializeFields();
    createCanvas(500, 500);
}

function draw() {
    background(color(0xFF, 0xF7, 0xAA));
    fill(color(0xAA, 0xD8, 0xFF));
    rect(100, 100, 100, 150);
    rect(mouseX, mouseY, 100, 150);
}

function initializeFields() {
}
