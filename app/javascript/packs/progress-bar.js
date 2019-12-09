document.addEventListener('turbolinks:load', () => {
    if (window.location.href.indexOf("test_passages") !== -1) {
        let progress = document.getElementById('bar');

        let currentQuestion = progress.dataset.value;
        let max = progress.dataset.max;

        let oneQuestionProgress = 100/max;
        let currentProgress = currentQuestion * oneQuestionProgress;

        progress.style.width = currentProgress + '%';
    }
});
