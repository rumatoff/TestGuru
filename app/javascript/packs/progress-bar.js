document.addEventListener('turbolinks:load', () => {
    let progress = document.getElementById('bar');

    let currentQuestion = progress.dataset.value;
    let max = progress.dataset.max;
    
    let oneQuestionProgress = 100/max;
    let currentProgress = currentQuestion * oneQuestionProgress;

    progress.style.width = currentProgress + '%';
});
