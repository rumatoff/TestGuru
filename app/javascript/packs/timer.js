document .addEventListener('turbolinks:load', function(){
    let timer = document.querySelector('.timer');
    if (timer) {
        let countDown = timer.dataset.time;
        let updateCountDown = setInterval(function() {
            countDown--;
            minutes = parseInt(countDown / 60, 10);
            seconds = parseInt(countDown % 60, 10);
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;
            timer.innerHTML = minutes +":" +seconds;
            if (countDown <= 0) {
                clearInterval(updateCountDown);
                timer.innerHTML = "Время вышло";
                let form = document.getElementById('next');
                form.click();
            }
        }, 1000);
    }
});
